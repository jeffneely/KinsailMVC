--------------------------------------------------------------------------------
-- FUNCTIONS and PROCS script
--------------------------------------------------------------------------------

----------
-- Init --
--------------------------------------------------------------------------------

-- Change this to the proper DB as appropriate
USE [Kinsail_JNeely]
--USE [Kinsail]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--
-- Functions
--

-- Function to generate a UniqueId
CREATE FUNCTION fGetUniqueID(@Rand float) RETURNS bigint 
    AS
BEGIN 
    DECLARE @Counter int;
    DECLARE @UniqueID bigint;
    SET @UniqueID = ROUND(@Rand * 999999999999999999, 0);

    -- loop through to make sure the generated UniqueID isn't already in use
    -- if already in use, increment and check again (rinse, repeat)
    SET @Counter = 1;
    WHILE @Counter > 0
        BEGIN
            SELECT @Counter = COUNT(*) FROM EntryData WHERE UniqueID = @UniqueID;
            --PRINT @UniqueID
            SELECT @UniqueID = @UniqueID + @Counter
        END
    RETURN @UniqueID
END
GO


-- Function to get Site Type Name, given a Site Name
CREATE FUNCTION fGetSiteTypeName(@SiteName nvarchar(100)) RETURNS nvarchar(100) AS
BEGIN 
    DECLARE @SiteTypeName nvarchar(100);

    SELECT @SiteTypeName = ftv.Name
      FROM Items i
      JOIN ItemsXFeatures ixf ON i.ItemID = ixf.ItemID
      JOIN Features f ON f.FeatureID = ixf.FeatureID
      JOIN FeatureTypeValues ftv ON f.FeatureTypeID = ftv.FeatureTypeID
       AND ixf.Value = ftv.Value
     WHERE i.Name = @SiteName
       AND f.FeatureTypeID = (SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Site Type')

    RETURN @SiteTypeName
END
GO


--
-- Stored Procedures
--

-- Reserve a site
CREATE PROCEDURE ReserveSite
    @SiteName nvarchar(100),
    @StartDate datetime,
    @EndDate datetime
AS 
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    INSERT INTO [dbo].[ReservationResources]
               ([ItemID]
               ,[ResourceName]
               ,[ResourceDescription]
               ,[StartDateTime]
               ,[EndDateTime]
               ,[DateFormat]
               ,[MaxAvailable]
               ,[WarningAmount]
               ,[CartTimeoutSeconds]
               ,[MaxPurchaseQuantity]
               ,[UseResourceQuantity]
               ,[ResourceTypeID]
               ,[IsPersistent]
               ,[ResourceOrder]
               ,[DisplayCartDateTime]
               ,[Audit_ContactID])
         VALUES
               ((SELECT ItemID FROM Items WHERE Name = @SiteName) --ItemID
               ,dbo.fGetSiteTypeName(@SiteName) + ' Reservation' --ResourceName
               ,@SiteName + ' ' + CONVERT(nvarchar(30), @StartDate, 101) + '-' + CONVERT(nvarchar(30), @EndDate, 101) --ResourceDescription
               ,@StartDate --StartDateTime, datetime,>
               ,@EndDate --EndDateTime, datetime,>
               ,101 --DateFormat, int,>
               ,1 --MaxAvailable, bigint,>
               ,0 --WarningAmount, bigint,>
               ,990 --CartTimeoutSeconds, bigint,>
               ,1 --MaxPurchaseQuantity, bigint,>
               ,0 --UseResourceQuantity, bit,>
               ,(SELECT ResourceTypeID FROM ResourceTypes WHERE ResourceTypeName = 'Accomodation Reservation') --ResourceTypeID, bigint,>
               ,0 --IsPersistent, bit,>
               ,0 --ResourceOrder, bigint,>
               ,NULL --DisplayCartDateTime, varchar(30),>
               ,NULL --Audit_ContactID, bigint,>
               );
    INSERT INTO [dbo].[Reservations]
               ([UniqueID]
               ,[IdentifyingNumber]
               ,[ResourceID]
               ,[Quantity]
               ,[CartRefreshDateTime]
               ,[IsReserved]
               ,[Cancelled]
               ,[CookieID]
               ,[Audit_ContactID])
         VALUES
               (dbo.fGetUniqueID(rand()) --UniqueID
               ,1 --IdentifyingNumber
               ,@@Identity --ResourceID (from above)
               ,1 --Quantity
               ,getDate() --CartRefreshDateTime
               ,1 --IsReserved
               ,0 --Cancelled
               ,'' --CookieID
               ,NULL --Audit_ContactID
               );
    COMMIT TRANSACTION;
GO

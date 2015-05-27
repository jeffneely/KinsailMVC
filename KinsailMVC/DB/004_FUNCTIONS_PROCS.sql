--------------------------------------------------------------------------------
-- FUNCTIONS and PROCS script
--------------------------------------------------------------------------------

----------
-- Init --
--------------------------------------------------------------------------------

-- Change this to the proper DB as appropriate
--USE [Kinsail_JNeely]
USE [Kinsail]
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


-- Function to get a compact "Feature Bullet" string
CREATE FUNCTION fGetFeatureBullet(@Label nvarchar(1000), @LabelNegative nvarchar(1000), @Type nvarchar(100), @value nvarchar(1000)) RETURNS nvarchar(1000) AS
BEGIN 
	DECLARE @Bullet nvarchar(1000);

	SELECT @Bullet = 
		CASE @Type
			WHEN 'Boolean' THEN
				CASE @Value
					WHEN 1 THEN @Label
					ELSE @LabelNegative
				END
			ELSE @Label + ': ' + @Value
		END

	RETURN @Bullet
END
GO
--SELECT dbo.fGetFeatureBullet('Droids', 'No Droids', 'String', 20)


-- Grant EXECUTE permissions on the above functions to production user account
GRANT EXECUTE ON dbo.fGetUniqueID TO "Kinsail"
GRANT EXECUTE ON dbo.fGetSiteTypeName TO "Kinsail"
GRANT EXECUTE ON dbo.fGetFeatureBullet TO "Kinsail"
GO

-- Grant EXECUTE permissions on the above functions to production scheduled job user account
GRANT EXECUTE ON dbo.fGetUniqueID TO "scriptengine"
GRANT EXECUTE ON dbo.fGetSiteTypeName TO "scriptengine"
GRANT EXECUTE ON dbo.fGetFeatureBullet TO "scriptengine"
GO

-- Grant EXECUTE permissions on the above functions to staging user account
GRANT EXECUTE ON dbo.fGetUniqueID TO "JNeely-dev"
GRANT EXECUTE ON dbo.fGetSiteTypeName TO "JNeely-dev"
GRANT EXECUTE ON dbo.fGetFeatureBullet TO "JNeely-dev"
GO


--
-- Stored Procedures
--

--=======================================================================
-- ReserveSite
-- Creates reservation records for a camp site for a given span of dates
--
-- Uses return codes to communicate success/failure:
--   Returns 1-70 if an error or validation rule failure occurs
--   Returns 0 on success (if set to ValidateOnly)
--   Returns an integer >100 on success, representing the ReservationID
-- 
-- @Message OUTPUT variable will contain any error messages
--=======================================================================
CREATE PROCEDURE dbo.ReserveSite
	@SiteID bigint, 
	@StartDate date, 
	@EndDate date,
	@UniqueID bigint,
	@CartTimeout int = 900, --in seconds (900 = 15 mins)
	@ValidateOnly bit = 0, --if set to 1, will only perform validation and will skip creation of the reservation
	@Message varchar(160) = '' OUTPUT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON

	--param debugging
	--DECLARE @SiteID BIGINT = 715289
	--DECLARE @StartDate DATETIME = '2015-04-20'
	--DECLARE @EndDate DATETIME = '2015-04-24'
	--DECLARE @UniqueID BIGINT
	--DECLARE @CartTimeout int = 900 --in seconds (900 = 15 mins)
	--DECLARE @ValidateOnly bit = 0 --if set to 1, will only perform validation and will skip creation of the reservation
	--DECLARE @Message varchar(100) = '' 
	--SELECT @UniqueID = dbo.fGetUniqueID(RAND())

	--parameter validation
	--valid StartDate provided?
	IF (ISNULL(@StartDate, '') = '')
	BEGIN
		SET @Message = 'Parameter @StartDate=' + CONVERT(nvarchar(30), @StartDate, 101) + ' is invalid'
		RETURN 64
	END

	--valid EndDate provided?
	IF (ISNULL(@EndDate, '') = '')
	BEGIN
		SET @Message = 'Parameter @EndDate=' + CONVERT(nvarchar(30), @EndDate, 101) + ' is invalid'
		RETURN 65
	END

	--valid date range provided?
	IF (@StartDate > @EndDate)
	BEGIN
		SET @Message = 'Parameter @StartDate=' + CONVERT(nvarchar(30), @StartDate, 101) + ' must be less than or equal to @EndDate=' + CONVERT(nvarchar(30), @EndDate, 101)
		RETURN 66
	END

	--valid SiteID provided?
	IF NOT EXISTS (SELECT ItemID FROM Items WHERE ItemID = @SiteID)
	BEGIN
		SET @Message = 'Parameter @SiteID=' + CAST(@SiteID AS varchar(30)) + ' not found in the Items table'
		RETURN 67
	END

	--valid UniqueID provided?
	IF (ISNULL(@UniqueID, 0) <= 0)
	BEGIN
		SET @Message = 'Parameter @UniqueID is required and must be an integer greater than 0'
		RETURN 68
	END

	--UniqueID already in use?
	IF (SELECT COUNT(*) FROM Reservations WHERE UniqueID = @UniqueID) > 0
	BEGIN
		SET @Message = 'Reservation already exists for @UniqueID=' + CAST(@UniqueID AS varchar(30))
		RETURN 69
	END

	DECLARE @Result int = 0

	--validate reservation meets business rules (using a single query), encoding any errors as a binary result code:
	--   0 = meets all rules
	--   1 = reservation duration doesn't meet minimum stay requirement
	--   2 = reservation exceeds maximum weekend stay limit
	--   4 = reservation duration exceeds maximum stay limit
	--   8 = one or more days within the period are not on an active availability schedule
	--   16 = reservation request does not fall within advanced reservation window
	--   32 = site is not reservable
	SELECT @Result =
		CASE  --meets minimum stay requirement?
			WHEN COUNT(*) >= MAX(ar.MinDurationDays) THEN 0
			ELSE 1
		END +
		CASE  --meets maximum weekend limit?
			WHEN SUM(1 * IsResvWeekend) <= MIN(ISNULL(ar.MaxDurationWeekends, 999)) THEN 0
			ELSE 2
		END +
		CASE  --meets maximum stay limit?
			WHEN COUNT(*) <= MIN(ar.MaxDurationDays) THEN 0
			ELSE 4
		END +
		CASE  --all days on active availability schedule?
			WHEN COUNT(*) = COUNT(ar.ItemID) THEN 0
			ELSE 8
		END +
		CASE  --within advanced reservation window?
			WHEN COUNT(*) = SUM(CASE 
							    WHEN (DATEDIFF(DAY, GETDATE(), d.[Date]) BETWEEN ar.ReserveBeforeDays AND ar.AvailBeforeDays) THEN 1 
							    ELSE 0 
							END) THEN 0
			ELSE 16
		END +
		(1 - MIN(ixf.Value)) * 32  --site is reservable?
	 FROM Dates d
	CROSS JOIN Items s
	 LEFT JOIN ItemsXFeatures ixf ON s.ItemID = ixf.ItemID
	 LEFT JOIN (SELECT ixar.ItemID, 
				    dar.AvailID, dar.AvailStartDate, dar.AvailEndDate,
				    a.AvailBeforeDays, a.ReserveBeforeDays, a.MinDurationDays, a.MaxDurationDays, 
				    a.MaxDurationWeekends, a.BetweenStaysDays,
				    r.RateID, r.BaseFee, r.DailyFee, r.WeekdayFee, r.WeekendFee, r.DepositBaseFee, r.DepositDailyFee,
				    r.ProcessorBaseFee, r.ProcessorDailyFee, r.DepositPercent, r.ProcessorPercent
			    FROM ItemsXAvailRates ixar
			    JOIN Rates r 
				 ON ixar.RateID = r.RateID
			    JOIN DiscreteAvailabilityRanges dar 
				 ON ixar.AvailID = dar.AvailID
			    JOIN [Availability] a
				 ON dar.AvailID = a.AvailID
			 ) ar
	   ON s.ItemID = ar.ItemID
	  AND d.[Date] >= ar.AvailStartDate
	  AND d.[Date] <= ar.AvailEndDate
	WHERE s.ItemID = @SiteID
	  AND ixf.FeatureID = (SELECT FeatureID FROM Features WHERE Name = 'Reservable')
	  AND d.[Date] >= @StartDate
	  AND d.[Date] < @EndDate
	GROUP BY s.ItemID

	--any validation failures?
	IF (@Result > 1)
	BEGIN
		SELECT @Message = CASE
			WHEN @Result >= 32 THEN 'Validation failed: site is not reservable'
			WHEN @Result >= 16 THEN 'Validation failed: reservation request does not fall within advanced reservation window'
			WHEN @Result >= 8  THEN 'Validation failed: one or more days within the period are not on an active availability schedule'
			WHEN @Result >= 4  THEN 'Validation failed: reservation duration exceeds maximum stay limit'
			WHEN @Result >= 2  THEN 'Validation failed: reservation exceeds maximum weekend stay limit'
			WHEN @Result >= 1  THEN 'Validation failed: reservation duration doesn''t meet minimum stay requirement'
			ELSE ''
		END
		RETURN @Result
	END

	--already reserved within the requested date range?
	IF EXISTS (SELECT rr.ResourceID, rr.ItemID, rr.ResourceName, rr.ResourceDescription, rr.StartDateTime, rr.EndDateTime, r.ReservationID, r.UniqueID, r.IsReserved, r.Cancelled, 
			        --r.CartRefreshDateTime, GETDATE() AS Now, 
			          1 - r.IsReserved AS Temp, CASE IsReserved WHEN 0 THEN DATEDIFF(MINUTE, GETDATE(), DATEADD(SECOND, rr.CartTimeoutSeconds, r.CartRefreshDateTime)) WHEN 1 THEN NULL END AS ExpiresMins
			     FROM dbo.Reservations r
			     JOIN dbo.ReservationResources rr ON rr.ResourceID = r.ResourceID
			    WHERE rr.ItemID = @SiteID
			      AND r.Cancelled = 0 --disregard those marked cancelled
			      AND (r.IsReserved = 1 OR (r.CartRefreshDateTime > DATEADD(SECOND, -1 * rr.CartTimeoutSeconds, GETDATE()))) --only those fully reserved or those temporarily reserved and within the timerout period
			      AND rr.StartDateTime <= @EndDate --only those that start before our reservation's endDate
			      AND rr.EndDateTime >= @StartDate) --only those that end after our reservation's StartDate
	BEGIN
		SET @Message = 'Site is already reserved for one or more dates in the requested date range'
		RETURN 70
	END

	IF (@ValidateOnly = 1)
	BEGIN
		SET @Message = 'Site reservation validated'
		RETURN 0
	END

	DECLARE @ReservationID bigint = 0

	--validation passed, so INSERT/UPDATE the reservation records
	BEGIN TRANSACTION t1
		INSERT INTO dbo.ReservationResources (
			ItemID,
			ResourceName,
			ResourceDescription,
			StartDateTime,
			EndDateTime,
			[DateFormat],
			MaxAvailable,
			WarningAmount,
			CartTimeoutSeconds,
			MaxPurchaseQuantity,
			UseResourceQuantity,
			ResourceTypeID,
			IsPersistent,
			ResourceOrder,
			DisplayCartDateTime,
			Audit_ContactID
		)
		VALUES (
			@SiteID, --ItemID, bigint
			(SELECT l.Name
			   FROM Items s JOIN ItemsXItems ixi ON ixi.ItemID = s.ItemID JOIN Items l ON ixi.ParentItemID = l.ItemID
			  WHERE s.ItemID = @SiteID) + ' / Site ' + 
			(SELECT Name
			   FROM Items
			  WHERE ItemID = @SiteID) + ' Reservation', --ResourceName
			CONVERT(NVARCHAR(30), @StartDate, 107 ) + ' - ' + CONVERT(NVARCHAR(30), @EndDate, 107), --ResourceDescription
			@StartDate, --StartDateTime, datetime
			@EndDate, --EndDateTime, datetime
			107, --DateFormat, int
			1, --MaxAvailable, bigint
			0, --WarningAmount, bigint
			@CartTimeout, --CartTimeoutSeconds, bigint
			1, --MaxPurchaseQuantity, bigint
			1, --UseResourceQuantity, bit
			(SELECT ResourceTypeID
			   FROM ResourceTypes
			  WHERE ResourceTypeName = 'Accomodation Reservation'), --ResourceTypeID, bigint
			0, --IsPersistent, bit
			1, --ResourceOrder, bigint
			0, --DisplayCartDateTime, varchar(30)
			NULL --Audit_ContactID, bigint
		)

		INSERT INTO dbo.Reservations (
			UniqueID,
			IdentifyingNumber,
			ResourceID,
			Quantity,
			CartRefreshDateTime,
			IsReserved,
			Cancelled,
			CookieID,
			Audit_ContactID
		)
		VALUES (
			@UniqueID, --UniqueID
			1, --IdentifyingNumber
			SCOPE_IDENTITY(), --ResourceID (from above)
			1, --Quantity
			GETDATE(), --DATEADD(SECOND, @CartTimeout, GETDATE()), --CartRefreshDateTime
			0, --IsReserved
			0, --Cancelled
			'', --CookieID
			NULL --Audit_ContactID
		)

		SELECT @ReservationID = SCOPE_IDENTITY()
		SET @Message = 'Site reserved successfully (Result=ReservationID)'
	COMMIT TRANSACTION t1

	--this only works as long as ReservationID is 10 digits or less (as SPs can only return an INT this way, else use an OUTPUT param)
	RETURN @ReservationID
END
GO

-- Wrapped version of the ReserveSite SP which returns any output as a single result row 
-- (What Kinsail platform typically wants)
CREATE PROCEDURE [dbo].[ReserveSite2] 
	@SiteID bigint, 
	@StartDate date, 
	@EndDate date,
	@UniqueID bigint,
	@CartTimeout int = 900, --in seconds (900 = 15 mins)
	@ValidateOnly bit = 0 --if set to 1, will only perform validation and will skip creation of the reservation
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @ResultMsg varchar(160);
	DECLARE @Result int;

	EXEC @Result = dbo.ReserveSite
		@SiteID = @SiteID,
		@StartDate = @StartDate,
		@EndDate = @EndDate,
		@UniqueID = @UniqueID,
		@CartTimeout = @CartTimeout,
		@ValidateOnly = @ValidateOnly,
		@Message = @ResultMsg OUTPUT

	SELECT @Result AS Result, @ResultMsg AS Message
END
GO

-- Grant EXECUTE permissions on the above procedure to production user account
GRANT EXECUTE ON dbo.ReserveSite TO "Kinsail"
GRANT EXECUTE ON dbo.ReserveSite2 TO "Kinsail"
GO

-- Grant EXECUTE permissions on the above procedure to production scheduled job user account
GRANT EXECUTE ON dbo.ReserveSite TO "scriptengine"
GRANT EXECUTE ON dbo.ReserveSite2 TO "scriptengine"
GO

-- Grant EXECUTE permissions on the above procedures to staging user account
GRANT EXECUTE ON dbo.ReserveSite TO "JNeely-dev"
GRANT EXECUTE ON dbo.ReserveSite2 TO "JNeely-dev"
GO


-- Updates to standard Kinsail SP CompletePurchase:

-- =============================================
-- Author:		Tim Keough
-- Create date:	11/26/2006
-- Modified:	06/26/2007 [JFA] - fixed issue where registrations were not being properly waitlisted beyond the entry close date
--				04/03/2008 [JFA] - Updated to reflect changes to Items table
--				04/07/2008 [JFA] - Added in Client Charges changes
--				05/14/2008 [JFA] - Removed negative value check to allow for items to act as discounts
--				11/13/2008 [TBK] - Allowed negative value registration fees, to work with revenue sharing models
--				10/08/2010 [JFA] - No longer force-waitlisting registrations if it past the close date
--				01/16/2011 [RJH] - Update IsReserved for items with resources
--				01/20/2011 [JFA] - HAndles Resource Quantities correctly
--				03/28/2011 [JFA] - Passing @ItemID in to the discount script
--				10/17/2012 [JFA] - Updates Saved Registrations to set completed to 1
--				01/08/2014 [TBK] - Fixed bug where the query was limited to 4000 characters
--				04/30/2015 [JN ] - Added logic for handling Recreation Reservations (and some general clean-up)
-- Description:	This stored procedure processes the purchase to handle setting all the payment information correctly
--				and updates the approval code, etc.
-- Parameters:	UniqueID - the unique id for this purchase
--				GroupIDList - the comma delimited list of Group ids for this purchase
--				ItemIDList - the comma delimited list of Item ids for this purchase
--				ItemQuantityList - the comma delimited list of purchase quantities with each position matching the 
--				Item id in the same position in the Item id list
--				PaymentUpdate - the bit value indicating whether this is a payment update or not
--				UserCookie - a string that contains the user cookie.  This is used to update the user account with the current cookie
--				EmailFieldName - The field name for this registration to identify the registrant's email address
--				NameFieldPrefix - The prefix for the registrant field names (XXXFirstName and XXXLastName) that identifies the registrant first and last name
--				UseTempTable - This bit allows the generation of the payment amounts using a temp table, rather than the payment data table
--				Debug - This bit will toggle on the display of debugging info
-- =============================================
ALTER PROCEDURE [dbo].[CompletePurchase] (
	@UniqueID bigint,
	@GroupIDList varchar(MAX),
	@ItemIDList varchar(MAX),
	@ItemQuantityList varchar(MAX),
	@PaymentUpdate bit,
	@UserCookie varchar(250),
	@EmailFieldName varchar(250),
	@NameFieldPrefix varchar(250),
	@UseTempTable bit,
	@Debug bit = 0)
AS
BEGIN
	-- SET NOCOUNT ON added to stop extra result sets from interfering with SELECT statements
	SET NOCOUNT ON;
	SET ANSI_WARNINGS ON;
	
	--Debugging info
	IF (@Debug = 1) PRINT 'Start: ' + CONVERT(varchar(100), getdate()) + ' ' + CONVERT(varchar(3), DATEPART(Ss, getdate())) + ' ' + CONVERT(varchar(3), DATEPART(Ms, getdate()));
	
	DECLARE @FullQuery nvarchar(MAX) = '';
	
	-- first, if we are using a temp table, let's create it
	IF @UseTempTable = 1
		BEGIN
			CREATE TABLE #TempPaymentData (
				DataID bigint NOT NULL IDENTITY(1,1) PRIMARY KEY,
				UniqueID bigint NOT NULL,
				ChargeTypeID bigint NOT NULL,
				GroupID bigint NOT NULL,
				ItemID bigint NOT NULL,
				Amount float NOT NULL,
				PayDateTime datetime NOT NULL,
				Quantity int NOT NULL,
				WaitListed bit NOT NULL
			);
		END
	
	-- declare and set the defaults for the fees
	DECLARE @TotalFees float = 0;
	
	-- declare the variables for the standard information cursor values
	DECLARE @ItemName nvarchar(250);
	DECLARE @GroupName nvarchar(250);
	DECLARE @ItemID bigint;
	DECLARE @EarlyRegistrationCloseDate datetime;
	DECLARE @EarlyRegistrationEntryFee float;
	DECLARE @EarlyRegistrationRegistrationFee float
	DECLARE @EarlyRegistrationRegistrationFeeClientCharge float
	DECLARE @EntryFee float;
	DECLARE @RegistrationFee float;
	DECLARE @RegistrationPercentage float;
	DECLARE @RegistrationFeeClientCharge float;
	DECLARE @GroupID bigint;
	DECLARE @CancellationDate datetime
	DECLARE @ChargeInFee bit;
	DECLARE @MinEntryFee float;
	DECLARE @IncludedEntries int;
	DECLARE @GeneralRegistrationPercentage float;
	DECLARE @GeneralRegistrationFee float;
	DECLARE @MaxServiceCharge float;
	DECLARE @LateFee float;
	DECLARE @LateFeeRegistrationFee float;
	DECLARE @LateFeeRegistrationFeeClientCharge float;
	DECLARE @LateFeeDate datetime
	DECLARE @Individuals int;
	DECLARE @IsRecReservation bit;
	DECLARE @MaxEntries int;
	DECLARE @TotalEntries int;
	DECLARE @CheckFee float;
	DECLARE @DefaultApprovalCode varchar(100);
	DECLARE @ResourceQuantity bigint;
	
	-- declare the variables for the charge type cursor
	DECLARE @ChargeTypeName varchar(100);
	DECLARE @ChargeTypeID bigint;
	
	-- declare the processing variables
	DECLARE @LastGroupID bigint = 0;
	DECLARE @CurrentItemQuantity int = 0;
	DECLARE @RemainingIncludedEntries int = 0;
	DECLARE @ItemCounter int = 1;
	DECLARE @TotalItemCounter int = 0;
	DECLARE @CurrentEntryFee numeric(18, 2) = 0;
	DECLARE @CurrentRegistrationFee numeric(18, 2) = 0;
	DECLARE @CurrentRegistrationPercentage numeric(10, 5) = 0;
	DECLARE @CurrentRegistrationFeeClientCharge numeric(18, 2) = 0;
	DECLARE @CurrentLateFee numeric(18, 2) = 0;
	DECLARE @CurrentLateFeeRegistrationFee numeric(18, 2) = 0;
	DECLARE @CurrentLateFeeRegistrationFeeClientCharge numeric(18, 2) = 0;
	DECLARE @CurrentCheckFee numeric(18, 2) = 0;
	DECLARE @TempTotalEntryFees numeric(18, 2) = 0;
	DECLARE @PreviousTotalEntryFees numeric(18, 2) = 0;
	DECLARE @TotalServiceCharges numeric(18, 2) = 0;
	DECLARE @ExceededMaxServiceCharges bit = 0;
	DECLARE @WaitListed bit = 0;
	DECLARE @TotalWaitListed int = 0;
	DECLARE @InsertAmount numeric(18, 2) = 0;
	DECLARE @PastCloseDate bit;
	DECLARE @DiscountScript nvarchar(MAX);
	DECLARE @DiscountAmount numeric(18, 2);
	DECLARE @DiscountQuery nvarchar(MAX);
	DECLARE @CurrentDiscountAmount numeric(18, 2) = 0;
	DECLARE @ApplyDiscount bit;
	
	-- if this is not a payment update
	IF @PaymentUpdate = 0
		BEGIN
			--Debugging info
			IF (@Debug = 1) PRINT 'NOT a Payment Update';
			
			-- first, let's clear out the payments that are unrelated to this purchase
			EXEC DeletePaymentData @UniqueID, '', '', '', @GroupIDList, @ItemIDList, '';
			
			-- now, create a cursor to loop through the items to be purchased
			-- (using dynamic sql to inject the GroupID and ItemID lists into the query criteria)
			SET @FullQuery = N'DECLARE StandardInfoCursor CURSOR FOR
			SELECT
				gi.*,
				p.TotalEntries
			FROM
				(SELECT
					i.Name AS ItemName,
					g.Name AS GroupName,
					i.ItemID, i.EarlyRegistrationCloseDate,
					i.EarlyRegistrationEntryFee,
					i.EarlyRegistrationRegistrationFee,
					i.EarlyRegistrationRegistrationFeeClientCharge,
					i.EntryFee,
					i.RegistrationPercentage,
					g.GroupID,
					i.CancellationDate,
					g.ChargeInFee,
					i.RegistrationFee,
					i.RegistrationFeeClientCharge,
					g.MinEntryFee,
					g.IncludedEntries,
					g.GeneralRegistrationPercentage,
					g.GeneralRegistrationFee,
					g.MaxServiceCharge,
					i.LateFee,
					i.LateFeeRegistrationFee,
					i.LateFeeRegistrationFeeClientCharge,
					i.LateFeeDate,
					CASE
						WHEN CHARINDEX(it.Abbreviation, ''+'') > 0 THEN it.Individuals + 1
						ELSE it.Individuals
					END as Individuals,
					CASE
						WHEN it.ItemTypeID = (SELECT ItemTypeID FROM ItemTypes WHERE Name = ''Recreation Site'') THEN 1
						ELSE 0
					END AS IsRecReservation,
					i.MaxEntries,
					g.CheckFee,
					g.DefaultApprovalCode,
					CASE
						WHEN i.EntryCloseDate < GETDATE() THEN ''True''
						ELSE ''False''
					END AS PastCloseDate,
					CASE
						WHEN i.EarlyRegistrationCloseDate > GETDATE() THEN i.EarlyDiscountScript
						ELSE i.RegularDiscountScript
					END AS DiscountScript,
					i.DiscountAmount,
					CASE
						WHEN SUM(r.Quantity) IS NULL THEN 0
						ELSE SUM(r.Quantity)
					END AS ResourceQuantity
				FROM
					ItemTypes it,
					Groups g,
					Items i
					LEFT OUTER JOIN
						ReservationResources
						ON
						i.ItemID = ReservationResources.ItemID AND
						ReservationResources.UseResourceQuantity = 1
					LEFT OUTER JOIN
						Reservations r
						ON
						ReservationResources.ResourceID = r.ResourceID AND
						r.UniqueID = @qUniqueID AND
						(r.CartRefreshDateTime > DATEADD(ss, -1 * ReservationResources.CartTimeoutSeconds, GETDATE()) OR r.IsReserved = 1)
				WHERE
					i.ItemTypeID = it.ItemTypeID AND
					g.GroupID = i.GroupID AND
					g.Active = 1 AND
					i.Active = 1 AND
					g.GroupID IN (' + @GroupIDList + ') AND
					i.ItemID IN (' + @ItemIDList + ')
				GROUP BY
					i.Name,
					g.Name,
					i.ItemID, i.EarlyRegistrationCloseDate,
					i.EarlyRegistrationEntryFee,
					i.EarlyRegistrationRegistrationFee,
					i.EarlyRegistrationRegistrationFeeClientCharge,
					i.EntryFee,
					i.RegistrationPercentage,
					g.GroupID,
					i.CancellationDate,
					g.ChargeInFee,
					i.RegistrationFee,
					i.RegistrationFeeClientCharge,
					g.MinEntryFee,
					g.IncludedEntries,
					g.GeneralRegistrationPercentage,
					g.GeneralRegistrationFee,
					g.MaxServiceCharge,
					i.LateFee,
					i.LateFeeRegistrationFee,
					i.LateFeeRegistrationFeeClientCharge,
					i.LateFeeDate,
					it.Abbreviation,
					it.Individuals,
					it.ItemTypeID,
					i.MaxEntries,
					g.CheckFee,
					g.DefaultApprovalCode,
					i.EntryCloseDate,
					i.EarlyRegistrationCloseDate,
					i.EarlyDiscountScript,
					i.RegularDiscountScript,
					i.DiscountAmount,
					i.ReservationsRequired
				HAVING
					i.ReservationsRequired = 0 OR
					CASE
						WHEN SUM(r.Quantity) IS NULL THEN 0 
						ELSE SUM(r.Quantity)
					END > 0
				) gi
				LEFT OUTER JOIN
					(SELECT
						pd.GroupID,
						pd.ItemID,
						SUM(pd.Quantity) AS TotalEntries
					FROM 
						PaymentData pd,
						ConfirmationNumbers cn
					WHERE
						pd.UniqueID = cn.UniqueID AND
						pd.UniqueID <> @qUniqueID AND
						cn.ApprovalCode NOT LIKE ''OLD%'' AND
						cn.ApprovalCode NOT LIKE ''%TEST%'' AND
						cn.ApprovalCode NOT LIKE ''%CANCEL%'' AND
						cn.ApprovalCode NOT LIKE ''%REFUND%'' AND
						cn.ApprovalCode NOT LIKE ''%DECLINE%'' AND
						pd.ChargeTypeID = 1 AND
						pd.GroupID IN (' + @GroupIDList + ') AND
						pd.ItemID IN (' + @ItemIDList + ')
					GROUP BY
						pd.GroupID,
						pd.ItemID
					) p
					ON
						(gi.GroupID = p.GroupID AND 
						gi.ItemID = p.ItemID);'
			
			--debugging info
			--WARNING: the PRINT statement is limited to 8,000 chars or 4,000 nchars -- which means the below will likely truncate the FullQuery
			IF (@Debug = 1) PRINT 'Query: ' + @FullQuery;
			
			DECLARE @ParmDefinition nvarchar(31);
			SET @ParmDefinition = N'@qUniqueID bigint';
			EXECUTE sp_executesql @FullQuery, @ParmDefinition,
				@qUniqueID = @UniqueID;
			
			OPEN StandardInfoCursor;
			
			FETCH NEXT FROM
				StandardInfoCursor
			INTO
				@ItemName,
				@GroupName,
				@ItemID,
				@EarlyRegistrationCloseDate,
				@EarlyRegistrationEntryFee,
				@EarlyRegistrationRegistrationFee,
				@EarlyRegistrationRegistrationFeeClientCharge,
				@EntryFee,
				@RegistrationPercentage,
				@GroupID,
				@CancellationDate,
				@ChargeInFee,
				@RegistrationFee,
				@RegistrationFeeClientCharge,
				@MinEntryFee,
				@IncludedEntries,
				@GeneralRegistrationPercentage,
				@GeneralRegistrationFee,
				@MaxServiceCharge,
				@LateFee,
				@LateFeeRegistrationFee,
				@LateFeeRegistrationFeeClientCharge,
				@LateFeeDate,
				@Individuals,
				@IsRecReservation,
				@MaxEntries,
				@CheckFee,
				@DefaultApprovalCode,
				@PastCloseDate,
				@DiscountScript,
				@DiscountAmount,
				@ResourceQuantity,
				@TotalEntries;
			
			WHILE @@FETCH_STATUS = 0
				BEGIN
					--debugging info
					IF (@Debug = 1) PRINT 'Fetch Status: ' + CONVERT(varchar(32), @@FETCH_STATUS);
					IF (@Debug = 1) PRINT 'ItemName: ' + @ItemName;
					
					--SET @DescriptionList = @DescriptionList + ', ' + @Description;
					
					-- set the check fee to the maximum
					IF @CheckFee > @CurrentCheckFee
						BEGIN
							SET @CurrentCheckFee = @CheckFee;
						END
					
					-- set the quantity to the local variable	
					IF @ResourceQuantity > 0
						BEGIN
							SET @CurrentItemQuantity = @ResourceQuantity
						END
					ELSE
						BEGIN
							SET @CurrentItemQuantity = dbo.GetArrayValue(@ItemQuantityList, dbo.GetArrayPosition(@ItemIDList, @ItemID, 'EXACT', ','), ',');
						END
					
					--debugging info
					IF (@Debug = 1) PRINT 'Qty: ' + CONVERT(varchar(10), @CurrentItemQuantity);
					
					-- reset the values when we have a new Group in the batch
					IF @LastGroupID <> @GroupID
						BEGIN
							-- reset the total Item counter
							SET @TotalItemCounter = 0;
							-- reset the remaining included entries counter
							SET @RemainingIncludedEntries = @IncludedEntries;
							-- reset the Item counter
							SET @ItemCounter = 1;
						END
					
					-- determine the base entry/registration fees
					-- first, handle recreation site reservations (since they work a little differently)
					IF @IsRecReservation = 1
						BEGIN
							--debugging info
							IF (@Debug = 1) PRINT 'Handling as a Recreation Reservation'
							
							-- local vars
							DECLARE @StartDate date;
							DECLARE @EndDate date;
							DECLARE @ReservationFee float;
							DECLARE @ReservationDepositFee float;
							DECLARE @ReservationProcessorFee float;
							
							-- determine the start/end dates of the reservation in question
							SELECT
								@StartDate = rr.StartDateTime,
								@EndDate = rr.EndDateTime
							FROM
								Reservations r
								JOIN ReservationResources rr ON r.ResourceID = rr.ResourceID
							WHERE
								r.UniqueID = @UniqueID AND  --
								rr.ItemID = @ItemID;  --
							
							--debugging info
							IF (@Debug = 1) PRINT 'Date range: ' + CONVERT(nvarchar(30), @StartDate, 101) + ' - ' + CONVERT(nvarchar(30), @EndDate, 101)
							
							-- determine recreation site cost, given a UniqueID and ItemID (to look up the reservation details)
							SELECT 
								--s.ItemID, MAX(s.Name) AS SiteName,
								--COUNT(d.[Date]) AS Days, 
								--MIN(d.[Date]) AS FirstNight,
								--MAX(d.[Date]) AS LastNight,
								@ReservationFee = MAX(r.BaseFee) + SUM(r.DailyFee) + SUM(r.WeekdayFee * (1 - d.IsResvWeekend)) + SUM(r.WeekendFee * d.IsResvWeekend),
								@ReservationDepositFee = MAX(r.DepositBaseFee) + SUM(r.DepositDailyFee),
								@ReservationProcessorFee = MAX(r.ProcessorBaseFee) + SUM(r.ProcessorDailyFee)
							FROM
								DiscreteAvailabilityRanges a  -- view which splits and expands availability ranges
								JOIN ItemsXAvailRates ixr
									ON ixr.AvailID = a.AvailID
								JOIN Items s
									ON ixr.ItemID = s.ItemID
								JOIN Rates r
									ON ixr.RateID = r.RateID
								JOIN Dates d
									ON d.[Date] >= a.AvailStartDate AND d.[Date] <= a.AvailEndDate
							WHERE
								d.[Date] >= @StartDate AND  -- start date
								d.[Date] < @EndDate AND  -- end date
								s.ItemID = @ItemID  --site ItemID
							GROUP BY
								s.ItemID
							
							-- determine reservation fees (subtracting out the processor fee)
							-- if site costs involve a deposit, then only the deposit portion means anything (remaining costs handled externally)
							IF @ReservationDepositFee > 0
								BEGIN
									SET @CurrentEntryFee = @CurrentItemQuantity * @ReservationDepositFee - @ReservationProcessorFee
								END
							ELSE -- no deposit amount
								BEGIN
									SET @CurrentEntryFee = @CurrentItemQuantity * @ReservationFee - @ReservationProcessorFee
								END
							
							SET @CurrentRegistrationFee = @ReservationProcessorFee;
						END
					ELSE -- not a recreation site reservation, so handle traditionally
						BEGIN
							-- if before the early registration deadline
							IF GETDATE() <= @EarlyRegistrationCloseDate
								BEGIN
									-- set the temporary value with the full price
									SET @CurrentEntryFee = @CurrentItemQuantity * @EarlyRegistrationEntryFee;
									SET @CurrentRegistrationFee = @CurrentItemQuantity * @EarlyRegistrationRegistrationFee;
									SET @CurrentRegistrationPercentage = (@EarlyRegistrationEntryFee + @EarlyRegistrationRegistrationFee) * @RegistrationPercentage * @CurrentItemQuantity;
									SET @CurrentRegistrationFeeClientCharge = @CurrentItemQuantity * @EarlyRegistrationRegistrationFeeClientCharge;
								END
							ELSE -- if after the early registration deadline
								BEGIN
									-- set the temporary value with the full price
									SET @CurrentEntryFee = @CurrentItemQuantity * @EntryFee;
									SET @CurrentRegistrationFee = @CurrentItemQuantity * @RegistrationFee;
									SET @CurrentRegistrationPercentage = (@EntryFee + @RegistrationFee) * @RegistrationPercentage * @CurrentItemQuantity;
									SET @CurrentRegistrationFeeClientCharge = @CurrentItemQuantity * @RegistrationFeeClientCharge;
								END
						END
					
					--debugging info
					IF (@Debug = 1) PRINT 'Registration Fee: ' + CONVERT(varchar(12), @CurrentRegistrationFee)
					IF (@Debug = 1) PRINT 'Registration Pct: ' + CONVERT(varchar(12), @CurrentRegistrationPercentage);
					IF (@Debug = 1) PRINT 'Entry Fee: ' + CONVERT(varchar(12), @CurrentEntryFee)
					
					-- determine any late fees
					IF GETDATE() > @LateFeeDate
						BEGIN
							SET @CurrentLateFee = @CurrentItemQuantity * @LateFee;
							SET @CurrentLateFeeRegistrationFee = @CurrentItemQuantity * @LateFeeRegistrationFee;
							SET @CurrentRegistrationPercentage = @CurrentRegistrationPercentage + ((@CurrentLateFee + @CurrentLateFeeRegistrationFee) * @RegistrationPercentage);
							SET @CurrentLateFeeRegistrationFeeClientCharge = @CurrentItemQuantity * @LateFeeRegistrationFeeClientCharge;
						END
					
					--debugging info
					IF (@Debug = 1) PRINT 'Late Fee: ' + CONVERT(varchar(10), @CurrentLateFee)
					IF (@Debug = 1) PRINT 'Late Reg Fee: ' + CONVERT(varchar(10), @CurrentLateFeeRegistrationFee);
					
					-- increment the temporary total fees variable
					SET @TempTotalEntryFees = @TempTotalEntryFees + @CurrentEntryFee;
					
					-- now, override the base entry/registration fees if the item includes a limited number of entries (non-zero)
					IF @IncludedEntries > 0
						BEGIN
							-- If this is the first entry, then set the initial fees appropriately
							IF @ItemCounter = 1
								BEGIN
									-- the entry fee is the minimum fee minus the registration fees
									SET @CurrentEntryFee = @MinEntryFee - (@IncludedEntries * @RegistrationFee);
									-- the registration fees are the included entries times the registration fee per entry
									SET @CurrentRegistrationFee = @IncludedEntries * @RegistrationFee;
									-- the registration percentage is the minimum entry fee times the registration percentage
									SET @CurrentRegistrationPercentage = @MinEntryFee * @RegistrationPercentage;
									-- the registration fees are the included entries times the registration fee per entry
									SET @CurrentRegistrationFeeClientCharge = @IncludedEntries * @RegistrationFeeClientCharge;
								END
							ELSE -- not the first entry
								BEGIN
									-- next, set the entry fee to the number of entries selected minus the remaining included entries
									SET @CurrentEntryFee = @EntryFee * (@CurrentItemQuantity - @RemainingIncludedEntries);
									SET @CurrentRegistrationFee = (@CurrentItemQuantity - @RemainingIncludedEntries) * @RegistrationFee;
									SET @CurrentRegistrationPercentage = (@EntryFee * (@CurrentItemQuantity - @RemainingIncludedEntries)) * @RegistrationPercentage;
									-- reset the service percentage fee to zero, if it is less than zero
									IF @CurrentRegistrationPercentage < 0
										BEGIN
											SET @CurrentRegistrationPercentage = 0;
										END
								END
							
							-- reset the remaining entries equal to the included entries minus the current total entries
							SET @RemainingIncludedEntries = @IncludedEntries - @TotalItemCounter;
							
							-- if the remaining entries is negative, set it to zero
							IF @RemainingIncludedEntries < 0
								BEGIN
									SET @RemainingIncludedEntries = 0;
								END
						END
					ELSE -- if the entry fee covers any number of entries (IncludedEntries = 0)
						BEGIN
							IF @MinEntryFee > 0
								BEGIN
									IF @TempTotalEntryFees <= @MinEntryFee 
										BEGIN
											IF @ItemCounter > 1
												BEGIN
													-- set the entry fee to zero, since it is included
													SET @EntryFee = 0;
													-- make sure to apply the percentage to the minimum entry fee plus the per entry fee
													SET @CurrentRegistrationFee = @CurrentItemQuantity * @RegistrationFee;
													SET @CurrentRegistrationPercentage = @MinEntryFee * @RegistrationPercentage;
													SET @CurrentRegistrationFeeClientCharge = @CurrentItemQuantity * @RegistrationFeeClientCharge;
												END
											ELSE IF @ItemCounter = 1
												BEGIN
													SET @CurrentEntryFee = @MinEntryFee;
													SET @CurrentRegistrationFee = @CurrentItemQuantity * @RegistrationFee;
													SET @CurrentRegistrationPercentage = @MinEntryFee * @RegistrationPercentage;
													SET @CurrentRegistrationFeeClientCharge = @CurrentItemQuantity * @RegistrationFeeClientCharge;
												END
										END
									-- if the temp fees are greater than the min entry fee and this is not the first Item
									ELSE IF @TempTotalEntryFees > @MinEntryFee
										BEGIN
											SET @CurrentEntryFee = @TempTotalEntryFees - @PreviousTotalEntryFees;
											SET @CurrentRegistrationFee = @CurrentItemQuantity * @RegistrationFee;
											SET @CurrentRegistrationPercentage = (@TempTotalEntryFees - @MinEntryFee) * @RegistrationPercentage;
											SET @CurrentRegistrationFeeClientCharge = @CurrentItemQuantity * @RegistrationFeeClientCharge;
										END
								END
						END
					
					-- now, if the current entry fees are less than zero, let's set it to zero
					/*IF @CurrentEntryFee < 0
						BEGIN
							SET @CurrentEntryFee = 0;
						END*/
					
					--debugging info
					IF (@Debug = 1) PRINT 'Total Entries: ' + CONVERT(varchar(12), @TotalEntries);
					IF (@Debug = 1) PRINT 'Current Item Qty: ' + CONVERT(varchar(12), @CurrentItemQuantity);
					IF (@Debug = 1) PRINT 'Max Entries: ' + CONVERT(varchar(12), @MaxEntries);
					
					-- now, if we have too many entries already, set this as waitlisted
					IF (@TotalEntries + @CurrentItemQuantity > @MaxEntries AND @MaxEntries > 0)
						BEGIN
							SET @WaitListed = 1;
							SET @TotalWaitListed = @TotalWaitListed + 1;
							--PRINT @WaitListed;
							--PRINT @TotalWaitListed;
						END
					
					-- now, we need to handle maximum service charges from the Item level
					-- add the service fees to the total 
					SET @TotalServiceCharges = @TotalServiceCharges + @CurrentRegistrationFee + @CurrentRegistrationPercentage;
					
					--debugging info
					IF (@Debug = 1) PRINT 'Total Service Charge: ' + CONVERT(varchar(12), @TotalServiceCharges);
					IF (@Debug = 1) PRINT 'Max Service Charge: ' + CONVERT(varchar(12), @MaxServiceCharge);
					
					-- check to see if the service charges are more than the maximum and the maximum is not zero
					IF @MaxServiceCharge > 0 And @TotalServiceCharges > @MaxServiceCharge
						BEGIN
							IF @ExceededMaxServiceCharges = 0
								BEGIN
									-- set the service charges for this Item to be zero
									SET @CurrentRegistrationFee = (@CurrentRegistrationFee + @CurrentRegistrationPercentage) - (@TotalServiceCharges - @MaxServiceCharge);
									SET @CurrentRegistrationPercentage = 0;
									SET @ExceededMaxServiceCharges = 1;
								END
							ELSE
								BEGIN
									-- set the service charges for this Item to be zero
									SET @CurrentRegistrationFee = 0;
									SET @CurrentRegistrationPercentage = 0;
								END
						END
					
					-- handle the discounts
					-- reset the discount amount
					SET @CurrentDiscountAmount = 0;
					CREATE TABLE #TempDiscounts (DiscountAmount numeric(18,2) NULL);
					SET @DiscountQuery = 'DECLARE @UniqueID bigint;
						DECLARE @Quantity int;
						DECLARE @DiscountAmount numeric(18, 2);
						DECLARE @ItemID bigint;
						SET @UniqueID = ' + CONVERT(nvarchar(100), @UniqueID) + ';
						SET @Quantity = ' + CONVERT(nvarchar(100), @CurrentItemQuantity) + ';
						SET @DiscountAmount = ' + CONVERT(nvarchar(100), @DiscountAmount) + ';
						SET @ItemID = ' + CONVERT(nvarchar(100), @ItemID) + ';';
					SET @DiscountQuery = @DiscountQuery + '
						' + @DiscountScript;
					EXEC sp_executesql @DiscountQuery;
					SELECT @CurrentDiscountAmount = DiscountAmount 
					FROM #TempDiscounts;
					DROP TABLE #TempDiscounts;
					--PRINT @CurrentDiscountAmount;
					-- if the service fee is less than zero, we need to set it to zero
					--IF @CurrentRegistrationFee < 0 
					--	BEGIN
					--		SET @CurrentRegistrationFee = 0;
					--	END
					
					-- now, we need to insert the data into the PaymentData table
					-- to do so, we need to query the charge types out of the database
					-- and loop through them to insert the correct values for each charge type
					DECLARE 
						ChargeTypeCursor 
					CURSOR FORWARD_ONLY STATIC FOR 
					SELECT 
						ChargeTypeName, 
						ChargeTypeID 
					FROM 
						ChargeTypes 
					WHERE 
						ItemLevel = 1;
					
					OPEN ChargeTypeCursor; 
					FETCH NEXT FROM ChargeTypeCursor INTO @ChargeTypeName, @ChargeTypeID;
					
					WHILE @@FETCH_STATUS = 0
						BEGIN
							SET @ApplyDiscount = 0;
							
							IF @ChargeTypeName = 'Entry Fee'
								BEGIN
									SET @InsertAmount = @CurrentEntryFee;
									IF @InsertAmount > 0
										BEGIN
											SET @ApplyDiscount = 1;
										END
								END
							ELSE IF @ChargeTypeName = 'Registration Fee'
								BEGIN
									SET @InsertAmount = @CurrentRegistrationFee;
								END
							ELSE IF @ChargeTypeName = 'Registration Percentage'
								BEGIN
									SET @InsertAmount = @CurrentRegistrationPercentage;
								END
							ELSE IF @ChargeTypeName = 'Registration Fee (Client Charge)'
								BEGIN
									SET @InsertAmount = @CurrentRegistrationFeeClientCharge;
								END
							ELSE IF @ChargeTypeName = 'Late Fee'
								BEGIN
									SET @InsertAmount = @CurrentLateFee;
								END
							ELSE IF @ChargeTypeName = 'Late Fee Registration Fee'
								BEGIN
									SET @InsertAmount = @CurrentLateFeeRegistrationFee;
								END
							ELSE IF @ChargeTypeName = 'Late Fee Registration Fee (Client Charge)'
								BEGIN
									SET @InsertAmount = @CurrentLateFeeRegistrationFeeClientCharge;
								END
							ELSE IF @ChargeTypeName = 'Discount'
								BEGIN
									SET @InsertAmount = @CurrentDiscountAmount;
								END
							ELSE
								BEGIN
									SET @InsertAmount = 0;
								END
							
							IF @ApplyDiscount = 1
								BEGIN
									SELECT @InsertAmount = dbo.GetDiscountedItemAmount(@InsertAmount,@ItemID,@CurrentItemQuantity);
								END
							
							-- now, write the amount to the database
							EXEC SubmitPaymentData @UniqueID, @GroupID, @ItemID, @ChargeTypeID, @InsertAmount, @CurrentItemQuantity, @WaitListed, @UseTempTable;
							
							--debugging info
							IF (@Debug = 1) PRINT 'Inserted PaymentData: ' + @ChargeTypeName + ': ' + CONVERT(varchar(100), @InsertAmount);
							
							-- retreive the next charge type
							FETCH NEXT FROM ChargeTypeCursor INTO @ChargeTypeName, @ChargeTypeID;
						END;
					CLOSE ChargeTypeCursor;
					DEALLOCATE ChargeTypeCursor;
					
					--debugging info
					IF (@Debug = 1) PRINT 'Waitlisted: ' + CONVERT(varchar(10), @WaitListed);
					IF (@Debug = 1) PRINT 'Total Entry Fee: ' + CONVERT(varchar(10), @TempTotalEntryFees);
					
					-- set the last Group id to a local variable
					SET @PreviousTotalEntryFees = @TempTotalEntryFees;
					SET @ItemCounter = @ItemCounter + 1;
					SET @LastGroupID = @GroupID
					
					-- retrieve the next item in the batch


					FETCH NEXT FROM
						StandardInfoCursor
					INTO
						@ItemName,
						@GroupName,
						@ItemID,
						@EarlyRegistrationCloseDate,
						@EarlyRegistrationEntryFee,
						@EarlyRegistrationRegistrationFee,
						@EarlyRegistrationRegistrationFeeClientCharge,
						@EntryFee,
						@RegistrationPercentage,
						@GroupID,
						@CancellationDate,
						@ChargeInFee,
						@RegistrationFee,
						@RegistrationFeeClientCharge,
						@MinEntryFee,
						@IncludedEntries,
						@GeneralRegistrationPercentage,
						@GeneralRegistrationFee,
						@MaxServiceCharge,
						@LateFee,
						@LateFeeRegistrationFee,
						@LateFeeRegistrationFeeClientCharge,
						@LateFeeDate,
						@Individuals,
						@IsRecReservation,
						@MaxEntries,
						@CheckFee,
						@DefaultApprovalCode,
						@PastCloseDate,
						@DiscountScript,
						@DiscountAmount,
						@ResourceQuantity,
						@TotalEntries;
				END;
			CLOSE StandardInfoCursor;
			DEALLOCATE StandardInfoCursor;
			
			--debugging info
			IF (@Debug = 1) PRINT 'Begin General Fees: ' + CONVERT(varchar(100), getdate()) + ' ' + CONVERT(varchar(3), DATEPART(Ss, getdate())) + ' ' + CONVERT(varchar(3), DATEPART(Ms, getdate()));
			
			-- now, declare the remaining fees
			DECLARE @GeneralServiceFee float;
			DECLARE @DeclinedCreditCardFee float;
			DECLARE @DeclinedorBouncedCheckFee float;
			DECLARE @GeneralRefunds float;
			DECLARE @PaymentMethod varchar(100);
			DECLARE @ApprovalCode varchar(100);
			DECLARE @TempApprovalCode nvarchar(MAX);
			DECLARE @ReplaceApprovalCode bit;
			SET @TempApprovalCode = '';
			SET @ApprovalCode = @DefaultApprovalCode;
			SET @ReplaceApprovalCode = 0;
			
			--debugging info
			IF (@Debug = 1) PRINT 'Begin Get General Fees: ' + CONVERT(varchar(100), getdate()) + ' ' + CONVERT(varchar(3), DATEPART(Ss, getdate())) + ' ' + CONVERT(varchar(3), DATEPART(Ms, getdate()));
			
			IF @UseTempTable = 0
				BEGIN
					SELECT @GeneralServiceFee = (SUM(Amount) * @GeneralRegistrationPercentage) + @GeneralRegistrationFee FROM PaymentData WHERE UniqueID = @UniqueID AND ChargeTypeID NOT IN (SELECT ChargeTypeID FROM ChargeTypes WHERE ChargeTypeName = 'General Service Fee');
				END
			ELSE
				BEGIN
					SELECT @GeneralServiceFee = (SUM(Amount) * @GeneralRegistrationPercentage) + @GeneralRegistrationFee FROM #TempPaymentData WHERE UniqueID = @UniqueID AND ChargeTypeID NOT IN (SELECT ChargeTypeID FROM ChargeTypes WHERE ChargeTypeName = 'General Service Fee');
				END
			
			-- check to see if the service charges are more than the maximum and the maximum is not zero
			IF @MaxServiceCharge > 0 And (@TotalServiceCharges + @GeneralServiceFee) > @MaxServiceCharge
				BEGIN
					IF @ExceededMaxServiceCharges = 0
						BEGIN
							-- set the service charges for this Item to be zero
							SET @GeneralServiceFee = @GeneralServiceFee - ((@TotalServiceCharges + @GeneralServiceFee) - @MaxServiceCharge);
						END
					ELSE
						BEGIN
							-- set the service charges for this Item to be zero
							SET @GeneralServiceFee = 0;
						END
				END
			
			-- now, if the current entry fees are less than zero, let's set it to zero
			IF @GeneralServiceFee < 0
				BEGIN
					SET @GeneralServiceFee = 0;
				END
			
			--debugging info
			IF (@Debug = 1) PRINT 'End Get General Fees: ' + CONVERT(varchar(100), getdate()) + ' ' + CONVERT(varchar(3), DATEPART(Ss, getdate())) + ' ' + CONVERT(varchar(3), DATEPART(Ms, getdate()));
			
			-- set the declined fees
			SET @DeclinedCreditCardFee = 0;
			SET @DeclinedorBouncedCheckFee = 0;
			SET @GeneralRefunds = 0;
			
			-- get the payment method from the database
			SELECT @PaymentMethod = dbo.GetEntryDataValue(@UniqueID, 'PaymentMethod');
			
			--debugging info
			IF (@Debug = 1) PRINT 'End Get Payment Method: ' + CONVERT(varchar(100), getdate()) + ' ' + CONVERT(varchar(3), DATEPART(Ss, getdate())) + ' ' + CONVERT(varchar(3), DATEPART(Ms, getdate()));
			
			-- get the approval code from the database, if any
			SELECT @TempApprovalCode = ApprovalCode FROM ConfirmationNumbers WHERE UniqueID = @UniqueID
			IF @TempApprovalCode = '' OR @TempApprovalCode = 'DECLINED' OR @TempApprovalCode = 'FRAUD' OR @TempApprovalCode = 'NONE' OR @TempApprovalCode = 'INMAIL' OR @TempApprovalCode = 'PROCESSING'
				BEGIN
					SET @ReplaceApprovalCode = 1;
				END
			ELSE
				BEGIN
					SET @ApprovalCode = @TempApprovalCode;
				END
			
			-- let's figure out if we are in a new record or not
			-- if they chose pay by sending in a check, insert the fee for the check into the payment database
			IF LEN(@PaymentMethod) > 0
				BEGIN
					IF @PaymentMethod = 'Mail A Check Or Money Order'
						BEGIN
							-- set the approval code to "INMAIL"
							IF @ReplaceApprovalCode = 1
								BEGIN
									SET @ApprovalCode = 'INMAIL';
								END
						END
					ELSE IF @PaymentMethod = 'Check Online'
						BEGIN
							-- set the approval code to "NONE"
							IF @ReplaceApprovalCode = 1
								BEGIN
									SET @ApprovalCode = 'NONE';
								END
							SET @CurrentCheckFee = 0;
						END
					ELSE
						BEGIN
							SET @CurrentCheckFee = 0;
						END
					-- now, check to see if this is waitlisted
					IF @TotalWaitListed > 0
						BEGIN
							IF @ReplaceApprovalCode = 1
								BEGIN
									SET @ApprovalCode = 'WAITLIST';
								END
						END
				END
			
			--debugging info
			IF (@Debug = 1) PRINT 'Begin General Charge Cursor: ' + CONVERT(varchar(100), getdate()) + ' ' + CONVERT(varchar(3), DATEPART(Ss, getdate())) + ' ' + CONVERT(varchar(3), DATEPART(Ms, getdate()));
			
			DECLARE GeneralCursor CURSOR FOR SELECT ChargeTypeName, ChargeTypeID FROM ChargeTypes WHERE ItemLevel = 0 AND IsCustomPayment = 0;
			OPEN GeneralCursor; 
			FETCH NEXT FROM GeneralCursor INTO @ChargeTypeName, @ChargeTypeID;
			WHILE @@FETCH_STATUS = 0
				BEGIN
					IF @ChargeTypeName = 'General Service Fee'
						BEGIN
							SET @InsertAmount = @GeneralServiceFee;
						END
					ELSE IF @ChargeTypeName = 'Check Fee'
						BEGIN
							SET @InsertAmount = @CurrentCheckFee;
						END
					ELSE IF @ChargeTypeName = 'Declined Credit Card Fee'
						BEGIN
							SET @InsertAmount = @DeclinedCreditCardFee;
						END
					ELSE IF @ChargeTypeName = 'Declined or Bounced Check Fee'
						BEGIN
							SET @InsertAmount = @DeclinedorBouncedCheckFee;
						END
					ELSE
						BEGIN
							SET @InsertAmount = 0;
						END
					
					IF (@Debug = 1) PRINT 'Begin Submit Data: ' + CONVERT(varchar(100), getdate()) + ' ' + CONVERT(varchar(3), DATEPART(Ss, getdate())) + ' ' + CONVERT(varchar(3), DATEPART(Ms, getdate()));
					
					-- now, write the amount to the database
					SET @FullQuery = 'SubmitPaymentData ' + CONVERT(varchar(100), @UniqueID) + ', ' + CONVERT(varchar(10), @LastGroupID) + ', 0, ' + CONVERT(varchar(10), @ChargeTypeID) + ', ' + CONVERT(varchar(20), @InsertAmount) + ', 1, 0, ' + CONVERT(varchar(1), @UseTempTable) + ';';
					
					--debugging info
					--WARNING: the PRINT statement is limited to 8,000 chars or 4,000 nchars -- which means the below will likely truncate the FullQuery
					IF (@Debug = 1) PRINT 'Query: ' + @FullQuery;
					
					EXEC sp_executesql @FullQuery;
					
					--debugging info
					IF (@Debug = 1) PRINT 'End Submit Data: ' + CONVERT(varchar(100), getdate()) + ' ' + CONVERT(varchar(3), DATEPART(Ss, getdate())) + ' ' + CONVERT(varchar(3), DATEPART(Ms, getdate()));
					IF (@Debug = 1) PRINT 'Charge Type: ' + @ChargeTypeName + ': ' + CONVERT(varchar(100), @InsertAmount);
					
					FETCH NEXT FROM GeneralCursor INTO @ChargeTypeName, @ChargeTypeID;
				END;
			CLOSE GeneralCursor;
			DEALLOCATE GeneralCursor;
			
			--debugging info
			IF (@Debug = 1) PRINT 'End General Charge Cursor: ' + CONVERT(varchar(100), getdate()) + ' ' + CONVERT(varchar(3), DATEPART(Ss, getdate())) + ' ' + CONVERT(varchar(3), DATEPART(Ms, getdate()));
			
		END -- closes the payment update if from above
	ELSE -- since this is a payment update, we need to get the approval code
		BEGIN
			--Debugging info
			IF (@Debug = 1) PRINT 'Payment Update';
			
			SELECT @ApprovalCode = ApprovalCode FROM ConfirmationNumbers WHERE UniqueID = @UniqueID;
		END
	
	-- only continue to process this registration, if we are not using a temp table
	-- which means that we are really processing the registration
	IF @UseTempTable = 0
		BEGIN
			-- if this is a payment update, we need to replace the declined/fraud with verifying
			IF @PaymentUpdate = 1
				BEGIN
					SET @ApprovalCode = REPLACE(REPLACE(REPLACE(@ApprovalCode, 'DECLINED', 'VERIFYING'), 'FRAUD', 'VERIFYING'),'CANCEL:DEFERRED','NONE');
				END
			ELSE
				BEGIN
					-- Initialize the cost data table with rows for everything
					IF @TotalWaitlisted > 0
						BEGIN
							EXEC InitializeCostData @UniqueID, 1;
						END
					ELSE
						BEGIN
							EXEC InitializeCostData @UniqueID, 0;
						END
				END
			
			-- declare the confirmation number variable
			DECLARE @ConfirmationNumber bigint;
			DECLARE @IndividualID bigint;
			DECLARE @EmailAddress varchar(250);
			SET @ConfirmationNumber = 0;
			SET @IndividualID = 0;
			SET @EmailAddress = '';
			-- create the temp table for the data
			--CREATE TABLE #TempConfirmationNumber (ConfirmationNumber bigint NOT NULL);
			
			-- insert/update the data into the confirmation numbers table, if it isn't already there.
			SET @FullQuery = 'SubmitConfirmationData ' + CONVERT(varchar(100), @UniqueID) + ', ''' + @ApprovalCode + ''';';
			
			--debugging info
			IF (@Debug = 1) PRINT 'Query: ' + @FullQuery;
			
			-- populate the temp table with the data from the stored procedure
			EXEC sp_executesql @FullQuery;
			-- now, get the confirmation number
			SELECT @ConfirmationNumber = ConfirmationNumber * 2345 FROM ConfirmationNumbers WHERE UniqueID = @UniqueID;
			
			--debugging info
			IF (@Debug = 1) PRINT 'Confirmation#: ' + CONVERT(varchar(100), @ConfirmationNumber);
			
			-- now, let's create/update the user's account with this information and return the individual id and email address to the temp table
			--SET @FullQuery = 'CreateIndividualAccount '
			--	+ CONVERT(varchar(100), @UniqueID) + ', '''
			--	+ @ItemIDList + ''', '''
			--	+ @EmailFieldName + ''', '''
			--	+ @NameFieldPrefix + ''', '''
			--	+ CONVERT(varchar(100), @ConfirmationNumber) + ''', '''
			--	+ @UserCookie + ''';';
			--replaced the below with the above dynamic SQL so the params can be properly quoted
			EXEC CreateIndividualAccount @UniqueID, @ItemIDList, @EmailFieldName, @NameFieldPrefix, @ConfirmationNumber, @UserCookie;
			
			--debugging info
			IF (@Debug = 1) PRINT 'Query: ' + @FullQuery;
			
			EXEC sp_executesql @FullQuery;
			
			--debugging info
			IF (@Debug = 1) PRINT 'Created Individual Account';
			
			-- update resource reservation for any items that have resources within the timeout limit
			-- only update the Reservations table if we are actually processing the registration
			UPDATE
				Reservations
			SET
				IsReserved = 1
			FROM
				ReservationResources rr
			WHERE
				Reservations.ResourceID = rr.ResourceID
				AND Reservations.UniqueID = @UniqueID
				AND Reservations.Quantity > 0
				AND Reservations.IsReserved = 0
				AND Reservations.CartRefreshDateTime > DATEADD(ss, -1 * rr.CartTimeoutSeconds, GETDATE())
				
			-- update any saved registrations to indicate that they have been subsequently completed
			UPDATE SavedRegistrations SET SubsequentlyCompleted = 1 WHERE UniqueID = @UniqueID
			
			--debugging info
			IF (@Debug = 1) PRINT 'Updated Saved Registrations';
			
			-- finally, select the confirmation number, individual id, and email address to return
			SELECT 
				cn.ConfirmationNumber, 
				iXu.IndividualID, 
				i.Email AS EmailAddress, 
				i.SentActivationMessage, 
				cn.ApprovalCode, 
				@PaymentMethod AS PaymentMethod, 
				--SUM(pd.Amount * ct.Multiplier) AS TotalAmount
				CONVERT(numeric(18,2), SUM(pd.Amount * ct.Multiplier)) AS TotalAmount
			FROM 
				Individuals i, 
				IndividualsXUniqueIDs iXu, 
				ConfirmationNumbers cn, 
				PaymentData pd, 
				ChargeTypes ct 
			WHERE 
				cn.UniqueID = pd.UniqueID AND 
				ct.ChargeTypeID = pd.ChargeTypeID AND 
				cn.UniqueID = iXu.UniqueID AND 
				i.IndividualID = iXu.IndividualID AND 
				iXu.UniqueID = @UniqueID AND 
				iXu.Registered = 1 AND
				ct.RegistrantCharge = 1
			GROUP BY 
				cn.ConfirmationNumber, 
				iXu.IndividualID, 
				i.Email, 
				i.SentActivationMessage, 
				cn.ApprovalCode;
			
			--debugging info
			IF (@Debug = 1) PRINT 'End: ' + CONVERT(varchar(100), getdate()) + ' ' + CONVERT(varchar(3), DATEPART(Ss, getdate())) + ' ' + CONVERT(varchar(3), DATEPART(Ms, getdate()));
		END
	ELSE
		BEGIN
			--debugging info
			IF (@Debug = 1) PRINT 'EXEC GetInvoice ' + CONVERT(nvarchar(1000), @UniqueID) + ', ' + CONVERT(varchar(1), @UseTempTable) + ';';
			
			EXEC GetInvoice @UniqueID, @UseTempTable;
			DROP TABLE #TempPaymentData;
		END
END
GO
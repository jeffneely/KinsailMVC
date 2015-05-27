--------------------------------------------------------------------------------
-- REF DATA script
-- ResourceTypes
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


INSERT INTO [dbo].[ResourceTypes]
           ([ResourceTypeName]
           ,[ResourceTypeDescription]
           ,[ResourceTypeOrder]
           ,[Audit_ContactID])
     VALUES
           ('Accomodation Reservation' --ResourceTypeName
           ,'Time-based reservation of a recreation site' --ResourceTypeDescription
           ,60 --ResourceTypeOrder
           ,NULL --Audit_ContactID
           )
GO
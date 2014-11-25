--------------------------------------------------------------------------------
-- SAMPLE DATA script
-- Availability
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


--Availability templates
INSERT INTO [dbo].[Availability]
           ([Name]
           ,[Description]
           ,[Policies]
           ,[AvailStartYear]
           ,[AvailStartMonth]
           ,[AvailStartDay]
           ,[AvailEndYear]
           ,[AvailEndMonth]
           ,[AvailEndDay]
           ,[AvailBeforeDays]
           ,[ReserveBeforeDays]
           ,[CancelBeforeDays]
           ,[MinDurationDays]
           ,[MaxDurationDays]
           ,[Active])
     VALUES
           ('Sleepy Hollow: Cabin Availability'
           ,'Cabins are available at Sleepy Hollow during most of the year (March - November)'
           ,'PART I - Sample Legalese here describing reservation policies...'
           ,2013 --AvailStartYear
           ,3 --AvailStartMonth
           ,1 --AvailStartDay
           ,2017 --AvailEndYear
           ,11 --AvailEndMonth
           ,30 --AvailEndDay
           ,30 --AvailBeforeDays
           ,5 --ReserveBeforeDays
           ,3 --CancelBeforeDays
           ,1 --MinDurationDays
           ,7 --MaxDurationDays
           ,1) --Active
GO

INSERT INTO [dbo].[Availability]
           ([Name]
           ,[Description]
           ,[Policies]
           ,[AvailStartYear]
           ,[AvailStartMonth]
           ,[AvailStartDay]
           ,[AvailEndYear]
           ,[AvailEndMonth]
           ,[AvailEndDay]
           ,[AvailBeforeDays]
           ,[ReserveBeforeDays]
           ,[CancelBeforeDays]
           ,[MinDurationDays]
           ,[MaxDurationDays]
           ,[Active])
     VALUES
           ('Sleepy Hollow: Summer Camping Availability'
           ,'Campsites are available at Sleepy Hollow during the summer months (May - October)'
           ,'PART I - Sample Legalese here describing reservation policies...'
           ,2013 --AvailStartYear
           ,5 --AvailStartMonth
           ,1 --AvailStartDay
           ,2017 --AvailEndYear
           ,10 --AvailEndMonth
           ,30 --AvailEndDay
           ,45 --AvailBeforeDays
           ,7 --ReserveBeforeDays
           ,5 --CancelBeforeDays
           ,3 --MinDurationDays
           ,7 --MaxDurationDays
           ,1) --Active
GO

-- Site Availability
INSERT INTO [dbo].[ItemsXAvailability]
           ([ItemID]
           ,[AvailID]
           ,[MaxUnits]
           ,[BaseRate]
		   ,[WeekdayRate]
		   ,[WeekendRate]
           ,[DisplayOrder]
           ,[Description])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Gastonia Cabin')
           ,(SELECT AvailID FROM Availability WHERE Name = 'Sleepy Hollow: Cabin Availability')
           ,4 --MaxUnits
           ,120.00 --BaseRate
		   ,120.00 --WeekdayRate
		   ,160.00 --WeekendRate
           ,0 --DisplayOrder
           ,NULL) -- Description
GO

INSERT INTO [dbo].[ItemsXAvailability]
           ([ItemID]
           ,[AvailID]
           ,[MaxUnits]
           ,[BaseRate]
		   ,[WeekdayRate]
		   ,[WeekendRate]
           ,[DisplayOrder]
           ,[Description])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Salisbury Cabin')
           ,(SELECT AvailID FROM Availability WHERE Name = 'Sleepy Hollow: Cabin Availability')
           ,6 --MaxUnits
           ,180.00 --BaseRate
		   ,180.00 --WeekdayRate
		   ,225.00 --WeekendRate
           ,0 --DisplayOrder
           ,NULL) -- Description
GO

INSERT INTO [dbo].[ItemsXAvailability]
           ([ItemID]
           ,[AvailID]
           ,[MaxUnits]
           ,[BaseRate]
		   ,[WeekdayRate]
		   ,[WeekendRate]
           ,[DisplayOrder]
           ,[Description])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Ichabod Campsite')
           ,(SELECT AvailID FROM Availability WHERE Name = 'Sleepy Hollow: Summer Camping Availability')
           ,4 --MaxUnits
           ,110.00 --BaseRate
		   ,110.00 --WeekdayRate
		   ,135.00 --WeekendRate
           ,0 --DisplayOrder
           ,NULL) -- Description
GO

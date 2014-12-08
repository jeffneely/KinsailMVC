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


--
-- Raven Ridge Sample Availability Data
--

--startMonth: number
--startDay: number

--endMonth: number
--endDay: number

--minimumDuration: number
--weekdayRate: number
--weekendRate: number
--notAvailable: boolean

--costPeriod1: CostPeriod[] = 
--[new CostPeriod(1,  1,   3,  31,     1, 10, 15, false), 
-- new CostPeriod(4,  1,   6,  30,     3, 15, 25, false), 
-- new CostPeriod(7,  1,   10, 31,     2, 10, 15, false), 
-- new CostPeriod(11, 1,   12, 31,     1, 5, 5, false)];
INSERT INTO [dbo].[Availability]
           ([Name]
           ,[Description]
           ,[Policies]
           ,[Available]
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
           ('RR1 Q1' --Name
           ,'RR CLASS 1 Q1 Availability' --Description
           ,'POLICIES: Lorem...' --Policies
           ,1 --Available
		   ,NULL --AvailStartYear
           ,1 --AvailStartMonth
           ,1 --AvailStartDay
           ,NULL --AvailEndYear
           ,3 --AvailEndMonth
           ,31 --AvailEndDay
           ,30 --AvailBeforeDays
           ,0 --ReserveBeforeDays
           ,0 --CancelBeforeDays
           ,3 --MinDurationDays
           ,30 --MaxDurationDays
           ,1 --Active
           )
GO

INSERT INTO [dbo].[Availability]
           ([Name]
           ,[Description]
           ,[Policies]
           ,[Available]
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
           ('RR1 Q2' --Name
           ,'RR CLASS 1 Q2 Availability' --Description
           ,'POLICIES: Lorem...' --Policies
           ,1 --Available
		   ,NULL --AvailStartYear
           ,4 --AvailStartMonth
           ,1 --AvailStartDay
           ,NULL --AvailEndYear
           ,6 --AvailEndMonth
           ,30 --AvailEndDay
           ,30 --AvailBeforeDays
           ,0 --ReserveBeforeDays
           ,0 --CancelBeforeDays
           ,1 --MinDurationDays
           ,30 --MaxDurationDays
           ,1 --Active
           )
GO

INSERT INTO [dbo].[Availability]
           ([Name]
           ,[Description]
           ,[Policies]
           ,[Available]
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
           ('RR1 Q3' --Name
           ,'RR CLASS 1 Q3 Availability' --Description
           ,'POLICIES: Lorem...' --Policies
           ,1
		   ,NULL --AvailStartYear
           ,7 --AvailStartMonth
           ,1 --AvailStartDay
           ,NULL --AvailEndYear
           ,10 --AvailEndMonth
           ,31 --AvailEndDay
           ,30 --AvailBeforeDays
           ,0 --ReserveBeforeDays
           ,0 --CancelBeforeDays
           ,2 --MinDurationDays
           ,30 --MaxDurationDays
           ,1 --Active
           )
GO

INSERT INTO [dbo].[Availability]
           ([Name]
           ,[Description]
           ,[Policies]
           ,[Available]
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
           ('RR1 Q4' --Name
           ,'RR CLASS 1 Q4 Availability' --Description
           ,'POLICIES: Lorem...' --Policies
           ,1 --Available
		   ,NULL --AvailStartYear
           ,11 --AvailStartMonth
           ,1 --AvailStartDay
           ,NULL --AvailEndYear
           ,12 --AvailEndMonth
           ,31 --AvailEndDay
           ,30 --AvailBeforeDays
           ,0 --ReserveBeforeDays
           ,0 --CancelBeforeDays
           ,1 --MinDurationDays
           ,30 --MaxDurationDays
           ,1 --Active
           )
GO

--costPeriod2: CostPeriod[] = 
--[new CostPeriod(1,  1,   2,  27,     1, 7, 14, false), 
-- new CostPeriod(3,  1,   5,  31,     2, 9, 18, false), 
-- new CostPeriod(6,  1,   9,  30,     3, 10, 15, false), 
-- new CostPeriod(10, 1,   12, 31,     0, 0, 0, true)];
INSERT INTO [dbo].[Availability]
           ([Name]
           ,[Description]
           ,[Policies]
           ,[Available]
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
           ('RR2 Q1' --Name
           ,'RR CLASS 2 Q1 Availability' --Description
           ,'POLICIES: Lorem...' --Policies
           ,1 --Available
		   ,NULL --AvailStartYear
           ,1 --AvailStartMonth
           ,1 --AvailStartDay
           ,NULL --AvailEndYear
           ,2 --AvailEndMonth
           ,27 --AvailEndDay
           ,30 --AvailBeforeDays
           ,0 --ReserveBeforeDays
           ,0 --CancelBeforeDays
           ,1 --MinDurationDays
           ,30 --MaxDurationDays
           ,1 --Active
           )
GO

INSERT INTO [dbo].[Availability]
           ([Name]
           ,[Description]
           ,[Policies]
           ,[Available]
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
           ('RR2 Q2' --Name
           ,'RR CLASS 2 Q2 Availability' --Description
           ,'POLICIES: Lorem...' --Policies
           ,1 --Available
		   ,NULL --AvailStartYear
           ,3 --AvailStartMonth
           ,1 --AvailStartDay
           ,NULL --AvailEndYear
           ,5 --AvailEndMonth
           ,31 --AvailEndDay
           ,30 --AvailBeforeDays
           ,0 --ReserveBeforeDays
           ,0 --CancelBeforeDays
           ,2 --MinDurationDays
           ,30 --MaxDurationDays
           ,1 --Active
           )
GO

INSERT INTO [dbo].[Availability]
           ([Name]
           ,[Description]
           ,[Policies]
           ,[Available]
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
           ('RR2 Q3' --Name
           ,'RR CLASS 2 Q3 Availability' --Description
           ,'POLICIES: Lorem...' --Policies
           ,1 --Available
		   ,NULL --AvailStartYear
           ,6 --AvailStartMonth
           ,1 --AvailStartDay
           ,NULL --AvailEndYear
           ,9 --AvailEndMonth
           ,30 --AvailEndDay
           ,30 --AvailBeforeDays
           ,0 --ReserveBeforeDays
           ,0 --CancelBeforeDays
           ,3 --MinDurationDays
           ,30 --MaxDurationDays
           ,1 --Active
           )
GO

INSERT INTO [dbo].[Availability]
           ([Name]
           ,[Description]
           ,[Policies]
           ,[Available]
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
           ('RR2 Q4' --Name
           ,'RR CLASS 2 Q4 NO Availability' --Description
           ,'POLICIES: Lorem...' --Policies
           ,0 --Available
           ,NULL --AvailStartYear
           ,6 --AvailStartMonth
           ,1 --AvailStartDay
           ,NULL --AvailEndYear
           ,9 --AvailEndMonth
           ,30 --AvailEndDay
           ,30 --AvailBeforeDays
           ,0 --ReserveBeforeDays
           ,0 --CancelBeforeDays
           ,3 --MinDurationDays
           ,30 --MaxDurationDays
           ,1 --Active
           )
GO

--costPeriod3: CostPeriod[] = 
--[new CostPeriod(1,  1,   3,  31,     1, 5, 5, false), 
-- new CostPeriod(4,  1,   9,  30,     3, 15, 25, false), 
-- new CostPeriod(10, 1,   12, 31,     1, 5, 5, false)];
INSERT INTO [dbo].[Availability]
           ([Name]
           ,[Description]
           ,[Policies]
           ,[Available]
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
           ('RR3 Winter' --Name
           ,'RR CLASS 3 Winter Availability' --Description
           ,'POLICIES: Lorem...' --Policies
           ,1 --Available
		   ,NULL --AvailStartYear
           ,1 --AvailStartMonth
           ,1 --AvailStartDay
           ,NULL --AvailEndYear
           ,3 --AvailEndMonth
           ,31 --AvailEndDay
           ,30 --AvailBeforeDays
           ,0 --ReserveBeforeDays
           ,0 --CancelBeforeDays
           ,1 --MinDurationDays
           ,30 --MaxDurationDays
           ,1 --Active
           )
GO

INSERT INTO [dbo].[Availability]
           ([Name]
           ,[Description]
           ,[Policies]
           ,[Available]
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
           ('RR3 Summer' --Name
           ,'RR CLASS 3 Summer Availability' --Description
           ,'POLICIES: Lorem...' --Policies
           ,1 --Available
		   ,NULL --AvailStartYear
           ,4 --AvailStartMonth
           ,1 --AvailStartDay
           ,NULL --AvailEndYear
           ,9 --AvailEndMonth
           ,30 --AvailEndDay
           ,30 --AvailBeforeDays
           ,0 --ReserveBeforeDays
           ,0 --CancelBeforeDays
           ,3 --MinDurationDays
           ,30 --MaxDurationDays
           ,1 --Active
           )
GO

INSERT INTO [dbo].[Availability]
           ([Name]
           ,[Description]
           ,[Policies]
           ,[Available]
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
           ('RR3 Fall' --Name
           ,'RR CLASS 3 Fall Availability' --Description
           ,'POLICIES: Lorem...' --Policies
           ,1  --Available
		   ,NULL --AvailStartYear
           ,10 --AvailStartMonth
           ,1 --AvailStartDay
           ,NULL --AvailEndYear
           ,12 --AvailEndMonth
           ,31 --AvailEndDay
           ,30 --AvailBeforeDays
           ,0 --ReserveBeforeDays
           ,0 --CancelBeforeDays
           ,1 --MinDurationDays
           ,30 --MaxDurationDays
           ,1 --Active
           )
GO

-- Location Availability
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
           ('Raven Ridge Park Availability' --Name
           ,'Raven Ridge visitor access and site availability for the year' --Description
           ,'POLICIES: The park lorem ipsum...' --Policies
           ,NULL --AvailStartYear
           ,1 --AvailStartMonth
           ,1 --AvailStartDay
           ,NULL --AvailEndYear
           ,12 --AvailEndMonth
           ,31 --AvailEndDay
           ,0 --AvailBeforeDays
           ,0 --ReserveBeforeDays
           ,0 --CancelBeforeDays
           ,1 --MinDurationDays
           ,30 --MaxDurationDays
           ,1 --Active
           )
GO


--
-- Raven Ridge Sample ItemsXAvailability Data
--

-- period 1 site costs
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Tent-01'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q1') , 4 , 10 , 10 , 15 , 1 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Tent-02'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q1') , 4 , 10 , 10 , 15 , 1 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Tent-03'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q1') , 6 , 10 , 10 , 15 , 1 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Tent-04'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q1') , 4 , 10 , 10 , 15 , 1 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Tent-15'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q1') , 6 , 10 , 10 , 15 , 1 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Tent-16'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q1') , 4 , 10 , 10 , 15 , 1 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='RV-01'),(SELECT AvailID FROM Availability WHERE Name='RR2 Q1') , 6 , 7 , 7 , 14 , 1 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='RV-02'),(SELECT AvailID FROM Availability WHERE Name='RR2 Q1') , 6 , 7 , 7 , 14 , 1 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='RV-04'),(SELECT AvailID FROM Availability WHERE Name='RR2 Q1') , 6 , 7 , 7 , 14 , 1 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='RV-06'),(SELECT AvailID FROM Availability WHERE Name='RR2 Q1') , 6 , 7 , 7 , 14 , 1 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='RV-11'),(SELECT AvailID FROM Availability WHERE Name='RR2 Q1') , 6 , 7 , 7 , 14 , 1 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Picnic-01'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q1') , 24 , 10 , 10 , 15 , 1 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Cabin-08'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q1') , 4 , 10 , 10 , 15 , 1 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Cabin-11'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q1') , 6 , 10 , 10 , 15 , 1 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Cabin-14'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q1') , 8 , 10 , 10 , 15 , 1 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Cabin-16'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q1') , 4 , 10 , 10 , 15 , 1 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Cabin-19'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q1') , 5 , 10 , 10 , 15 , 1 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Dock-P1-03'),(SELECT AvailID FROM Availability WHERE Name='RR3 Winter') , 4 , 7 , 7 , 7 , 1 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Dock-P1-05'),(SELECT AvailID FROM Availability WHERE Name='RR3 Winter') , 2 , 7 , 7 , 7 , 1 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Dock-P2-02'),(SELECT AvailID FROM Availability WHERE Name='RR3 Winter') , 8 , 7 , 7 , 7 , 1 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Dock-P2-04'),(SELECT AvailID FROM Availability WHERE Name='RR3 Winter') , 2 , 7 , 7 , 7 , 1 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Dock-P3-01'),(SELECT AvailID FROM Availability WHERE Name='RR3 Winter') , 2 , 7 , 7 , 7 , 1 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Trailer-02'),(SELECT AvailID FROM Availability WHERE Name='RR2 Q1') , 4 , 7 , 7 , 14 , 1 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Group-03'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q1') , 12 , 10 , 10 , 15 , 1 , NULL)

-- period 2 site costs
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Tent-01'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q2') , 4 , 15 , 15 , 25 , 2 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Tent-02'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q2') , 4 , 15 , 15 , 25 , 2 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Tent-03'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q2') , 6 , 15 , 15 , 25 , 2 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Tent-04'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q2') , 4 , 15 , 15 , 25 , 2 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Tent-15'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q2') , 6 , 15 , 15 , 25 , 2 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Tent-16'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q2') , 4 , 15 , 15 , 25 , 2 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='RV-01'),(SELECT AvailID FROM Availability WHERE Name='RR2 Q2') , 6 , 9 , 9 , 18 , 2 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='RV-02'),(SELECT AvailID FROM Availability WHERE Name='RR2 Q2') , 6 , 9 , 9 , 18 , 2 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='RV-04'),(SELECT AvailID FROM Availability WHERE Name='RR2 Q2') , 6 , 9 , 9 , 18 , 2 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='RV-06'),(SELECT AvailID FROM Availability WHERE Name='RR2 Q2') , 6 , 9 , 9 , 18 , 2 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='RV-11'),(SELECT AvailID FROM Availability WHERE Name='RR2 Q2') , 6 , 9 , 9 , 18 , 2 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Picnic-01'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q2') , 24 , 15 , 15 , 25 , 2 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Cabin-08'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q2') , 4 , 15 , 15 , 25 , 2 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Cabin-11'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q2') , 6 , 15 , 15 , 25 , 2 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Cabin-14'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q2') , 8 , 15 , 15 , 25 , 2 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Cabin-16'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q2') , 4 , 15 , 15 , 25 , 2 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Cabin-19'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q2') , 5 , 15 , 15 , 25 , 2 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Dock-P1-03'),(SELECT AvailID FROM Availability WHERE Name='RR3 Summer') , 4 , 15 , 15 , 25 , 2 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Dock-P1-05'),(SELECT AvailID FROM Availability WHERE Name='RR3 Summer') , 2 , 15 , 15 , 25 , 2 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Dock-P2-02'),(SELECT AvailID FROM Availability WHERE Name='RR3 Summer') , 8 , 15 , 15 , 25 , 2 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Dock-P2-04'),(SELECT AvailID FROM Availability WHERE Name='RR3 Summer') , 2 , 15 , 15 , 25 , 2 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Dock-P3-01'),(SELECT AvailID FROM Availability WHERE Name='RR3 Summer') , 2 , 15 , 15 , 25 , 2 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Trailer-02'),(SELECT AvailID FROM Availability WHERE Name='RR2 Q2') , 4 , 9 , 9 , 18 , 2 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Group-03'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q2') , 12 , 15 , 15 , 25 , 2 , NULL)

-- period 3 site costs
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Tent-01'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q3') , 4 , 10 , 10 , 15 , 3 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Tent-02'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q3') , 4 , 10 , 10 , 15 , 3 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Tent-03'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q3') , 6 , 10 , 10 , 15 , 3 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Tent-04'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q3') , 4 , 10 , 10 , 15 , 3 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Tent-15'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q3') , 6 , 10 , 10 , 15 , 3 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Tent-16'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q3') , 4 , 10 , 10 , 15 , 3 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='RV-01'),(SELECT AvailID FROM Availability WHERE Name='RR2 Q3') , 6 , 10 , 10 , 15 , 3 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='RV-02'),(SELECT AvailID FROM Availability WHERE Name='RR2 Q3') , 6 , 10 , 10 , 15 , 3 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='RV-04'),(SELECT AvailID FROM Availability WHERE Name='RR2 Q3') , 6 , 10 , 10 , 15 , 3 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='RV-06'),(SELECT AvailID FROM Availability WHERE Name='RR2 Q3') , 6 , 10 , 10 , 15 , 3 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='RV-11'),(SELECT AvailID FROM Availability WHERE Name='RR2 Q3') , 6 , 10 , 10 , 15 , 3 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Picnic-01'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q3') , 24 , 10 , 10 , 15 , 3 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Cabin-08'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q3') , 4 , 10 , 10 , 15 , 3 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Cabin-11'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q3') , 6 , 10 , 10 , 15 , 3 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Cabin-14'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q3') , 8 , 10 , 10 , 15 , 3 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Cabin-16'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q3') , 4 , 10 , 10 , 15 , 3 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Cabin-19'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q3') , 5 , 10 , 10 , 15 , 3 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Dock-P1-03'),(SELECT AvailID FROM Availability WHERE Name='RR3 Fall') , 4 , 5 , 5 , 5 , 3 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Dock-P1-05'),(SELECT AvailID FROM Availability WHERE Name='RR3 Fall') , 2 , 5 , 5 , 5 , 3 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Dock-P2-02'),(SELECT AvailID FROM Availability WHERE Name='RR3 Fall') , 8 , 5 , 5 , 5 , 3 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Dock-P2-04'),(SELECT AvailID FROM Availability WHERE Name='RR3 Fall') , 2 , 5 , 5 , 5 , 3 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Dock-P3-01'),(SELECT AvailID FROM Availability WHERE Name='RR3 Fall') , 2 , 5 , 5 , 5 , 3 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Trailer-02'),(SELECT AvailID FROM Availability WHERE Name='RR2 Q3') , 4 , 10 , 10 , 15 , 3 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Group-03'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q3') , 12 , 10 , 10 , 15 , 3 , NULL)

-- period 4 site costs
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Tent-01'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q4') , 4 , 5 , 5 , 5 , 4 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Tent-02'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q4') , 4 , 5 , 5 , 5 , 4 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Tent-03'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q4') , 6 , 5 , 5 , 5 , 4 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Tent-04'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q4') , 4 , 5 , 5 , 5 , 4 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Tent-15'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q4') , 6 , 5 , 5 , 5 , 4 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Tent-16'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q4') , 4 , 5 , 5 , 5 , 4 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='RV-01'),(SELECT AvailID FROM Availability WHERE Name='RR2 Q4') , 0 , 0 , 0 , 0 , 4 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='RV-02'),(SELECT AvailID FROM Availability WHERE Name='RR2 Q4') , 0 , 0 , 0 , 0 , 4 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='RV-04'),(SELECT AvailID FROM Availability WHERE Name='RR2 Q4') , 0 , 0 , 0 , 0 , 4 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='RV-06'),(SELECT AvailID FROM Availability WHERE Name='RR2 Q4') , 0 , 0 , 0 , 0 , 4 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='RV-11'),(SELECT AvailID FROM Availability WHERE Name='RR2 Q4') , 0 , 0 , 0 , 0 , 4 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Picnic-01'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q4') , 24 , 5 , 5 , 5 , 4 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Cabin-08'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q4') , 4 , 5 , 5 , 5 , 4 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Cabin-11'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q4') , 6 , 5 , 5 , 5 , 4 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Cabin-14'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q4') , 8 , 5 , 5 , 5 , 4 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Cabin-16'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q4') , 4 , 5 , 5 , 5 , 4 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Cabin-19'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q4') , 5 , 5 , 5 , 5 , 4 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Trailer-02'),(SELECT AvailID FROM Availability WHERE Name='RR2 Q4') , 0 , 0 , 0 , 0 , 4 , NULL)
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Group-03'),(SELECT AvailID FROM Availability WHERE Name='RR1 Q4') , 12 , 5 , 5 , 5 , 4 , NULL)

-- Location availability association
INSERT INTO [dbo].[ItemsXAvailability] ([ItemID] ,[AvailID] ,[MaxUnits] ,[BaseRate] ,[WeekdayRate] ,[WeekendRate] ,[DisplayOrder] ,[Description]) VALUES ((SELECT ItemID FROM Items WHERE Name='Raven Ridge Park'),(SELECT AvailID FROM Availability WHERE Name='Raven Ridge Park Availability'), 24, NULL, NULL , NULL, 0, NULL)

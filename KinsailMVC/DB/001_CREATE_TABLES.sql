﻿--------------------------------------------------------------------------------
-- CREATE TABLES script
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


--------------------------------------------------------------------
-- PRE-REQUISITE: Create Functions Used in Computed Table Columns --
--------------------------------------------------------------------------------

CREATE FUNCTION dbo.GetAvailableDate(@Year [int], @Month [int], @Day [int], @FromTo [int])
RETURNS [datetime]
AS 
BEGIN
    DECLARE @Result [datetime]
    IF (@Year IS NULL)
        IF (@FromTo = 0)
            SET @Result = DATEADD(yy, 2000 - 1900, DATEADD(m,  @Month - 1, @Day - 1))
        ELSE
            SET @Result = DATEADD(yy, 2099 - 1900, DATEADD(m,  @Month - 1, @Day - 1))
    ELSE
        SET @Result = DATEADD(yy, @Year - 1900, DATEADD(m,  @Month - 1, @Day - 1))
    RETURN(@Result)
END
GO


-----------------
-- Drop Tables --
-- (if needed) --
--------------------------------------------------------------------------------

--SELECT * FROM [dbo].[ItemsXItems]
--DROP TABLE [dbo].[ItemsXItems]

--SELECT * FROM [dbo].[FeatureTypeValues]
--DROP TABLE [dbo].[FeatureTypeValues]

--SELECT * FROM [dbo].[ItemsXFeatures]
--DROP TABLE [dbo].[ItemsXFeatures]

--SELECT * FROM [dbo].[MapsXFeatures]
--DROP TABLE [dbo].[MapsXFeatures]

--SELECT * FROM [dbo].[Features]
--DROP TABLE [dbo].[Features]

--SELECT * FROM [dbo].[FeatureTypes]
--DROP TABLE [dbo].[FeatureTypes]

--SELECT * FROM [dbo].[ItemsXMaps]
--DROP TABLE [dbo].[ItemsXMaps]

--SELECT * FROM [dbo].[Maps]
--DROP TABLE [dbo].[Maps]

--SELECT * FROM [dbo].[ItemsXImages]
--DROP TABLE [dbo].[ItemsXImages]

--SELECT * FROM [dbo].[Images]
--DROP TABLE [dbo].[Images]

--SELECT * FROM [dbo].[ImageTypes]
--DROP TABLE [dbo].[ImageTypes]

--SELECT * FROM [dbo].[ItemsXLocations]
--DROP TABLE [dbo].[ItemsXLocations]

--SELECT * FROM [dbo].[ItemsXOrganizations]
--DROP TABLE [dbo].[ItemsXOrganizations]

--SELECT * FROM [dbo].[Organizations]
--DROP TABLE [dbo].[Organizations]

--SELECT * FROM [dbo].[ItemsXAvailability]
--DROP TABLE [dbo].[ItemsXAvailability]

--SELECT * FROM [dbo].[ItemsXAvailRates]
--DROP TABLE [dbo].[ItemsXAvailRates]

--SELECT * FROM [dbo].[Rates]
--DROP TABLE [dbo].[Rates]

--SELECT * FROM [dbo].[Availability]
--DROP TABLE [dbo].[Availability]


-----------------------
-- Create New Tables --
--------------------------------------------------------------------------------

-- Association of an Item with an Item
-- This will support hierarchical relations within Items
-- (such as Item of type=Site being a child of an Item of type=Location)
IF EXISTS (SELECT 1
		     FROM information_schema.Tables
		    WHERE table_schema = 'dbo'
		      AND TABLE_NAME = 'ItemsXItems')
	PRINT 'Table dbo.ItemsXItems already exists, skipping CREATE TABLE statement' 
ELSE
	CREATE TABLE dbo.ItemsXItems(
		ID				bigint IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		ItemID			bigint NOT NULL CONSTRAINT FK_ItemsXItems_ItemID REFERENCES Items(ItemID) NOT FOR REPLICATION,
		ParentItemID	bigint NOT NULL CONSTRAINT FK_ItemsXItems_ParentItemID REFERENCES Items(ItemID) NOT FOR REPLICATION,
		RelationDesc	nvarchar(100) NULL,
		CONSTRAINT PK_ItemsXItems PRIMARY KEY CLUSTERED (ID ASC) 
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO

-- FeatureTypes table contains rows for the data type (or widget rendering style) of a feature
-- such as: Text / Date / List / Boolean
IF EXISTS (SELECT 1
		     FROM information_schema.Tables
		    WHERE table_schema = 'dbo'
		      AND TABLE_NAME = 'FeatureTypes')
	PRINT 'Table dbo.FeatureTypes already exists, skipping CREATE TABLE statement' 
ELSE
	CREATE TABLE dbo.FeatureTypes (
		FeatureTypeID	bigint IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		Name			nvarchar(100) NOT NULL,
		Abbreviation	nvarchar(20) NULL,
		[Description]	nvarchar(1000) NULL,
		Category		nvarchar(12) NULL,
		Active			bit NOT NULL CONSTRAINT DF_FeatureTypes_Active DEFAULT (1),
		CONSTRAINT PK_FeatureTypes PRIMARY KEY CLUSTERED (FeatureTypeID ASC) 
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO

-- Features table contains descriptive attributes, such as: color, size, electricalHookup, petsAllowed, ...
IF EXISTS (SELECT 1
		     FROM information_schema.Tables
		    WHERE table_schema = 'dbo'
		      AND TABLE_NAME = 'Features')
	PRINT 'Table dbo.Features already exists, skipping CREATE TABLE statement' 
ELSE
	CREATE TABLE dbo.Features(
		FeatureID		bigint IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		FeatureTypeID	bigint NOT NULL CONSTRAINT FK_Features_FeatureTypeID REFERENCES FeatureTypes(FeatureTypeID) NOT FOR REPLICATION,
		Name			nvarchar(1000) NOT NULL,
		NameNegative    nvarchar(1000) NULL,
		Abbreviation	nvarchar(200) NULL,
		[Description]	nvarchar(1000) NULL,
		SiteFlag		bit NOT NULL CONSTRAINT DF_Features_SiteFlag DEFAULT (0),
		LocationFlag	bit NOT NULL CONSTRAINT DF_Features_LocationFlag DEFAULT (0),
		Hidden			bit NOT NULL CONSTRAINT DF_Features_Hidden DEFAULT (0),
		Active			bit NOT NULL CONSTRAINT DF_Features_Active DEFAULT (1),
		CONSTRAINT PK_Features PRIMARY KEY CLUSTERED (FeatureID ASC) 
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO


-- Lookup values for multi-valued Feature Types
IF EXISTS (SELECT 1
		     FROM information_schema.Tables
		    WHERE table_schema = 'dbo'
		      AND TABLE_NAME = 'FeatureTypeValues')
	PRINT 'Table dbo.FeatureTypeValues already exists, skipping CREATE TABLE statement' 
ELSE
	CREATE TABLE dbo.FeatureTypeValues(
		FeatureTypeValueID  bigint IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		FeatureTypeID		bigint NOT NULL CONSTRAINT FK_FeatureTypeValues_FeatureTypeID REFERENCES FeatureTypes(FeatureTypeID) NOT FOR REPLICATION,
		Name				nvarchar(100) NULL,
		Value				nvarchar(40) NOT NULL,
		[Description]		nvarchar(1000) NULL,
		DisplayOrder		int NOT NULL CONSTRAINT DF_FeatureTypeValues_DisplayOrder  DEFAULT (0),
		Active				bit NOT NULL CONSTRAINT DF_FeatureTypeValues_Active DEFAULT (1),
		CONSTRAINT PK_FeatureTypeValues PRIMARY KEY CLUSTERED (FeatureTypeValueID ASC) 
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO

-- Association of a Feature with an Item, including the value and display order
IF EXISTS (SELECT 1
		     FROM information_schema.Tables
		    WHERE table_schema = 'dbo'
		      AND TABLE_NAME = 'ItemsXFeatures')
	PRINT 'Table dbo.ItemsXFeatures already exists, skipping CREATE TABLE statement' 
ELSE
	CREATE TABLE dbo.ItemsXFeatures(
		ID				bigint IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		ItemID			bigint NOT NULL CONSTRAINT FK_ItemsXFeatures_ItemID REFERENCES Items(ItemID) NOT FOR REPLICATION,
		FeatureID		bigint NOT NULL CONSTRAINT FK_ItemsXFeatures_FeatureID REFERENCES Features(FeatureID) NOT FOR REPLICATION,
		DisplayOrder	int NOT NULL CONSTRAINT DF_ItemsXFeatures_DisplayOrder DEFAULT (0),
		Value			nvarchar(1000) NULL,
		CONSTRAINT PK_ItemsXFeatures PRIMARY KEY CLUSTERED (ID ASC) 
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO

-- ImageTypes table contains rows for the types of images supported
-- such as: GalleryImage / BannerImage / etc...
IF EXISTS (SELECT 1
		     FROM information_schema.Tables
		    WHERE table_schema = 'dbo'
		      AND TABLE_NAME = 'ImageTypes')
	PRINT 'Table dbo.ImageTypes already exists, skipping CREATE TABLE statement' 
ELSE
	CREATE TABLE dbo.ImageTypes (
		ImageTypeID		bigint IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		Name			nvarchar(100) NOT NULL,
		Abbreviation	nvarchar(20) NULL,
		[Description]	nvarchar(1000) NULL,
		Active			bit NOT NULL CONSTRAINT DF_ImageTypes_Active DEFAULT (1),
		CONSTRAINT PK_ImageTypes PRIMARY KEY CLUSTERED (ImageTypeID ASC) 
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO

-- Images
IF EXISTS (SELECT 1
		     FROM information_schema.Tables
		    WHERE table_schema = 'dbo'
		      AND TABLE_NAME = 'Images')
	PRINT 'Table dbo.Images already exists, skipping CREATE TABLE statement' 
ELSE
	CREATE TABLE dbo.Images(
		ImageID		bigint IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		ImageTypeID	bigint NOT NULL CONSTRAINT FK_Images_ImageTypeID REFERENCES ImageTypes(ImageTypeID) NOT FOR REPLICATION,
		IconURL		nvarchar(1000) NULL,
		FullURL		nvarchar(1000) NOT NULL,
		Caption		nvarchar(1000) NULL,
		Source		nvarchar(200) NULL,
		Active		bit NOT NULL CONSTRAINT DF_Images_Active DEFAULT (1),
		CONSTRAINT PK_Images PRIMARY KEY CLUSTERED (ImageID ASC) 
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO

-- Association of an Image with an Item
IF EXISTS (SELECT 1
		     FROM information_schema.Tables
		    WHERE table_schema = 'dbo'
		      AND TABLE_NAME = 'ItemsXImages')
	PRINT 'Table dbo.ItemsXImages already exists, skipping CREATE TABLE statement' 
ELSE
	CREATE TABLE dbo.ItemsXImages(
		ID				bigint IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		ItemID			bigint NOT NULL CONSTRAINT FK_ItemsXImages_ItemID REFERENCES Items(ItemID) NOT FOR REPLICATION,
		ImageID			bigint NOT NULL CONSTRAINT FK_ItemsXImages_ImageID REFERENCES Images(ImageID) NOT FOR REPLICATION,
		DisplayOrder	int NOT NULL CONSTRAINT DF_ItemsXImages_DisplayOrder  DEFAULT (0),
		CONSTRAINT PK_ItemsXImages PRIMARY KEY CLUSTERED (ID ASC) 
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO

-- Maps
IF EXISTS (SELECT 1
		     FROM information_schema.Tables
		    WHERE table_schema = 'dbo'
		      AND TABLE_NAME = 'Maps')
	PRINT 'Table dbo.Maps already exists, skipping CREATE TABLE statement' 
ELSE
	CREATE TABLE dbo.Maps(
		MapID			bigint IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		Name			nvarchar(1000) NOT NULL,
		[Description]	nvarchar(1000) NOT NULL,
		TilesURL		nvarchar(1000) NULL,
		Width			float NULL,
		Height			float NULL,
		CenterX			float NULL,
		CenterY			float NULL,
		ZoomMin			int NULL,
		ZoomMax			int NULL,
		ZoomDefault		int NULL,
		LatitudeNorth	float NULL,
		LatitudeSouth	float NULL,
		LongitudeEast	float NULL,
		LongitudeWest	float NULL,
		Active			bit NOT NULL CONSTRAINT DF_Maps_Active DEFAULT (1),
		CONSTRAINT PK_Maps PRIMARY KEY CLUSTERED (MapID ASC) 
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO

-- Association of an Item with a Map
IF EXISTS (SELECT 1
		     FROM information_schema.Tables
		    WHERE table_schema = 'dbo'
		      AND TABLE_NAME = 'ItemsXMaps')
	PRINT 'Table dbo.ItemsXMaps already exists, skipping CREATE TABLE statement' 
ELSE
	CREATE TABLE dbo.ItemsXMaps(
		ID				bigint IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		ItemID			bigint NOT NULL CONSTRAINT FK_ItemsXMaps_ItemID REFERENCES Items(ItemID) NOT FOR REPLICATION,
		MapID			bigint NOT NULL CONSTRAINT FK_ItemsXMaps_MapID REFERENCES Maps(MapID) NOT FOR REPLICATION,
		DisplayOrder	int NOT NULL CONSTRAINT DF_ItemsXMaps_DisplayOrder DEFAULT (0),
		CoordinateX		float NOT NULL,
		CoordinateY		float NOT NULL,
		LatLongFlag		bit NOT NULL CONSTRAINT DF_ItemsXMaps_LatLongFlag DEFAULT (0),
		CONSTRAINT PK_ItemsXMaps PRIMARY KEY CLUSTERED (ID ASC) 
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO

-- Association of a Map with a Feature (for showing markers on the map)
IF EXISTS (SELECT 1
		     FROM information_schema.Tables
		    WHERE table_schema = 'dbo'
		      AND TABLE_NAME = 'MapsXFeatures')
	PRINT 'Table dbo.MapsXFeatures already exists, skipping CREATE TABLE statement' 
ELSE
	CREATE TABLE dbo.MapsXFeatures(
		ID					bigint IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		MapID				bigint NOT NULL CONSTRAINT FK_MapsXFeatures_MapID REFERENCES Maps(MapID) NOT FOR REPLICATION,
		FeatureID			bigint NOT NULL CONSTRAINT FK_MapsXFeatures_FeatureID REFERENCES Features(FeatureID) NOT FOR REPLICATION,
		DisplayOrder		int NOT NULL CONSTRAINT DF_MapsXFeatures_DisplayOrder DEFAULT (0),
		CustomMarkerFlag	bit NOT NULL CONSTRAINT DF_MapsXFeatures_CustomMarkerFlag DEFAULT (0),
		MatchValue			nvarchar(1000) NULL,
		MatchOperator		nvarchar(10) NULL,
		Marker				nvarchar(100) NULL,
		[Description]		nvarchar(1000) NULL,
		OffsetX				int NOT NULL CONSTRAINT DF_MapsXFeatures_OffsetX DEFAULT (0),
		OffsetY				int NOT NULL CONSTRAINT DF_MapsXFeatures_OffsetY DEFAULT (0),
		CONSTRAINT PK_MapsXFeatures PRIMARY KEY CLUSTERED ([ID] ASC) 
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO

-- Association of an Item with a Location
IF EXISTS (SELECT 1
		     FROM information_schema.Tables
		    WHERE table_schema = 'dbo'
		      AND TABLE_NAME = 'ItemsXLocations')
	PRINT 'Table dbo.ItemsXLocations already exists, skipping CREATE TABLE statement' 
ELSE
	CREATE TABLE dbo.ItemsXLocations(
		ID				bigint IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		ItemID			bigint NOT NULL CONSTRAINT FK_ItemsXLocations_ItemID REFERENCES Items(ItemID) NOT FOR REPLICATION,
		LocationID		bigint NOT NULL CONSTRAINT FK_ItemsXLocations_LocationID REFERENCES Locations(LocationID) NOT FOR REPLICATION,
		DisplayOrder	int NOT NULL CONSTRAINT [DF_ItemsXLocations_DisplayOrder]  DEFAULT (0),
		[Description]	nvarchar(200) NULL,
		CONSTRAINT PK_ItemsXLocations PRIMARY KEY CLUSTERED (ID ASC) 
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO

-- Organizations
IF EXISTS (SELECT 1
		     FROM information_schema.Tables
		    WHERE table_schema = 'dbo'
		      AND TABLE_NAME = 'Organizations')
	PRINT 'Table dbo.Organizations already exists, skipping CREATE TABLE statement' 
ELSE
	CREATE TABLE dbo.Organizations(
		OrgID			bigint IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		Name			nvarchar(200) NOT NULL,
		Abbreviation	nvarchar(40) NULL,
		[Description]	nvarchar(1000) NULL,
		Phone			nvarchar(100) NULL,
		PhoneLabel		nvarchar(20) NULL,
		Phone2			nvarchar(100) NULL,
		Phone2Label		nvarchar(20) NULL,
		Email			nvarchar(100) NULL,
		EmailLabel		nvarchar(20) NULL,
		URL				nvarchar(1000) NULL,
		URLLabel		nvarchar(20) NULL,
		Active			bit NOT NULL CONSTRAINT DF_Organizations_Active DEFAULT (1),
		CONSTRAINT PK_Organizations PRIMARY KEY CLUSTERED (OrgID ASC) 
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO

-- Association of an Item with an Organization
IF EXISTS (SELECT 1
		     FROM information_schema.Tables
		    WHERE table_schema = 'dbo'
		      AND TABLE_NAME = 'ItemsXOrganizations')
	PRINT 'Table dbo.ItemsXOrganizations already exists, skipping CREATE TABLE statement' 
ELSE
	CREATE TABLE dbo.ItemsXOrganizations(
		ID				bigint IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		ItemID			bigint NOT NULL CONSTRAINT FK_ItemsXOrganizations_ItemID REFERENCES Items(ItemID) NOT FOR REPLICATION,
		OrgID			bigint NOT NULL CONSTRAINT FK_ItemsXOrganizations_OrgID REFERENCES Organizations(OrgID) NOT FOR REPLICATION,
		DisplayOrder	int NOT NULL CONSTRAINT DF_ItemsXOrganizations_DisplayOrder DEFAULT (0),
		[Description]	nvarchar(200) NULL,
		CONSTRAINT PK_ItemsXOrganizations PRIMARY KEY CLUSTERED (ID ASC) 
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO

-- Availability Info
IF EXISTS (SELECT 1
		     FROM information_schema.Tables
		    WHERE table_schema = 'dbo'
		      AND TABLE_NAME = 'Availability')
	PRINT 'Table dbo.Availability already exists, skipping CREATE TABLE statement' 
ELSE
	CREATE TABLE dbo.[Availability](
		AvailID				bigint IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		Name				nvarchar(200) NOT NULL,
		[Description]		nvarchar(1000) NULL,
		Policies			nvarchar(MAX) NULL,
		Available			bit NOT NULL CONSTRAINT DF_Availability_Available DEFAULT (1),
		AvailStartYear		int NULL,
		AvailStartMonth		int NULL,
		AvailStartDay		int NULL,
		AvailStartDate		AS (dbo.GetAvailableDate(AvailStartYear, AvailStartMonth, AvailStartDay, 0)),
		AvailEndYear		int NULL,
		AvailEndMonth		int NULL,
		AvailEndDay			int NULL,
		AvailEndDate		AS (dbo.GetAvailableDate(AvailEndYear, AvailEndMonth, AvailEndDay, 1)),
		AvailBeforeDays		int NULL,
		ReserveBeforeDays	int NULL,
		CancelBeforeDays	int NULL,
		MinDurationDays		int NULL,
		MaxDurationDays		int NULL,
		MaxDurationWeekends	int NULL,
		BetweenStaysDays	int NULL,
		Active				bit NOT NULL CONSTRAINT DF_Availability_Active DEFAULT (1),
		CONSTRAINT PK_Availability PRIMARY KEY CLUSTERED (AvailID ASC) 
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO

-- Association of an Item with Availability info (DEPRECATED)
/*
IF EXISTS (SELECT 1
		     FROM information_schema.Tables
		    WHERE table_schema = 'dbo'
		      AND TABLE_NAME = 'ItemsXAvailability')
	PRINT 'Table dbo.ItemsXAvailability already exists, skipping CREATE TABLE statement' 
ELSE
	CREATE TABLE dbo.ItemsXAvailability(
		[ID]			[bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		[ItemID]		[bigint] NOT NULL CONSTRAINT [FK_ItemsXAvailability_ItemID] REFERENCES [Items]([ItemID]) NOT FOR REPLICATION,
		[AvailID]		[bigint] NOT NULL CONSTRAINT [FK_ItemsXAvailability_AvailID] REFERENCES [Availability]([AvailID]) NOT FOR REPLICATION,
		[MaxUnits]		[int] NOT NULL CONSTRAINT [DF_ItemsXAvailability_MaxUnits] DEFAULT ((1)),
		[BaseRate]		[numeric](18,5) NULL CONSTRAINT [DF_ItemsXAvailability_BaseRate] DEFAULT ((0.00)),
		[WeekdayRate]	[numeric](18,5) NULL CONSTRAINT [DF_ItemsXAvailability_WeekdayRate] DEFAULT ((0.00)),
		[WeekendRate]	[numeric](18,5) NULL CONSTRAINT [DF_ItemsXAvailability_WeekendRate] DEFAULT ((0.00)),
		[DisplayOrder]	[int] NOT NULL CONSTRAINT [DF_ItemsXAvailability_DisplayOrder] DEFAULT ((0)),
		[Description]	[nvarchar](200) NULL,
		CONSTRAINT [PK_ItemsXAvailability] PRIMARY KEY CLUSTERED ([ID] ASC) 
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO
*/

-- Rates
IF EXISTS (SELECT 1
		     FROM information_schema.Tables
		    WHERE table_schema = 'dbo'
		      AND TABLE_NAME = 'Rates')
	PRINT 'Table dbo.Rates already exists, skipping CREATE TABLE statement' 
ELSE
	CREATE TABLE dbo.Rates(
		RateID				bigint IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		Name				nvarchar(200) NOT NULL,
		[Description]		nvarchar(1000) NULL,
		ValidFrom			datetime NULL,
		ValidTo				datetime NULL,
		BaseFee				numeric(18, 5) NULL CONSTRAINT DF_Rates_BaseFee DEFAULT (0.00),
		DailyFee			numeric(18, 5) NULL CONSTRAINT DF_Rates_DailyFee DEFAULT (0.00),
		WeekdayFee			numeric(18, 5) NULL CONSTRAINT DF_Rates_WeekdayFee DEFAULT (0.00),
		WeekendFee			numeric(18, 5) NULL CONSTRAINT DF_Rates_WeekendFee DEFAULT (0.00),
		DepositBaseFee		numeric(18, 5) NULL CONSTRAINT DF_Rates_DepositBaseFee DEFAULT (0.00),
		DepositDailyFee		numeric(18, 5) NULL CONSTRAINT DF_Rates_DepositDailyFee DEFAULT (0.00),
		ProcessorBaseFee	numeric(18, 5) NULL CONSTRAINT DF_Rates_ProcessorBaseFee DEFAULT (0.00),
		ProcessorDailyFee	numeric(18, 5) NULL CONSTRAINT DF_Rates_ProcessorDailyFee DEFAULT (0.00),
		DepositPercent		bit NOT NULL CONSTRAINT DF_Rates_DepositPercent DEFAULT (0),
		ProcessorPercent	bit NOT NULL CONSTRAINT DF_Rates_ProcessorPercent DEFAULT (0),
		Active				bit NOT NULL CONSTRAINT DF_Rates_Active DEFAULT (1),
		CONSTRAINT PK_Rates PRIMARY KEY CLUSTERED (RateID ASC) 
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO

-- Association of an Item with Availability Info & Rates
IF EXISTS (SELECT 1
		     FROM information_schema.Tables
		    WHERE table_schema = 'dbo'
		      AND TABLE_NAME = 'ItemsXAvailRates')
	PRINT 'Table dbo.ItemsXAvailRates already exists, skipping CREATE TABLE statement' 
ELSE
	CREATE TABLE dbo.ItemsXAvailRates(
		ID				bigint IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		ItemID			bigint NOT NULL CONSTRAINT FK_ItemsXAvailRates_ItemID REFERENCES Items(ItemID) NOT FOR REPLICATION,
		AvailID			bigint NOT NULL CONSTRAINT FK_ItemsXAvailRates_AvailID REFERENCES [Availability](AvailID) NOT FOR REPLICATION,
		RateID			bigint NOT NULL CONSTRAINT FK_ItemsXAvailRates_RateID REFERENCES Rates(RateID) NOT FOR REPLICATION,
		MaxUnits		int NOT NULL CONSTRAINT DF_ItemsXAvailRates_MaxUnits DEFAULT (1),
		DisplayOrder	int NOT NULL CONSTRAINT DF_ItemsXAvailRates_DisplayOrder DEFAULT (0),
		CONSTRAINT PK_ItemsXAvailRates PRIMARY KEY CLUSTERED (ID ASC) 
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO

-- Table Integers
-- fact table that contains whole numbers
IF OBJECT_ID('dbo.Integers', 'U') IS NOT NULL
	PRINT 'Table dbo.Integers already exists, skipping CREATE TABLE statement' 
ELSE
	CREATE TABLE dbo.Integers(
		Value		int NOT NULL
		CONSTRAINT PK_Integers PRIMARY KEY CLUSTERED (Value ASC) 
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO

-- Table Dates
-- fact table containing dates and pre-generated info about each date (contains entries for each day of the year)
-- computed columns handle most of the column values; persisted (storage is cheap, computation is expensive)
IF OBJECT_ID('dbo.Dates', 'U') IS NOT NULL
	PRINT 'Table dbo.Dates already exists, skipping CREATE TABLE statement' 
ELSE
	CREATE TABLE dbo.Dates(
		[Date]			date PRIMARY KEY NOT NULL,
		[DayOfWeek]		AS DATEDIFF(DAY, -1, [Date]) % 7 + 1 PERSISTED, --deterministic DayOfWeek
		DayOfWeekName	AS CASE DATEDIFF(DAY, -1, [Date]) % 7 + 1 --deterministic DayOfWeekName
							WHEN 1 THEN 'Sunday'
							WHEN 2 THEN 'Monday'
							WHEN 3 THEN 'Tuesday'
							WHEN 4 THEN 'Wednesday'
							WHEN 5 THEN 'Thursday'
							WHEN 6 THEN 'Friday'
							ELSE 'Saturday'
						END PERSISTED,
		[Day]			AS DATEPART(DAY, [Date]) PERSISTED,
		[DayOfYear]		AS DATEPART(DAYOFYEAR, [Date]) PERSISTED,
		WeekOfMonth		AS CASE
							WHEN DATEPART(DAY, [Date]) between 1 and 7 THEN 1
							WHEN DATEPART(DAY, [Date]) between 8 and 14 THEN 2
							WHEN DATEPART(DAY, [Date]) between 15 and 21 THEN 3
							WHEN DATEPART(DAY, [Date]) between 22 and 28 THEN 4
							WHEN DATEPART(DAY, [Date]) > 28 THEN 5
						END PERSISTED,
--		[Week]			AS DATEPART(WEEK, [Date]) PERSISTED, --deterministic solution is complicated, so skipping for now
		[Month]			AS DATEPART(MONTH, [Date]) PERSISTED,
		[MonthName]		AS CASE DATEPART(MONTH, [Date]) --deterministic MonthName
							WHEN 1 THEN 'January'
							WHEN 2 THEN 'February'
							WHEN 3 THEN 'March'
							WHEN 4 THEN 'April'
							WHEN 5 THEN 'May'
							WHEN 6 THEN 'June'
							WHEN 7 THEN 'July'
							WHEN 8 THEN 'August'
							WHEN 9 THEN 'September'
							WHEN 10 THEN 'October'
							WHEN 11 THEN 'November'
							ELSE 'December'
						END PERSISTED,
		[Year]			AS DATEPART(YEAR, [Date]) PERSISTED,
		[Quarter]		AS DATEPART(QUARTER, [Date]) PERSISTED,
		IsWeekend		AS CONVERT(BIT, CASE 
							WHEN DATEDIFF(DAY, -1, [Date]) % 7 + 1 IN (1, 7) THEN 1
							ELSE 0
						END) PERSISTED,
		isResvWeekend	AS CONVERT(BIT, CASE 
							WHEN DATEDIFF(DAY, -1, [Date]) % 7 + 1 IN (6, 7) THEN 1
							ELSE 0
						END) PERSISTED
	) ON [PRIMARY]
GO

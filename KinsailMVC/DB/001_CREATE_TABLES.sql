--------------------------------------------------------------------------------
-- CREATE TABLES script
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
	CREATE TABLE [dbo].[ItemsXItems](
		[ID]			[bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		[ItemID]		[bigint] NOT NULL CONSTRAINT [FK_ItemsXItems_ItemID] REFERENCES [Items]([ItemID]) NOT FOR REPLICATION,
		[ParentItemID]	[bigint] NOT NULL CONSTRAINT [FK_ItemsXItems_ParentItemID] REFERENCES [Items]([ItemID]) NOT FOR REPLICATION,
		[RelationDesc]	[nvarchar](100) NULL,
		CONSTRAINT [PK_ItemsXItems] PRIMARY KEY CLUSTERED ([ID] ASC) 
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
	CREATE TABLE [dbo].[FeatureTypes] (
		[FeatureTypeID]	[bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		[Name]			[nvarchar](100) NOT NULL,
		[Abbreviation]	[nvarchar](20) NULL,
		[Description]	[nvarchar](1000) NULL,
		[Active]		[bit] NOT NULL CONSTRAINT [DF_FeatureTypes_Active] DEFAULT ((1)),
		CONSTRAINT [PK_FeatureTypes] PRIMARY KEY CLUSTERED ([FeatureTypeID] ASC) 
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
	CREATE TABLE [dbo].[Features](
		[FeatureID]		[bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		[FeatureTypeID]	[bigint] NOT NULL CONSTRAINT [FK_Features_FeatureTypeID] REFERENCES [FeatureTypes]([FeatureTypeID]) NOT FOR REPLICATION,
		[Name]			[nvarchar](1000) NOT NULL,
		[Abbreviation]	[nvarchar](200) NULL,
		[Description]	[nvarchar](1000) NULL,
		[Active]		[bit] NOT NULL CONSTRAINT [DF_Features_Active] DEFAULT ((1)),
		CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED ([FeatureID] ASC) 
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
	CREATE TABLE [dbo].[FeatureTypeValues](
		[FeatureTypeValueID]  [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		[FeatureTypeID]	[bigint] NOT NULL CONSTRAINT [FK_FeatureTypeValues_FeatureTypeID] REFERENCES [FeatureTypes]([FeatureTypeID]) NOT FOR REPLICATION,
		[Name]			[nvarchar](100) NULL,
		[Value]			[nvarchar](40) NOT NULL,
		[Description]	[nvarchar](1000) NULL,
		[DisplayOrder]	[int] NOT NULL CONSTRAINT [DF_FeatureTypeValues_DisplayOrder]  DEFAULT ((0)),
		[Active]		[bit] NOT NULL CONSTRAINT [DF_FeatureTypeValues_Active] DEFAULT ((1)),
		CONSTRAINT [PK_FeatureTypeValues] PRIMARY KEY CLUSTERED ([FeatureTypeValueID] ASC) 
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
	CREATE TABLE [dbo].[ItemsXFeatures](
		[ID]			[bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		[ItemID]		[bigint] NOT NULL CONSTRAINT [FK_ItemsXFeatures_ItemID] REFERENCES [Items]([ItemID]) NOT FOR REPLICATION,
		[FeatureID]		[bigint] NOT NULL CONSTRAINT [FK_ItemsXFeatures_FeatureID] REFERENCES [Features]([FeatureID]) NOT FOR REPLICATION,
		[DisplayOrder]	[int] NOT NULL CONSTRAINT [DF_ItemsXFeatures_DisplayOrder]  DEFAULT ((0)),
		[Value]			[nvarchar](1000) NULL,
		CONSTRAINT [PK_ItemsXFeatures] PRIMARY KEY CLUSTERED ([ID] ASC) 
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
	CREATE TABLE [dbo].[ImageTypes] (
		[ImageTypeID]	[bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		[Name]			[nvarchar](100) NOT NULL,
		[Abbreviation]	[nvarchar](20) NULL,
		[Description]	[nvarchar](1000) NULL,
		[Active]		[bit] NOT NULL CONSTRAINT [DF_ImageTypes_Active] DEFAULT ((1)),
		CONSTRAINT [PK_ImageTypes] PRIMARY KEY CLUSTERED ([ImageTypeID] ASC) 
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
	CREATE TABLE [dbo].[Images](
		[ImageID]		[bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		[ImageTypeID]	[bigint] NOT NULL CONSTRAINT [FK_Images_ImageTypeID] REFERENCES [ImageTypes]([ImageTypeID]) NOT FOR REPLICATION,
		[IconURL]		[nvarchar](1000) NULL,
		[FullURL]		[nvarchar](1000) NOT NULL,
		[Caption]		[nvarchar](1000) NULL,
		[Source]		[nvarchar](200) NULL,
		[Active]		[bit] NOT NULL CONSTRAINT [DF_Images_Active] DEFAULT ((1)),
		CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED ([ImageID] ASC) 
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
	CREATE TABLE [dbo].[ItemsXImages](
		[ID]			[bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		[ItemID]		[bigint] NOT NULL CONSTRAINT [FK_ItemsXImages_ItemID] REFERENCES [Items]([ItemID]) NOT FOR REPLICATION,
		[ImageID]		[bigint] NOT NULL CONSTRAINT [FK_ItemsXImages_ImageID] REFERENCES [Images]([ImageID]) NOT FOR REPLICATION,
		[DisplayOrder]	[int] NOT NULL CONSTRAINT [DF_ItemsXImages_DisplayOrder]  DEFAULT ((0)),
		CONSTRAINT [PK_ItemsXImages] PRIMARY KEY CLUSTERED ([ID] ASC) 
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
	CREATE TABLE [dbo].[Maps](
		[MapID]			[bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		[Name]			[nvarchar](1000) NOT NULL,
		[Description]	[nvarchar](1000) NOT NULL,
		[TilesURL]		[nvarchar](1000) NULL,
		[Width]			[float] NULL,
		[Height]		[float] NULL,
		[CenterX]		[float] NULL,
		[CenterY]		[float] NULL,
		[ZoomMin]		[int] NULL,
		[ZoomMax]		[int] NULL,
		[Latitude]		[float] NULL,
		[Longitude]		[float] NULL,
		[Active]		[bit] NOT NULL CONSTRAINT [DF_Maps_Active] DEFAULT (1),
		CONSTRAINT [PK_Maps] PRIMARY KEY CLUSTERED ([MapID] ASC) 
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
	CREATE TABLE [dbo].[ItemsXMaps](
		[ID]			[bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		[ItemID]		[bigint] NOT NULL CONSTRAINT [FK_ItemsXMaps_ItemID] REFERENCES [Items]([ItemID]) NOT FOR REPLICATION,
		[MapID]			[bigint] NOT NULL CONSTRAINT [FK_ItemsXMaps_MapID] REFERENCES [Maps]([MapID]) NOT FOR REPLICATION,
		[DisplayOrder]	[int] NOT NULL CONSTRAINT [DF_ItemsXMaps_DisplayOrder]  DEFAULT ((0)),
		[CoordinateX]	[float] NOT NULL CONSTRAINT [DF_ItemsXMaps_CoordinateX]  DEFAULT ((0.0)),
		[CoordinateY]	[float] NOT NULL CONSTRAINT [DF_ItemsXMaps_CoordinateY]  DEFAULT ((0.0)),
		CONSTRAINT [PK_ItemsXMaps] PRIMARY KEY CLUSTERED ([ID] ASC) 
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
	CREATE TABLE [dbo].[ItemsXLocations](
		[ID]			[bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		[ItemID]		[bigint] NOT NULL CONSTRAINT [FK_ItemsXLocations_ItemID] REFERENCES [Items]([ItemID]) NOT FOR REPLICATION,
		[LocationID]	[bigint] NOT NULL CONSTRAINT [FK_ItemsXLocations_LocationID] REFERENCES [Locations]([LocationID]) NOT FOR REPLICATION,
		[DisplayOrder]	[int] NOT NULL CONSTRAINT [DF_ItemsXLocations_DisplayOrder]  DEFAULT ((0)),
		[Description]	[nvarchar](200) NULL,
		CONSTRAINT [PK_ItemsXLocations] PRIMARY KEY CLUSTERED ([ID] ASC) 
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
	CREATE TABLE [dbo].[Organizations](
		[OrgID]			[bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		[Name]			[nvarchar](200) NOT NULL,
		[Abbreviation]	[nvarchar](40) NULL,
		[Description]	[nvarchar](1000) NULL,
		[Phone]			[nvarchar](100) NULL,
		[PhoneLabel]	[nvarchar](20) NULL,
		[Phone2]		[nvarchar](100) NULL,
		[Phone2Label]	[nvarchar](20) NULL,
		[Email]			[nvarchar](100) NULL,
		[EmailLabel]	[nvarchar](20) NULL,
		[URL]			[nvarchar](1000) NULL,
		[URLLabel]		[nvarchar](20) NULL,
		[Active]		[bit] NOT NULL CONSTRAINT [DF_Organizations_Active] DEFAULT ((1)),
		CONSTRAINT [PK_Organizations] PRIMARY KEY CLUSTERED ([OrgID] ASC) 
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
	CREATE TABLE [dbo].[ItemsXOrganizations](
		[ID]			[bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		[ItemID]		[bigint] NOT NULL CONSTRAINT [FK_ItemsXOrganizations_ItemID] REFERENCES [Items]([ItemID]) NOT FOR REPLICATION,
		[OrgID]			[bigint] NOT NULL CONSTRAINT [FK_ItemsXOrganizations_OrgID] REFERENCES [Organizations]([OrgID]) NOT FOR REPLICATION,
		[DisplayOrder]	[int] NOT NULL CONSTRAINT [DF_ItemsXOrganizations_DisplayOrder]  DEFAULT ((0)),
		[Description]	[nvarchar](200) NULL,
		CONSTRAINT [PK_ItemsXLocations] PRIMARY KEY CLUSTERED ([ID] ASC) 
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
	CREATE TABLE [dbo].[Availability](
		[AvailID]			[bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		[Name]				[nvarchar](200) NOT NULL,
		[Description]		[nvarchar](1000) NULL,
		[Policies]			[nvarchar](1000) NULL,
		[Available]			[bit] NOT NULL CONSTRAINT [DF_Availability_Available] DEFAULT ((1)),
		[AvailStartYear]	[int] NULL,
		[AvailStartMonth]	[int] NULL,
		[AvailStartDay]		[int] NULL,
		[AvailEndYear]		[int] NULL,
		[AvailEndMonth]		[int] NULL,
		[AvailEndDay]		[int] NULL,
		[AvailBeforeDays]	[int] NULL,
		[ReserveBeforeDays]	[int] NULL,
		[CancelBeforeDays]	[int] NULL,
		[MinDurationDays]	[int] NULL,
		[MaxDurationDays]	[int] NULL,
		[Active]			[bit] NOT NULL CONSTRAINT [DF_Availability_Active] DEFAULT ((1)),
		CONSTRAINT [PK_Availability] PRIMARY KEY CLUSTERED ([AvailID] ASC) 
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO

-- Association of an Item with Availability info
IF EXISTS (SELECT 1
		     FROM information_schema.Tables
		    WHERE table_schema = 'dbo'
		      AND TABLE_NAME = 'ItemsXAvailability')
	PRINT 'Table dbo.ItemsXAvailability already exists, skipping CREATE TABLE statement' 
ELSE
	CREATE TABLE [dbo].[ItemsXAvailability](
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

--
-- Decision to not use Groups, so the following are now commented out
--

-- Add GroupType for "Recreation Location"
/*
INSERT INTO [dbo].[GroupTypes]
           ([TypeName]
           ,[ShowInSearchTool]
           ,[ResultsEntryAllowed]
           ,[Active]
           ,[Audit_ContactID])
     VALUES
           ('Recreation Location',
            1,
            1,
            1,
            NULL)
GO

-- Association of a Feature with a Group, including the value and display order
IF EXISTS (SELECT 1
		     FROM information_schema.Tables
		    WHERE table_schema = 'dbo'
		      AND TABLE_NAME = 'GroupsXFeatures')
	PRINT 'Table dbo.GroupsXFeatures already exists, skipping CREATE TABLE statement' 
ELSE
	CREATE TABLE [dbo].[GroupsXFeatures](
		[ID]			[bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		[GroupID]		[bigint] NOT NULL CONSTRAINT [FK_GroupsXFeatures_GroupID] REFERENCES [Groups]([GroupID]) NOT FOR REPLICATION,
		[FeatureID]		[bigint] NOT NULL CONSTRAINT [FK_GroupsXFeatures_FeatureID] REFERENCES [Features]([FeatureID]) NOT FOR REPLICATION,
		[DisplayOrder]	[int] NOT NULL CONSTRAINT [DF_GroupsXFeatures_DisplayOrder]  DEFAULT ((0)),
		[Value]			[nvarchar](1000) NULL,
		CONSTRAINT [PK_GroupsXFeatures] PRIMARY KEY CLUSTERED ([ID] ASC) 
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO

-- Association of an Image with a Group
IF EXISTS (SELECT 1
		     FROM information_schema.Tables
		    WHERE table_schema = 'dbo'
		      AND TABLE_NAME = 'GroupsXImages')
	PRINT 'Table dbo.GroupsXImages already exists, skipping CREATE TABLE statement' 
ELSE
	CREATE TABLE [dbo].[GroupsXImages](
		[ID]			[bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		[GroupID]		[bigint] NOT NULL CONSTRAINT [FK_GroupsXImages_GroupID] REFERENCES [Groups]([GroupID]) NOT FOR REPLICATION,
		[ImageID]		[bigint] NOT NULL CONSTRAINT [FK_GroupsXImages_ImageID] REFERENCES [Images]([ImageID]) NOT FOR REPLICATION,
		[DisplayOrder]	[int] NOT NULL CONSTRAINT [DF_GroupsXImages_DisplayOrder]  DEFAULT ((0)),
		CONSTRAINT [PK_GroupsXImages] PRIMARY KEY CLUSTERED ([ID] ASC) 
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO

-- Association of a Group with a Map
IF EXISTS (SELECT 1
		     FROM information_schema.Tables
		    WHERE table_schema = 'dbo'
		      AND TABLE_NAME = 'GroupsXMaps')
	PRINT 'Table dbo.GroupsXMaps already exists, skipping CREATE TABLE statement' 
ELSE
	CREATE TABLE [dbo].[GroupsXMaps](
		[ID]			[bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		[GroupID]		[bigint] NOT NULL CONSTRAINT [FK_GroupsXMaps_GroupID] REFERENCES [Groups]([GroupID]) NOT FOR REPLICATION,
		[MapID]			[bigint] NOT NULL CONSTRAINT [FK_GroupsXMaps_MapID] REFERENCES [Maps]([MapID]) NOT FOR REPLICATION,
		[DisplayOrder]	[int] NOT NULL CONSTRAINT [DF_GroupsXMaps_DisplayOrder]  DEFAULT ((0)),
		[CoordinateX]	[float] NOT NULL CONSTRAINT [DF_GroupsXMaps_CoordinateX]  DEFAULT ((0.0)),
		[CoordinateY]	[float] NOT NULL CONSTRAINT [DF_GroupsXMaps_CoordinateY]  DEFAULT ((0.0)),
		CONSTRAINT [PK_GroupsXMaps] PRIMARY KEY CLUSTERED ([ID] ASC) 
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO
*/
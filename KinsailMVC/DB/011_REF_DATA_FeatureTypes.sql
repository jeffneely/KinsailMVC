--------------------------------------------------------------------------------
-- REF DATA script
-- FeatureTypes
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

-- Add FeatureTypes
INSERT INTO [dbo].[FeatureTypes]
           ([Name]
           ,[Abbreviation]
           ,[Category]
           ,[Description]
           ,[Active])
     VALUES
           ('Boolean',
            'Boolean',
			'NUMBER',
            'Yes/no flag',
            1)
GO

INSERT INTO [dbo].[FeatureTypes]
           ([Name]
           ,[Abbreviation]
           ,[Category]
           ,[Description]
           ,[Active])
     VALUES
           ('String',
            'String',
			'TEXT',
            'Character data',
            1)
GO

INSERT INTO [dbo].[FeatureTypes]
           ([Name]
           ,[Abbreviation]
           ,[Category]
           ,[Description]
           ,[Active])
     VALUES
           ('Integer',
            'Integer',
			'NUMBER',
            'Integer number',
            1)
GO

INSERT INTO [dbo].[FeatureTypes]
           ([Name]
           ,[Abbreviation]
           ,[Category]
           ,[Description]
           ,[Active])
     VALUES
           ('Surface Type',
            'SurfaceType',
			'ENUM',
            'Enumerated type, describing the surface characteristics',
            1)
GO

INSERT INTO [dbo].[FeatureTypes]
           ([Name]
           ,[Abbreviation]
           ,[Category]
           ,[Description]
           ,[Active])
     VALUES
           ('Shade Type',
            'ShadeType',
			'ENUM',
            'Enumerated type, describing the shade characteristics',
            1)
GO

INSERT INTO [dbo].[FeatureTypes]
           ([Name]
           ,[Abbreviation]
           ,[Category]
           ,[Description]
           ,[Active])
     VALUES
           ('Site Type',
            'SiteType',
			'ENUM',
            'Enumerated type, describing the kind of site',
            1)
GO


-- Feature Type Values: Surface Types
INSERT INTO [dbo].[FeatureTypeValues]
           ([FeatureTypeID]
           ,[Name]
           ,[Abbreviation]
           ,[Value]
           ,[Description]
           ,[DisplayOrder]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Surface Type') --FeatureTypeID
           ,'Gravel' --Name
           ,'Gravel' --Abbreviation
           ,'0' --Value
           ,'' --Description
           ,0 --DisplayOrder
           ,1 --Active
           )
GO

INSERT INTO [dbo].[FeatureTypeValues]
           ([FeatureTypeID]
           ,[Name]
           ,[Abbreviation]
           ,[Value]
           ,[Description]
           ,[DisplayOrder]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Surface Type') --FeatureTypeID
           ,'Pavement' --Name
           ,'Pavement' --Abbreviation
           ,'1' --Value
           ,'' --Description
           ,1 --DisplayOrder
           ,1 --Active
           )
GO

INSERT INTO [dbo].[FeatureTypeValues]
           ([FeatureTypeID]
           ,[Name]
           ,[Abbreviation]
           ,[Value]
           ,[Description]
           ,[DisplayOrder]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Surface Type') --FeatureTypeID
           ,'Dirt' --Name
           ,'Dirt' --Abbreviation
           ,'2' --Value
           ,'' --Description
           ,2 --DisplayOrder
           ,1 --Active
           )
GO

-- Feature Type Values: Shade Types
INSERT INTO [dbo].[FeatureTypeValues]
           ([FeatureTypeID]
           ,[Name]
           ,[Abbreviation]
           ,[Value]
           ,[Description]
           ,[DisplayOrder]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Shade Type') --FeatureTypeID
           ,'None' --Name
           ,'None' --Abbreviation
           ,'0' --Value
           ,'No shade is available' --Description
           ,0 --DisplayOrder
           ,1 --Active
           )
GO

INSERT INTO [dbo].[FeatureTypeValues]
           ([FeatureTypeID]
           ,[Name]
           ,[Abbreviation]
           ,[Value]
           ,[Description]
           ,[DisplayOrder]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Shade Type') --FeatureTypeID
           ,'Full' --Name
           ,'Full' --Abbreviation
           ,'1' --Value
           ,'The site is completely coverted in shade' --Description
           ,1 --DisplayOrder
           ,1 --Active
           )
GO

INSERT INTO [dbo].[FeatureTypeValues]
           ([FeatureTypeID]
           ,[Name]
           ,[Abbreviation]
           ,[Value]
           ,[Description]
           ,[DisplayOrder]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Shade Type') --FeatureTypeID
           ,'Partial' --Name
           ,'Partial' --Abbreviation
           ,'2' --Value
           ,'The site has partial shade' --Description
           ,2 --DisplayOrder
           ,1 --Active
           )
GO

-- Feature Type Values: Site Types
INSERT INTO [dbo].[FeatureTypeValues]
           ([FeatureTypeID]
           ,[Name]
           ,[Abbreviation]
           ,[Value]
           ,[Description]
           ,[DisplayOrder]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Site Type') --FeatureTypeID
           ,'Tent Site' --Name
           ,'TentSite' --Abbreviation
           ,'1' --Value
           ,'Tent site' --Description
           ,0 --DisplayOrder
           ,1 --Active
           )
GO

INSERT INTO [dbo].[FeatureTypeValues]
           ([FeatureTypeID]
           ,[Name]
           ,[Abbreviation]
           ,[Value]
           ,[Description]
           ,[DisplayOrder]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Site Type') --FeatureTypeID
           ,'RV Site' --Name
           ,'RVSite' --Abbreviation
           ,'2' --Value
           ,'Recreational Vehicle (RV) site' --Description
           ,1 --DisplayOrder
           ,1 --Active
           )
GO

INSERT INTO [dbo].[FeatureTypeValues]
           ([FeatureTypeID]
           ,[Name]
           ,[Abbreviation]
           ,[Value]
           ,[Description]
           ,[DisplayOrder]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Site Type') --FeatureTypeID
           ,'Picnic Shelter' --Name
           ,'PicnicShelter' --Abbreviation
           ,'4' --Value
           ,'Picnic shelter' --Description
           ,2 --DisplayOrder
           ,1 --Active
           )
GO

INSERT INTO [dbo].[FeatureTypeValues]
           ([FeatureTypeID]
           ,[Name]
           ,[Abbreviation]
           ,[Value]
           ,[Description]
           ,[DisplayOrder]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Site Type') --FeatureTypeID
           ,'Group Tent Site' --Name
           ,'GroupTentSite' --Abbreviation
           ,'8' --Value
           ,'Group tent site' --Description
           ,3 --DisplayOrder
           ,1 --Active
           )
GO

INSERT INTO [dbo].[FeatureTypeValues]
           ([FeatureTypeID]
           ,[Name]
           ,[Abbreviation]
           ,[Value]
           ,[Description]
           ,[DisplayOrder]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Site Type') --FeatureTypeID
           ,'Trailer Site' --Name
           ,'TrailerSite' --Abbreviation
           ,'16' --Value
           ,'Trailer site' --Description
           ,4 --DisplayOrder
           ,1 --Active
           )
GO

INSERT INTO [dbo].[FeatureTypeValues]
           ([FeatureTypeID]
           ,[Name]
           ,[Abbreviation]
           ,[Value]
           ,[Description]
           ,[DisplayOrder]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Site Type') --FeatureTypeID
           ,'Cabin' --Name
           ,'Cabin' --Abbreviation
           ,'32' --Value
           ,'Cabin site' --Description
           ,5 --DisplayOrder
           ,1 --Active
           )
GO

INSERT INTO [dbo].[FeatureTypeValues]
           ([FeatureTypeID]
           ,[Name]
           ,[Abbreviation]
           ,[Value]
           ,[Description]
           ,[DisplayOrder]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Site Type') --FeatureTypeID
           ,'Boat' --Name
           ,'Boat' --Abbreviation
           ,'64' --Value
           ,'Boat site' --Description
           ,6 --DisplayOrder
           ,1 --Active
           )
GO

INSERT INTO [dbo].[FeatureTypeValues]
           ([FeatureTypeID]
           ,[Name]
           ,[Abbreviation]
           ,[Value]
           ,[Description]
           ,[DisplayOrder]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Site Type') --FeatureTypeID
           ,'Yurt' --Name
           ,'Yurt' --Abbreviation
           ,'128' --Value
           ,'Yurt site' --Description
           ,7 --DisplayOrder
           ,1 --Active
           )
GO
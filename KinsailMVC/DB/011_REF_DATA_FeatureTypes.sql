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
           ,[Description]
           ,[Active])
     VALUES
           ('Boolean',
            'Boolean',
            'Yes/no flag',
            1)
GO

INSERT INTO [dbo].[FeatureTypes]
           ([Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ('String',
            'String',
            'Character data',
            1)
GO

INSERT INTO [dbo].[FeatureTypes]
           ([Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ('Integer',
            'Integer',
            'Integer number',
            1)
GO

INSERT INTO [dbo].[FeatureTypes]
           ([Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ('SurfaceType',
            'SurfaceType',
            'Enumerated type, describing the surface characteristics',
            1)
GO

INSERT INTO [dbo].[FeatureTypes]
           ([Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ('ShadeType',
            'ShadeType',
            'Enumerated type, describing the shade characteristics',
            1)
GO
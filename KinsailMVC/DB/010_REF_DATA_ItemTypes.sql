--------------------------------------------------------------------------------
-- REF DATA script
-- ItemTypes
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

-- Add ItemType for "Recreation Location"
INSERT INTO [dbo].[ItemTypes]
           ([Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active]
           ,[Individuals]
           ,[PluralFormat]
           ,[ShowInSearchTool]
           ,[PublicType]
           ,[Audit_ContactID]
           ,[ParentItemTypeID])
     VALUES
           ('Recreation Location',
            'Location',
            'Recreation Location (such as a campground)',
            1,
            1,
            's',
            1,
            1, 
            NULL,
            NULL)
GO

-- Add ItemType for "Recreation Site"
INSERT INTO [dbo].[ItemTypes]
           ([Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active]
           ,[Individuals]
           ,[PluralFormat]
           ,[ShowInSearchTool]
           ,[PublicType]
           ,[Audit_ContactID]
           ,[ParentItemTypeID])
     VALUES
           ('Recreation Site',
            'Site',
            'Recreation Site (such as camping area within a campground)',
            1,
            1,
            's',
            1,
            1, 
            NULL,
            (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Location'))
GO

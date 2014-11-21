--------------------------------------------------------------------------------
-- REF DATA script
-- ImageTypes
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

-- Add ImageTypes
INSERT INTO [dbo].[ImageTypes]
           ([Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ('Gallery Image',
            'galleryImage',
            'Photo of a site or location',
            1)
GO

INSERT INTO [dbo].[ImageTypes]
           ([Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ('Banner Image',
            'bannerImage',
            'Branding image, typically displayed in the header',
            1)
GO

--------------------------------------------------------------------------------
-- SAMPLE DATA script
-- Features
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


-- ItemsXFeatures
-- SiteTypes
INSERT INTO [dbo].[ItemsXFeatures]
           ([ItemID]
           ,[FeatureID]
           ,[DisplayOrder]
           ,[Value])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Salisbury Cabin')
           ,(SELECT FeatureID FROM Features WHERE Name = 'Site Type')
           ,0
           ,32) -- 32=Cabin
GO

INSERT INTO [dbo].[ItemsXFeatures]
           ([ItemID]
           ,[FeatureID]
           ,[DisplayOrder]
           ,[Value])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Gastonia Cabin')
           ,(SELECT FeatureID FROM Features WHERE Name = 'Site Type')
           ,0
           ,32) -- 32=Cabin
GO

INSERT INTO [dbo].[ItemsXFeatures]
           ([ItemID]
           ,[FeatureID]
           ,[DisplayOrder]
           ,[Value])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Ichabod Campsite')
           ,(SELECT FeatureID FROM Features WHERE Name = 'Site Type')
           ,0
           ,1) -- 1=tentSite
GO


-- ItemsXFeatures
-- Other features
INSERT INTO [dbo].[ItemsXFeatures]
           ([ItemID]
           ,[FeatureID]
           ,[DisplayOrder]
           ,[Value])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Gastonia Cabin')
           ,(SELECT FeatureID FROM Features WHERE Name = 'Horse Accomodation')
           ,1
           ,1)
GO

INSERT INTO [dbo].[ItemsXFeatures]
           ([ItemID]
           ,[FeatureID]
           ,[DisplayOrder]
           ,[Value])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Gastonia Cabin')
           ,(SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed')
           ,2
           ,1)
GO

INSERT INTO [dbo].[ItemsXFeatures]
           ([ItemID]
           ,[FeatureID]
           ,[DisplayOrder]
           ,[Value])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Ichabod Campsite')
           ,(SELECT FeatureID FROM Features WHERE Name = 'Boat Accessible')
           ,1
           ,1) -- 1=tentSite
GO
--------------------------------------------------------------------------------
-- SAMPLE DATA script
-- Maps
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


-- Maps
INSERT INTO [dbo].[Maps]
           ([Name]
           ,[Description]
           ,[TilesURL]
           ,[Active])
     VALUES
           ('Sleepy Hollow Site Map'
           ,'Stylized overhead map, showing recreation sites at the location'
           ,''
           ,1)
GO

INSERT INTO [dbo].[Maps]
           ([Name]
           ,[Description]
           ,[TilesURL]
           ,[Active])
     VALUES
           ('Raven Ridge Site Map' --Name
           ,'Stylized overhead map. showing the surrounding park and camping sites ...' --Description
           ,'/maptiles' --TilesURL
           ,1 --Active
           )
GO

-- ItemsXMaps
-- for Locations
INSERT INTO [dbo].[ItemsXMaps]
           ([ItemID]
           ,[MapID]
           ,[DisplayOrder]
           ,[CoordinateX]
           ,[CoordinateY])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Sleepy Hollow') --ItemID
           ,(SELECT MapID FROM Maps WHERE Name = 'Sleepy Hollow Site Map') --MapID
           ,0 --DisplayOrder
           ,0.0 --CoordinateX
           ,0.0 --CoordinateY
		   )
GO

INSERT INTO [dbo].[ItemsXMaps]
           ([ItemID]
           ,[MapID]
           ,[DisplayOrder]
           ,[CoordinateX]
           ,[CoordinateY])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park') --ItemID
           ,(SELECT MapID FROM Maps WHERE Name = 'Raven Ridge Site Map') --MapID
           ,0 --DisplayOrder
           ,0.0 --CoordinateX
           ,0.0 --CoordinateY
		   )
GO

-- for sites
INSERT INTO [dbo].[ItemsXMaps]
           ([ItemID]
           ,[MapID]
           ,[DisplayOrder]
           ,[CoordinateX]
           ,[CoordinateY])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Gastonia Cabin')
           ,(SELECT MapID FROM Maps WHERE Name = 'Sleepy Hollow Site Map')
           ,0
           ,4.0
           ,2.0)
GO

INSERT INTO [dbo].[ItemsXMaps]
           ([ItemID]
           ,[MapID]
           ,[DisplayOrder]
           ,[CoordinateX]
           ,[CoordinateY])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Salisbury Cabin')
           ,(SELECT MapID FROM Maps WHERE Name = 'Sleepy Hollow Site Map')
           ,0
           ,1.0
           ,4.0)
GO

INSERT INTO [dbo].[ItemsXMaps]
           ([ItemID]
           ,[MapID]
           ,[DisplayOrder]
           ,[CoordinateX]
           ,[CoordinateY])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Ichabod Campsite')
           ,(SELECT MapID FROM Maps WHERE Name = 'Sleepy Hollow Site Map')
           ,0
           ,2.0
           ,6.0)
GO


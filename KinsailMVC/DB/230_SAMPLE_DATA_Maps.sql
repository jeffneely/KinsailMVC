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

-- ItemsXMaps
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
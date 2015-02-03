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


--
-- Raven Ridge Sample Maps Data
--

-- Maps
INSERT INTO [dbo].[Maps]
           ([Name]
           ,[Description]
           ,[TilesURL]
		   ,[Width]
		   ,[Height]
		   ,[CenterX]
		   ,[CenterY]
		   ,[ZoomMin]
		   ,[ZoomMax]
		   ,[LatitudeNorth]
		   ,[LongitudeEast]
           ,[Active])
     VALUES
           ('Raven Ridge Site Map' --Name
           ,'Stylized overhead map. showing the surrounding park and camping sites ...' --Description
           ,'/maptiles' --TilesURL
		   ,3200 --Width
		   ,2400 --Height
		   ,0 --CenterX
		   ,0 --CenterY
		   ,2 --ZoomMin
		   ,4 --ZoomMax
		   ,38.998 --LatitudeNorth
		   ,-105.551 --LongitudeEast
           ,1 --Active
           )
GO

-- ItemsXMaps
INSERT INTO [dbo].[ItemsXMaps] ([ItemID], [MapID], [DisplayOrder], [CoordinateX], [CoordinateY]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-01'), (SELECT MapID FROM Maps WHERE Name='Raven Ridge Site Map'), 1, 82, -87)
INSERT INTO [dbo].[ItemsXMaps] ([ItemID], [MapID], [DisplayOrder], [CoordinateX], [CoordinateY]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-02'), (SELECT MapID FROM Maps WHERE Name='Raven Ridge Site Map'), 1, 80, -96)
INSERT INTO [dbo].[ItemsXMaps] ([ItemID], [MapID], [DisplayOrder], [CoordinateX], [CoordinateY]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-03'), (SELECT MapID FROM Maps WHERE Name='Raven Ridge Site Map'), 1, 79, -116)
INSERT INTO [dbo].[ItemsXMaps] ([ItemID], [MapID], [DisplayOrder], [CoordinateX], [CoordinateY]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-04'), (SELECT MapID FROM Maps WHERE Name='Raven Ridge Site Map'), 1, 78, -142)
INSERT INTO [dbo].[ItemsXMaps] ([ItemID], [MapID], [DisplayOrder], [CoordinateX], [CoordinateY]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-15'), (SELECT MapID FROM Maps WHERE Name='Raven Ridge Site Map'), 1, 82, -139)
INSERT INTO [dbo].[ItemsXMaps] ([ItemID], [MapID], [DisplayOrder], [CoordinateX], [CoordinateY]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-16'), (SELECT MapID FROM Maps WHERE Name='Raven Ridge Site Map'), 1, 81, -147)
INSERT INTO [dbo].[ItemsXMaps] ([ItemID], [MapID], [DisplayOrder], [CoordinateX], [CoordinateY]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-01'), (SELECT MapID FROM Maps WHERE Name='Raven Ridge Site Map'), 1, 32, 50)
INSERT INTO [dbo].[ItemsXMaps] ([ItemID], [MapID], [DisplayOrder], [CoordinateX], [CoordinateY]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-02'), (SELECT MapID FROM Maps WHERE Name='Raven Ridge Site Map'), 1, 44, 14)
INSERT INTO [dbo].[ItemsXMaps] ([ItemID], [MapID], [DisplayOrder], [CoordinateX], [CoordinateY]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-04'), (SELECT MapID FROM Maps WHERE Name='Raven Ridge Site Map'), 1, 47, 32)
INSERT INTO [dbo].[ItemsXMaps] ([ItemID], [MapID], [DisplayOrder], [CoordinateX], [CoordinateY]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-06'), (SELECT MapID FROM Maps WHERE Name='Raven Ridge Site Map'), 1, 23, 23)
INSERT INTO [dbo].[ItemsXMaps] ([ItemID], [MapID], [DisplayOrder], [CoordinateX], [CoordinateY]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-11'), (SELECT MapID FROM Maps WHERE Name='Raven Ridge Site Map'), 1, 41, 56)
INSERT INTO [dbo].[ItemsXMaps] ([ItemID], [MapID], [DisplayOrder], [CoordinateX], [CoordinateY]) VALUES((SELECT ItemID FROM Items WHERE Name='Picnic-01'), (SELECT MapID FROM Maps WHERE Name='Raven Ridge Site Map'), 1, 72, 62)
INSERT INTO [dbo].[ItemsXMaps] ([ItemID], [MapID], [DisplayOrder], [CoordinateX], [CoordinateY]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-08'), (SELECT MapID FROM Maps WHERE Name='Raven Ridge Site Map'), 1, 41, -161)
INSERT INTO [dbo].[ItemsXMaps] ([ItemID], [MapID], [DisplayOrder], [CoordinateX], [CoordinateY]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-11'), (SELECT MapID FROM Maps WHERE Name='Raven Ridge Site Map'), 1, 27, -122)
INSERT INTO [dbo].[ItemsXMaps] ([ItemID], [MapID], [DisplayOrder], [CoordinateX], [CoordinateY]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-14'), (SELECT MapID FROM Maps WHERE Name='Raven Ridge Site Map'), 1, 30, -140)
INSERT INTO [dbo].[ItemsXMaps] ([ItemID], [MapID], [DisplayOrder], [CoordinateX], [CoordinateY]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-16'), (SELECT MapID FROM Maps WHERE Name='Raven Ridge Site Map'), 1, 42, -128)
INSERT INTO [dbo].[ItemsXMaps] ([ItemID], [MapID], [DisplayOrder], [CoordinateX], [CoordinateY]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-19'), (SELECT MapID FROM Maps WHERE Name='Raven Ridge Site Map'), 1, 46, -151)
INSERT INTO [dbo].[ItemsXMaps] ([ItemID], [MapID], [DisplayOrder], [CoordinateX], [CoordinateY]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P1-03'), (SELECT MapID FROM Maps WHERE Name='Raven Ridge Site Map'), 1, -3, 53)
INSERT INTO [dbo].[ItemsXMaps] ([ItemID], [MapID], [DisplayOrder], [CoordinateX], [CoordinateY]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P1-05'), (SELECT MapID FROM Maps WHERE Name='Raven Ridge Site Map'), 1, 73, 2)
INSERT INTO [dbo].[ItemsXMaps] ([ItemID], [MapID], [DisplayOrder], [CoordinateX], [CoordinateY]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P2-02'), (SELECT MapID FROM Maps WHERE Name='Raven Ridge Site Map'), 1, 78, -21)
INSERT INTO [dbo].[ItemsXMaps] ([ItemID], [MapID], [DisplayOrder], [CoordinateX], [CoordinateY]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P2-04'), (SELECT MapID FROM Maps WHERE Name='Raven Ridge Site Map'), 1, 80, -46)
INSERT INTO [dbo].[ItemsXMaps] ([ItemID], [MapID], [DisplayOrder], [CoordinateX], [CoordinateY]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P3-01'), (SELECT MapID FROM Maps WHERE Name='Raven Ridge Site Map'), 1, 66, 7)
INSERT INTO [dbo].[ItemsXMaps] ([ItemID], [MapID], [DisplayOrder], [CoordinateX], [CoordinateY]) VALUES((SELECT ItemID FROM Items WHERE Name='Trailer-02'), (SELECT MapID FROM Maps WHERE Name='Raven Ridge Site Map'), 1, 72, -128)
INSERT INTO [dbo].[ItemsXMaps] ([ItemID], [MapID], [DisplayOrder], [CoordinateX], [CoordinateY]) VALUES((SELECT ItemID FROM Items WHERE Name='Group-03'), (SELECT MapID FROM Maps WHERE Name='Raven Ridge Site Map'), 1, 68, 21)


--------------------------------------------------------------------------------
-- SAMPLE DATA script
-- Addresses
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


-- Locations (Addresses for Rec Locations)
INSERT INTO [dbo].[Locations]
           ([LocationName]
           ,[StreetAddress]
           ,[StreetAddress2]
           ,[City]
           ,[State]
           ,[ZipCode]
           ,[Country]
           ,[Directions]
           ,[Parking]
           ,[Active]
           ,[Latitude]
           ,[Longitude]
           ,[Audit_ContactID])
     VALUES
           ('Beach Park Entrance' --LocationName
           ,'18000 Goldenwest St' --StreetAddress
           ,'' --StreetAddress2
           ,'Huntington Beach' --City
           ,'CA' --State
           ,'712189' --ZipCode
           ,'US' --Country
           ,'DIRECTIONS: Lorem ipsum dolor sit amet...' --Directions
           ,'PARKING: Lorem ipsum dolor sit amet...' --Parking
           ,1 --Active
           ,33.637 --Latitude
           ,-117.971 --Longitude
           ,NULL --Audit_ContactID
           )
GO

INSERT INTO [dbo].[Locations]
           ([LocationName]
           ,[StreetAddress]
           ,[StreetAddress2]
           ,[City]
           ,[State]
           ,[ZipCode]
           ,[Country]
           ,[Directions]
           ,[Parking]
           ,[Active]
           ,[Latitude]
           ,[Longitude]
           ,[Audit_ContactID])
     VALUES
           ('Sleepy Hollow Park Entrance' --LocationName
           ,'127 Devries Ave' --StreetAddress
           ,'' --StreetAddress2
           ,'Sleepy Hollow' --City
           ,'NY' --State
           ,'10591' --ZipCode
           ,'US' --Country
           ,'DIRECTIONS: Lorem ipsum dolor sit amet...' --Directions
           ,'PARKING: Lorem ipsum dolor sit amet...' --Parking
           ,1 --Active
           ,41.091 --Latitude
           ,-73.866 --Longitude
           ,NULL --Audit_ContactID
           )
GO


-- ItemsXLocations (for Rec Locations)
INSERT INTO [dbo].[ItemsXLocations]
           ([ItemID]
           ,[LocationID]
           ,[DisplayOrder]
           ,[Description])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Beach Park') --ItemID
           ,(SELECT LocationID FROM Locations WHERE LocationName = 'Beach Park Entrance') --LocationID
           ,0 --DisplayOrder
           ,'Main Visitor Entrance' --Description
           )
GO

INSERT INTO [dbo].[ItemsXLocations]
           ([ItemID]
           ,[LocationID]
           ,[DisplayOrder]
           ,[Description])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Sleepy Hollow') --ItemID
           ,(SELECT LocationID FROM Locations WHERE LocationName = 'Sleepy Hollow Park Entrance') --LocationID
           ,0 --DisplayOrder
           ,'Main Visitor Entrance' --Description
           )
GO
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


-------------------------------------------------------------------------------
-- Sleepy Hollow Location Features
-------------------------------------------------------------------------------
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Sleepy Hollow'), (SELECT FeatureID FROM Features WHERE Abbreviation='tentSites'), 1, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Sleepy Hollow'), (SELECT FeatureID FROM Features WHERE Abbreviation='cabinLodging'), 4, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Sleepy Hollow'), (SELECT FeatureID FROM Features WHERE Abbreviation='hikingTrails'), 6, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Sleepy Hollow'), (SELECT FeatureID FROM Features WHERE Abbreviation='restrooms'), 8, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Sleepy Hollow'), (SELECT FeatureID FROM Features WHERE Abbreviation='fishing'), 12, '1')


-------------------------------------------------------------------------------
-- Raven Ridge Site Features
-------------------------------------------------------------------------------

-- siteType
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-01'), (SELECT FeatureID FROM Features WHERE Abbreviation='siteType'), 0, '1') 
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-02'), (SELECT FeatureID FROM Features WHERE Abbreviation='siteType'), 0, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-03'), (SELECT FeatureID FROM Features WHERE Abbreviation='siteType'), 0, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-04'), (SELECT FeatureID FROM Features WHERE Abbreviation='siteType'), 0, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-15'), (SELECT FeatureID FROM Features WHERE Abbreviation='siteType'), 0, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-16'), (SELECT FeatureID FROM Features WHERE Abbreviation='siteType'), 0, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-01'), (SELECT FeatureID FROM Features WHERE Abbreviation='siteType'), 0, '2')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-02'), (SELECT FeatureID FROM Features WHERE Abbreviation='siteType'), 0, '2')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-04'), (SELECT FeatureID FROM Features WHERE Abbreviation='siteType'), 0, '2')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-06'), (SELECT FeatureID FROM Features WHERE Abbreviation='siteType'), 0, '2')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-11'), (SELECT FeatureID FROM Features WHERE Abbreviation='siteType'), 0, '2')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Picnic-01'), (SELECT FeatureID FROM Features WHERE Abbreviation='siteType'), 0, '4')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-08'), (SELECT FeatureID FROM Features WHERE Abbreviation='siteType'), 0, '32')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-11'), (SELECT FeatureID FROM Features WHERE Abbreviation='siteType'), 0, '32')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-14'), (SELECT FeatureID FROM Features WHERE Abbreviation='siteType'), 0, '32')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-16'), (SELECT FeatureID FROM Features WHERE Abbreviation='siteType'), 0, '32')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-19'), (SELECT FeatureID FROM Features WHERE Abbreviation='siteType'), 0, '32')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P1-03'), (SELECT FeatureID FROM Features WHERE Abbreviation='siteType'), 0, '64')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P1-05'), (SELECT FeatureID FROM Features WHERE Abbreviation='siteType'), 0, '64')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P2-02'), (SELECT FeatureID FROM Features WHERE Abbreviation='siteType'), 0, '64')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P2-04'), (SELECT FeatureID FROM Features WHERE Abbreviation='siteType'), 0, '64')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P3-01'), (SELECT FeatureID FROM Features WHERE Abbreviation='siteType'), 0, '64')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Trailer-02'), (SELECT FeatureID FROM Features WHERE Abbreviation='siteType'), 0, '16')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Group-03'), (SELECT FeatureID FROM Features WHERE Abbreviation='siteType'), 0, '8')

-- minOccupants
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-01'), (SELECT FeatureID FROM Features WHERE Abbreviation='minOccupants'), 1, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-02'), (SELECT FeatureID FROM Features WHERE Abbreviation='minOccupants'), 1, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-03'), (SELECT FeatureID FROM Features WHERE Abbreviation='minOccupants'), 1, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-04'), (SELECT FeatureID FROM Features WHERE Abbreviation='minOccupants'), 1, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-15'), (SELECT FeatureID FROM Features WHERE Abbreviation='minOccupants'), 1, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-16'), (SELECT FeatureID FROM Features WHERE Abbreviation='minOccupants'), 1, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-01'), (SELECT FeatureID FROM Features WHERE Abbreviation='minOccupants'), 1, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-02'), (SELECT FeatureID FROM Features WHERE Abbreviation='minOccupants'), 1, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-04'), (SELECT FeatureID FROM Features WHERE Abbreviation='minOccupants'), 1, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-06'), (SELECT FeatureID FROM Features WHERE Abbreviation='minOccupants'), 1, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-11'), (SELECT FeatureID FROM Features WHERE Abbreviation='minOccupants'), 1, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Picnic-01'), (SELECT FeatureID FROM Features WHERE Abbreviation='minOccupants'), 1, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-08'), (SELECT FeatureID FROM Features WHERE Abbreviation='minOccupants'), 1, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-11'), (SELECT FeatureID FROM Features WHERE Abbreviation='minOccupants'), 1, '2')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-14'), (SELECT FeatureID FROM Features WHERE Abbreviation='minOccupants'), 1, '3')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-16'), (SELECT FeatureID FROM Features WHERE Abbreviation='minOccupants'), 1, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-19'), (SELECT FeatureID FROM Features WHERE Abbreviation='minOccupants'), 1, '2')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P1-03'), (SELECT FeatureID FROM Features WHERE Abbreviation='minOccupants'), 1, '2')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P1-05'), (SELECT FeatureID FROM Features WHERE Abbreviation='minOccupants'), 1, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P2-02'), (SELECT FeatureID FROM Features WHERE Abbreviation='minOccupants'), 1, '3')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P2-04'), (SELECT FeatureID FROM Features WHERE Abbreviation='minOccupants'), 1, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P3-01'), (SELECT FeatureID FROM Features WHERE Abbreviation='minOccupants'), 1, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Trailer-02'), (SELECT FeatureID FROM Features WHERE Abbreviation='minOccupants'), 1, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Group-03'), (SELECT FeatureID FROM Features WHERE Abbreviation='minOccupants'), 1, '4')

-- maxOccupants
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-01'), (SELECT FeatureID FROM Features WHERE Abbreviation='maxOccupants'), 2, '4')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-02'), (SELECT FeatureID FROM Features WHERE Abbreviation='maxOccupants'), 2, '4')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-03'), (SELECT FeatureID FROM Features WHERE Abbreviation='maxOccupants'), 2, '6')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-04'), (SELECT FeatureID FROM Features WHERE Abbreviation='maxOccupants'), 2, '4')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-15'), (SELECT FeatureID FROM Features WHERE Abbreviation='maxOccupants'), 2, '6')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-16'), (SELECT FeatureID FROM Features WHERE Abbreviation='maxOccupants'), 2, '4')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-01'), (SELECT FeatureID FROM Features WHERE Abbreviation='maxOccupants'), 2, '6')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-02'), (SELECT FeatureID FROM Features WHERE Abbreviation='maxOccupants'), 2, '6')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-04'), (SELECT FeatureID FROM Features WHERE Abbreviation='maxOccupants'), 2, '6')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-06'), (SELECT FeatureID FROM Features WHERE Abbreviation='maxOccupants'), 2, '6')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-11'), (SELECT FeatureID FROM Features WHERE Abbreviation='maxOccupants'), 2, '6')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Picnic-01'), (SELECT FeatureID FROM Features WHERE Abbreviation='maxOccupants'), 2, '24')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-08'), (SELECT FeatureID FROM Features WHERE Abbreviation='maxOccupants'), 2, '4')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-11'), (SELECT FeatureID FROM Features WHERE Abbreviation='maxOccupants'), 2, '6')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-14'), (SELECT FeatureID FROM Features WHERE Abbreviation='maxOccupants'), 2, '8')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-16'), (SELECT FeatureID FROM Features WHERE Abbreviation='maxOccupants'), 2, '4')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-19'), (SELECT FeatureID FROM Features WHERE Abbreviation='maxOccupants'), 2, '5')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P1-03'), (SELECT FeatureID FROM Features WHERE Abbreviation='maxOccupants'), 2, '4')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P1-05'), (SELECT FeatureID FROM Features WHERE Abbreviation='maxOccupants'), 2, '2')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P2-02'), (SELECT FeatureID FROM Features WHERE Abbreviation='maxOccupants'), 2, '8')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P2-04'), (SELECT FeatureID FROM Features WHERE Abbreviation='maxOccupants'), 2, '2')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P3-01'), (SELECT FeatureID FROM Features WHERE Abbreviation='maxOccupants'), 2, '2')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Trailer-02'), (SELECT FeatureID FROM Features WHERE Abbreviation='maxOccupants'), 2, '4')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Group-03'), (SELECT FeatureID FROM Features WHERE Abbreviation='maxOccupants'), 2, '12')

-- feature1
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-01'), (SELECT FeatureID FROM Features WHERE Abbreviation='generatorsAllowed'), 3, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-02'), (SELECT FeatureID FROM Features WHERE Abbreviation='generatorsAllowed'), 3, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-15'), (SELECT FeatureID FROM Features WHERE Abbreviation='electricHookup'), 3, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Tent-16'), (SELECT FeatureID FROM Features WHERE Abbreviation='electricHookup'), 3, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-01'), (SELECT FeatureID FROM Features WHERE Abbreviation='electricHookup'), 3, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-02'), (SELECT FeatureID FROM Features WHERE Abbreviation='electricHookup'), 3, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-04'), (SELECT FeatureID FROM Features WHERE Abbreviation='electricHookup'), 3, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-06'), (SELECT FeatureID FROM Features WHERE Abbreviation='electricHookup'), 3, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-11'), (SELECT FeatureID FROM Features WHERE Abbreviation='electricHookup'), 3, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Picnic-01'), (SELECT FeatureID FROM Features WHERE Abbreviation='parkingLevel'), 3, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-08'), (SELECT FeatureID FROM Features WHERE Abbreviation='handicapAccessible'), 3, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-11'), (SELECT FeatureID FROM Features WHERE Abbreviation='petsAllowed'), 3, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-14'), (SELECT FeatureID FROM Features WHERE Abbreviation='handicapAccessible'), 3, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-16'), (SELECT FeatureID FROM Features WHERE Abbreviation='horseAccomodation'), 3, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-19'), (SELECT FeatureID FROM Features WHERE Abbreviation='handicapAccessible'), 3, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P1-03'), (SELECT FeatureID FROM Features WHERE Abbreviation='boatAccessible'), 3, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P1-05'), (SELECT FeatureID FROM Features WHERE Abbreviation='boatAccessible'), 3, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P2-02'), (SELECT FeatureID FROM Features WHERE Abbreviation='boatAccessible'), 3, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P2-04'), (SELECT FeatureID FROM Features WHERE Abbreviation='boatAccessible'), 3, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Dock-P3-01'), (SELECT FeatureID FROM Features WHERE Abbreviation='boatAccessible'), 3, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Trailer-02'), (SELECT FeatureID FROM Features WHERE Abbreviation='parkingLevel'), 3, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Group-03'), (SELECT FeatureID FROM Features WHERE Abbreviation='generatorsAllowed'), 3, '1')

-- feature2
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-01'), (SELECT FeatureID FROM Features WHERE Abbreviation='septicHookup'), 4, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-02'), (SELECT FeatureID FROM Features WHERE Abbreviation='septicHookup'), 4, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-04'), (SELECT FeatureID FROM Features WHERE Abbreviation='septicHookup'), 4, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-06'), (SELECT FeatureID FROM Features WHERE Abbreviation='septicHookup'), 4, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-11'), (SELECT FeatureID FROM Features WHERE Abbreviation='septicHookup'), 4, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Picnic-01'), (SELECT FeatureID FROM Features WHERE Abbreviation='petsAllowed'), 4, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-14'), (SELECT FeatureID FROM Features WHERE Abbreviation='petsAllowed'), 4, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-16'), (SELECT FeatureID FROM Features WHERE Abbreviation='petsAllowed'), 4, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-19'), (SELECT FeatureID FROM Features WHERE Abbreviation='horseAccomodation'), 4, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Group-03'), (SELECT FeatureID FROM Features WHERE Abbreviation='horseAccomodation'), 4, '1')

-- feature3
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-01'), (SELECT FeatureID FROM Features WHERE Abbreviation='generatorsAllowed'), 5, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='RV-02'), (SELECT FeatureID FROM Features WHERE Abbreviation='generatorsAllowed'), 5, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Cabin-19'), (SELECT FeatureID FROM Features WHERE Abbreviation='petsAllowed'), 5, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Group-03'), (SELECT FeatureID FROM Features WHERE Abbreviation='parkingLevel'), 5, '1')


-------------------------------------------------------------------------------
-- Raven Ridge Location Features
-------------------------------------------------------------------------------
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Raven Ridge Park'), (SELECT FeatureID FROM Features WHERE Abbreviation='tentSites'), 1, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Raven Ridge Park'), (SELECT FeatureID FROM Features WHERE Abbreviation='groupTenting'), 2, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Raven Ridge Park'), (SELECT FeatureID FROM Features WHERE Abbreviation='rvSites'), 3, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Raven Ridge Park'), (SELECT FeatureID FROM Features WHERE Abbreviation='cabinLodging'), 4, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Raven Ridge Park'), (SELECT FeatureID FROM Features WHERE Abbreviation='boatLaunch'), 5, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Raven Ridge Park'), (SELECT FeatureID FROM Features WHERE Abbreviation='hikingTrails'), 6, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Raven Ridge Park'), (SELECT FeatureID FROM Features WHERE Abbreviation='mountainBikeTrails'), 7, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Raven Ridge Park'), (SELECT FeatureID FROM Features WHERE Abbreviation='restrooms'), 8, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Raven Ridge Park'), (SELECT FeatureID FROM Features WHERE Abbreviation='showers'), 9, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Raven Ridge Park'), (SELECT FeatureID FROM Features WHERE Abbreviation='hotWater'), 10, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Raven Ridge Park'), (SELECT FeatureID FROM Features WHERE Abbreviation='picnicShelters'), 11, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Raven Ridge Park'), (SELECT FeatureID FROM Features WHERE Abbreviation='fishing'), 12, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Raven Ridge Park'), (SELECT FeatureID FROM Features WHERE Abbreviation='kayakCanoeRental'), 13, '1')
INSERT INTO [dbo].[ItemsXFeatures] ([ItemID], [FeatureID], [DisplayOrder] ,[Value]) VALUES((SELECT ItemID FROM Items WHERE Name='Raven Ridge Park'), (SELECT FeatureID FROM Features WHERE Abbreviation='playground'), 14, '1')

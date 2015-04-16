--------------------------------------------------------------------------------
-- FIXES script
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


--
-- Fixes/Adjustments to Schema
--

--Schema changes to Features table
ALTER TABLE Features ADD NameNegative NVARCHAR(1000) NULL
GO
ALTER TABLE Features ADD SiteFlag BIT NOT NULL CONSTRAINT [DF_Features_SiteFlag] DEFAULT (0)
GO
ALTER TABLE Features ADD LocationFlag BIT NOT NULL CONSTRAINT [DF_Features_LocationFlag] DEFAULT (0)
GO
ALTER TABLE Features ADD Hidden BIT NOT NULL CONSTRAINT [DF_Features_Hidden] DEFAULT (0)
GO

--Data changes to Features table
UPDATE Features SET Description='Has equestrian facilities?', NameNegative='No Equestrian', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='equestrian'
GO
UPDATE Features SET Description='Has equestrian rental?', NameNegative='No Equestrian Rental', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='equestrianRental'
GO
UPDATE Features SET Description='Has a golf course?', NameNegative='No Golf Course', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='golfCourse'
GO
UPDATE Features SET Description='Has a disc golf course?', NameNegative='No Disc Golf Course', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='discCourse'
GO
UPDATE Features SET Description='Has opportunities to fish?', NameNegative='No Fishing', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='fishing'
GO
UPDATE Features SET Description='Has a mini golf course?', NameNegative='No Mini Golf', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='miniGolf'
GO
UPDATE Features SET Description='Has a boat launch?', NameNegative='No Boat Launch', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='boatLaunch'
GO
UPDATE Features SET Description='Has boat rentals?', NameNegative='No Boat Rentals', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='boatRentals'
GO
UPDATE Features SET Description='Boats with gasoline engines permitted?', NameNegative='Motor Boats Not Permitted', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='motorBoatsPermitted'
GO
UPDATE Features SET Description='Water feature supports water skiing?', NameNegative='No Water Skiing', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='WaterSkiing'
GO
UPDATE Features SET Description='Has ski slope?', NameNegative='No Skiing', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='skiing'
GO
UPDATE Features SET Description='Has snowboarding slope or trails?', NameNegative='No Snowboarding', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='snowboarding'
GO
UPDATE Features SET Description='Has a marina?', NameNegative='No Marina', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='marina'
GO
UPDATE Features SET Description='Rents Kayaks or Canoes?', NameNegative='No Kayak/Canoe Rental', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='kayakCanoeRental'
GO
UPDATE Features SET Description='Has a swimming pool?', NameNegative='No Swimming Pool', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='swimmingPool'
GO
UPDATE Features SET Description='Has a beach and swimming in a natural water feature?', NameNegative='No Swimming Beach', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='swimmingBeach'
GO
UPDATE Features SET Description='Has picnic shelters?', NameNegative='No Picnic Shelters', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='picnicShelters'
GO
UPDATE Features SET Description='Has a playground?', NameNegative='No Playground', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='playground'
GO
UPDATE Features SET Description='Has a common/shared meeting room?', NameNegative='No Meeting Room', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='meetingRoom'
GO
UPDATE Features SET Description='Has a camp store?', NameNegative='No Camp Store', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='campStore'
GO
UPDATE Features SET Description='Has large fields for baseball/football/soccer?', NameNegative='No Playing Fields', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='playingFields'
GO
UPDATE Features SET Description='Has tennis courts?', NameNegative='No Tennis', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='tennis'
GO
UPDATE Features SET Description='Has hiking trails?', NameNegative='No Hiking Trails', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='hikingTrails'
GO
UPDATE Features SET Description='Has mountian biking trails?', NameNegative='No Mountain Bike Trails', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='mountainBikeTrails'
GO
UPDATE Features SET Description='Has ATV trail riding?', NameNegative='No ATV Trails', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='atvTrails'
GO
UPDATE Features SET Description='Has enclosed restrooms?', NameNegative='No Restrooms', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='restrooms'
GO
UPDATE Features SET Description='Has shower facilities?', NameNegative='No Showers', SiteFlag=1, LocationFlag=1, Hidden=0 WHERE Abbreviation='showers'
GO
UPDATE Features SET Description='Has heated water?', NameNegative='No Hot Water', SiteFlag=1, LocationFlag=1, Hidden=0 WHERE Abbreviation='hotWater'
GO
UPDATE Features SET Description='Has guided programs, such as guided hikes, wildlife programs, etc…?', NameNegative='No Guided Programs', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='guidedPrograms'
GO
UPDATE Features SET Description='Has a restaurant/cafe with prepared foods?', NameNegative='No Restaurants', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='restaurant'
GO
UPDATE Features SET Description='Has an amphitheatre?', NameNegative='No Amphitheatre', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='amphitheatre'
GO
UPDATE Features SET Description='Has group camping sites?', NameNegative='No Group Tenting', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='groupTenting'
GO
UPDATE Features SET Description='Has sites for tents?', NameNegative='No Tent Sites', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='tentSites'
GO
UPDATE Features SET Description='Has cabins for rent?', NameNegative='No Cabin Lodging', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='cabinLodging'
GO
UPDATE Features SET Description='Has lodging in a hotel facility?', NameNegative='No Hotel Lodging', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='hotelLodging'
GO
UPDATE Features SET Description='Has picnic shelters for use/rent?', NameNegative='No Picnic Shelter Rentals', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='picnicShelterRentals'
GO
UPDATE Features SET Description='Has sites for RVs?', NameNegative='No Recreation Vehicle Sites', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='rvSites'
GO
UPDATE Features SET Description='Site is handicap-accessible?', NameNegative='Not Handicap Accessible', SiteFlag=1, LocationFlag=0, Hidden=0 WHERE Abbreviation='handicapAccessible'
GO
UPDATE Features SET Description='Has an electric hookup?', NameNegative='No Electric Hookup', SiteFlag=1, LocationFlag=0, Hidden=0 WHERE Abbreviation='electricHookup'
GO
UPDATE Features SET Description='Has a septic/sewage hookup?', NameNegative='No Septic Hookup', SiteFlag=1, LocationFlag=0, Hidden=0 WHERE Abbreviation='septicHookup'
GO
UPDATE Features SET Description='Use of generators permitted?', NameNegative='No Generators Allowed', SiteFlag=1, LocationFlag=1, Hidden=0 WHERE Abbreviation='generatorsAllowed'
GO
UPDATE Features SET Description='Rules for use of a generator', NameNegative='No Generator Rules', SiteFlag=1, LocationFlag=1, Hidden=0 WHERE Abbreviation='generatorRules'
GO
UPDATE Features SET Description='Maximum number of people who may stay at this site', FeatureTypeID =(SELECT FeatureTypeID FROM FeatureTypes WHERE Name='Integer'), NameNegative='No Max Occupants', SiteFlag=1, LocationFlag=0, Hidden=0 WHERE Abbreviation='maxOccupants'
GO
UPDATE Features SET Description='Minimum number of people who may stay at this site', FeatureTypeID =(SELECT FeatureTypeID FROM FeatureTypes WHERE Name='Integer'), NameNegative='No Min Occupants', SiteFlag=1, LocationFlag=0, Hidden=0 WHERE Abbreviation='minOccupants'
GO
UPDATE Features SET Description='Parking surface type', NameNegative='No Parking Surface', SiteFlag=1, LocationFlag=1, Hidden=0 WHERE Abbreviation='parkingSurface'
GO
UPDATE Features SET Description='Parking area is flat?', NameNegative='Parking Not Level', SiteFlag=1, LocationFlag=1, Hidden=0 WHERE Abbreviation='parkingLevel'
GO
UPDATE Features SET Description='Length of the parking area (in feet)', NameNegative='No Parking Length', SiteFlag=1, LocationFlag=1, Hidden=0 WHERE Abbreviation='parkingLength'
GO
UPDATE Features SET Description='Adjacent to a boat slip or landing?', NameNegative='Not Boat Accessible', SiteFlag=1, LocationFlag=0, Hidden=0 WHERE Abbreviation='boatAccessible'
GO
UPDATE Features SET Description='Supports the stay of horses?', NameNegative='No Horse Accomodations', SiteFlag=1, LocationFlag=0, Hidden=0 WHERE Abbreviation='horseAccomodation'
GO
UPDATE Features SET Description='Type of shade available', NameNegative='No Shade', SiteFlag=1, LocationFlag=1, Hidden=0 WHERE Abbreviation='shade'
GO
UPDATE Features SET Description='Pets allowed during the stay?', NameNegative='Pets Not Allowed', SiteFlag=1, LocationFlag=1, Hidden=0 WHERE Abbreviation='petsAllowed'
GO
UPDATE Features SET Description='The type of recreation site', NameNegative='No Site Type', SiteFlag=1, LocationFlag=0, Hidden=1 WHERE Abbreviation='siteType'
GO
UPDATE Features SET Description='Drinking water fountains available?', NameNegative='No Drinking Water Fountains', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='drinkingWaterFountains'
GO
UPDATE Features SET Description='Chemical toilet facilities available?', NameNegative='No Chemical Toilets', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='chemicalToilets'
GO
UPDATE Features SET Description='Trash dumpsters available for the disposal of refuse?', NameNegative='No Trash Dumpsters', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='trashDumpsters'
GO
UPDATE Features SET Description='Warning, animals may be present at this location', NameNegative='No Animal Warnings', SiteFlag=1, LocationFlag=1, Hidden=0 WHERE Abbreviation='animalsWarning'
GO
UPDATE Features SET Description='Publicly-accessible telephones available?', NameNegative='No Public Telephones', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='publicTelephones'
GO
UPDATE Features SET Description='Visitor parking available at this location?', NameNegative='No Visitor Parking', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='visitorParking'
GO
UPDATE Features SET Description='Sanitary dump station available for the disposal of sewage and other effluent?', NameNegative='No Sanitary Dump Station', SiteFlag=0, LocationFlag=1, Hidden=0 WHERE Abbreviation='sanitaryDumpStation'
GO
UPDATE Features SET Description='Number of vehicles that may park at this site', NameNegative='No Parking Capacity', SiteFlag=1, LocationFlag=0, Hidden=0 WHERE Abbreviation='parkingCapcity'
GO
UPDATE Features SET Description='Small appliance electrical outlets available?', NameNegative='No Electricity', SiteFlag=1, LocationFlag=0, Hidden=0 WHERE Abbreviation='electricity'
GO
UPDATE Features SET Description='Shelter available at this site?', NameNegative='No Shelter', SiteFlag=1, LocationFlag=0, Hidden=0 WHERE Abbreviation='shelter'
GO
UPDATE Features SET Description='One or more tables available at this site?', NameNegative='No Table', SiteFlag=1, LocationFlag=0, Hidden=0 WHERE Abbreviation='table'
GO
UPDATE Features SET Description='Fire ring or grate available at this site?', NameNegative='No Fire Ring/Grate', SiteFlag=1, LocationFlag=0, Hidden=0 WHERE Abbreviation='fireRingGrate'
GO
UPDATE Features SET Description='Section, area or neighborhood within the location', FeatureTypeID =(SELECT FeatureTypeID FROM FeatureTypes WHERE Name='String'), NameNegative='No Section', SiteFlag=1, LocationFlag=0, Hidden=0 WHERE Abbreviation='section'
GO
UPDATE Features SET Description='Site reservable in advance?', NameNegative='Not Reservable', SiteFlag=1, LocationFlag=0, Hidden=0 WHERE Abbreviation='reservable'
GO
UPDATE Features SET Description='Base URL for all other resources', FeatureTypeID =(SELECT FeatureTypeID FROM FeatureTypes WHERE Name='String'), NameNegative='No Base URL', SiteFlag=0, LocationFlag=0, Hidden=1 WHERE Abbreviation='baseURL'
GO

-- Function to get a compact Feature Bullet string
CREATE FUNCTION fGetFeatureBullet(@Label nvarchar(1000), @LabelNegative nvarchar(1000), @Type nvarchar(100), @value nvarchar(1000)) RETURNS nvarchar(1000) AS
BEGIN 
    DECLARE @Bullet nvarchar(1000);
    
    SELECT @Bullet = 
        CASE @Type
            WHEN 'Boolean' THEN
                CASE @Value
                    WHEN '1' THEN @Label
                    ELSE @LabelNegative
                END
            ELSE @Label + ': ' + @Value
        END

    RETURN @Bullet
END
GO
--SELECT dbo.fGetFeatureBullet('Droids', 'No Droids', 'String', 20)

-- Grant EXECUTE permission on the above to production and staging user accounts
GRANT EXECUTE ON dbo.fGetFeatureBullet TO "Kinsail"
GRANT EXECUTE ON dbo.fGetFeatureBullet TO "JNeely-dev"


-- Data changes to Group Name
UPDATE Groups SET Name='Wichita Mountains Campground Reservations' WHERE Name='Doris Campground Reservations'


-- Insert Partner/Group record
INSERT INTO dbo.PartnersXGroups(PartnerID, GroupID, PrimaryPartner, Audit_ContactID)
       VALUES
            ((SELECT PartnerID FROM Partners WHERE PartnerCode='wichi')  --PartnerID
            ,(SELECT GroupID FROM Groups WHERE Name LIKE 'Wichita Mountains%') --GroupID
            ,1 --PrimaryPartner, bit
            ,NULL --Audit_ContactID, bigint
            )
GO

-- More photos for Fawn Creek Location
--4
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'scenic_04.jpg', 'scenic_04.jpg', '', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = 'scenic_04.jpg' AND FullURL = 'scenic_04.jpg' AND Caption = '' AND Source = ''), 4)
GO

--5
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'scenic_05.jpg', 'scenic_05.jpg', '', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = 'scenic_05.jpg' AND FullURL = 'scenic_05.jpg' AND Caption = '' AND Source = ''), 5)
GO

--6
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'scenic_06.jpg', 'scenic_06.jpg', '', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = 'scenic_06.jpg' AND FullURL = 'scenic_06.jpg' AND Caption = '' AND Source = ''), 6)
GO

--7
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'scenic_07.jpg', 'scenic_07.jpg', '', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = 'scenic_07.jpg' AND FullURL = 'scenic_07.jpg' AND Caption = '' AND Source = ''), 7)
GO

--8
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'scenic_08.jpg', 'scenic_08.jpg', '', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = 'scenic_08.jpg' AND FullURL = 'scenic_08.jpg' AND Caption = '' AND Source = ''), 8)
GO


-- More photos for Fawn Creek Sites
--5
BEGIN TRANSACTION
  DECLARE @ImageID Int
  INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
  VALUES (1, 'site_photo_05.jpg', 'site_photo_05.jpg', 'Fawn Creek - Site Photo 5', '', 1)
  SET @ImageID = SCOPE_IDENTITY();
  INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
  VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Fawn Creek Campground'), @ImageID, 2)
COMMIT TRANSACTION
GO

--6
BEGIN TRANSACTION
  DECLARE @ImageID Int
  INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
  VALUES (1, 'site_photo_06.jpg', 'site_photo_06.jpg', 'Fawn Creek - Site Photo 6', '', 1)
  SET @ImageID = SCOPE_IDENTITY();
  INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
  VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Fawn Creek Campground'), @ImageID, 2)
  INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
  VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Fawn Creek Campground'), @ImageID, 2)
  INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
  VALUES ((SELECT ItemID FROM Items WHERE Name = 'D' AND LocationName = 'Fawn Creek Campground'), @ImageID, 2)
COMMIT TRANSACTION
GO

--7
BEGIN TRANSACTION
  DECLARE @ImageID Int
  INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
  VALUES (1, 'site_photo_07.jpg', 'site_photo_07.jpg', 'Fawn Creek - Site Photo 7', '', 1)
  SET @ImageID = SCOPE_IDENTITY();
  INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
  VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Fawn Creek Campground'), @ImageID, 3)
  INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
  VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Fawn Creek Campground'), @ImageID, 3)
  INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
  VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Fawn Creek Campground'), @ImageID, 3)
  INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
  VALUES ((SELECT ItemID FROM Items WHERE Name = 'D' AND LocationName = 'Fawn Creek Campground'), @ImageID, 3)
COMMIT TRANSACTION
GO

--8
BEGIN TRANSACTION
  DECLARE @ImageID Int
  INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
  VALUES (1, 'site_photo_08.jpg', 'site_photo_08.jpg', 'Fawn Creek - Site Photo 8', '', 1)
  SET @ImageID = SCOPE_IDENTITY();
  INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
  VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Fawn Creek Campground'), @ImageID, 4)
  INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
  VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Fawn Creek Campground'), @ImageID, 4)
COMMIT TRANSACTION
GO

--9
BEGIN TRANSACTION
  DECLARE @ImageID Int
  INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
  VALUES (1, 'site_photo_09.jpg', 'site_photo_09.jpg', 'Fawn Creek - Site Photo 9', '', 1)
  SET @ImageID = SCOPE_IDENTITY();
  INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
  VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Fawn Creek Campground'), @ImageID, 5)
COMMIT TRANSACTION
GO

--Fixes to Fawn Creek photos
UPDATE Images SET Caption = 'Fawn Creek - Site Photo 1' WHERE Caption = 'Site A - site_photo_01.jpg'
GO
UPDATE Images SET Caption = 'Fawn Creek - Site Photo 2' WHERE Caption = 'Site B - site_photo_02.jpg'
GO
UPDATE Images SET Caption = 'Fawn Creek - Site Photo 3' WHERE Caption = 'Site C - site_photo_03.jpg'
GO
UPDATE Images SET Caption = 'Fawn Creek - Site Photo 4' WHERE Caption = 'Site D - site_photo_04.jpg'
GO

--Fixes to scenic photos
UPDATE Images SET Caption = 'Scenic Photo 1' WHERE FullURL= 'scenic_01.jpg'
GO
UPDATE Images SET Caption = 'Scenic Photo 2' WHERE FullURL= 'scenic_02.jpg'
GO
UPDATE Images SET Caption = 'Scenic Photo 3' WHERE FullURL= 'scenic_03.jpg'
GO
UPDATE Images SET Caption = 'Scenic Photo 4' WHERE FullURL= 'scenic_04.jpg'
GO
UPDATE Images SET Caption = 'Scenic Photo 5' WHERE FullURL= 'scenic_05.jpg'
GO
UPDATE Images SET Caption = 'Scenic Photo 6' WHERE FullURL= 'scenic_06.jpg'
GO
UPDATE Images SET Caption = 'Scenic Photo 7' WHERE FullURL= 'scenic_07.jpg'
GO
UPDATE Images SET Caption = 'Scenic Photo 8' WHERE FullURL= 'scenic_08.jpg'
GO

--Schema changes to Rates table
ALTER TABLE Rates ADD ProcessorBaseFee [numeric](18,5) NULL CONSTRAINT [DF_Rates_ProcessorBaseFee] DEFAULT (0.00)
GO
ALTER TABLE Rates ADD ProcessorDailyFee [numeric](18,5) NULL CONSTRAINT [DF_Rates_ProcessorDailyFee] DEFAULT (0.00)
GO
ALTER TABLE Rates ADD DepositPercent [bit] NOT NULL CONSTRAINT [DF_Rates_DepositPercent] DEFAULT (0)
GO
ALTER TABLE Rates ADD ProcessorPercent [bit] NOT NULL CONSTRAINT [DF_Rates_ProcessorPercent] DEFAULT (0)
GO

--Fixes to rates
--SELECT * FROM Rates
UPDATE Rates
   SET ProcessorBaseFee=5.00, ProcessorDailyFee=0.00
 WHERE Name LIKE 'Doris Campground - %'
    OR Name LIKE 'Fawn Creek Campground - %'

UPDATE Rates
   SET DepositDailyFee=2.50
 WHERE RateID = (SELECT RateID FROM Rates WHERE Name='Fawn Creek Campground - Group 2015')

UPDATE Rates
   SET DepositDailyFee=4.00
 WHERE RateID = (SELECT RateID FROM Rates WHERE Name='Doris Campground - Single SP 2015')

UPDATE Rates
   SET DepositDailyFee=5.00
 WHERE RateID = (SELECT RateID FROM Rates WHERE Name='Doris Campground - Single No Elec 2015')

UPDATE Rates
   SET DepositDailyFee=10.00
 WHERE RateID = (SELECT RateID FROM Rates WHERE Name='Doris Campground - Single Elec 2015')

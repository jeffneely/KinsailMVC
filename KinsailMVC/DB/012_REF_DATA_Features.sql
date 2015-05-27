--------------------------------------------------------------------------------
-- REF DATA script
-- Features
--------------------------------------------------------------------------------

----------
-- Init --
--------------------------------------------------------------------------------

-- Change this to the proper DB as appropriate
--USE [Kinsail_JNeely]
USE [Kinsail]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Add Features
INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Equestrian',
            'equestrian',
            'Has equestrian facilities',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Equestrian Rental',
            'equestrianRental',
            'Has equestrian rental',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Golf Course',
            'golfCourse',
            'Has a golf course',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Disc Golf Course',
            'discCourse',
            'Has a disc golf course',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Fishing',
            'fishing',
            'Has opportunities to fish',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Mini Golf',
            'miniGolf',
            'Has a mini golf course',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Boat Launch',
            'boatLaunch',
            'Has a boat launch',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Boat Rentals',
            'boatRentals',
            'Has boat rentals',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Motor Boats Permitted',
            'motorBoatsPermitted',
            'Boats with gasoline engines are permitted',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Water Skiing',
            'WaterSkiing',
            'Water feature supports water skiing',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Skiing',
            'skiing',
            'Has ski slope',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Snowboarding',
            'snowboarding',
            'Has snowboarding slope',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Marina',
            'marina',
            'Has a marina',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Kayak/Canoe Rental',
            'kayakCanoeRental',
            'Rents Kayaks or Canoes',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Swimming Pool',
            'swimmingPool',
            'Has a swimming pool',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Swimming Beach',
            'swimmingBeach',
            'Has a beach and swimming in a natural water feature',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Picnic Shelters',
            'picnicShelters',
            'Has picnic chelters',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Playground',
            'playground',
            'Has a playground',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Meeting Room',
            'meetingRoom',
            'Has a common/shared meeting room',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Camp Store',
            'campStore',
            'Has a camp store',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Playing Fields',
            'playingFields',
            'Has large fields for baseball/football/soccer',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Tennis',
            'tennis',
            'Has tennis courts',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Hiking Trails',
            'hikingTrails',
            'Has hiking trails',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Mountain Bike Trails',
            'mountainBikeTrails',
            'Has mountian biking trails',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'ATV Trails',
            'atvTrails',
            'Has ATV trail riding',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Restrooms',
            'restrooms',
            'Has enclosed restrooms',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Showers',
            'showers',
            'Has shower facilities',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Hot Water',
            'hotWater',
            'Has heated water',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Guided Programs',
            'guidedPrograms',
            'Has guided programs, such as guided hikes, wildlife programs, etc...',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Restaurant',
            'restaurant',
            'Has a restaurant/cafe with prepared foods',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Amphitheatre',
            'amphitheatre',
            'Has an amphitheatre',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Group Tenting',
            'groupTenting',
            'Has group camping sites',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Tent Sites',
            'tentSites',
            'Has sites for tents',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Cabin Lodging',
            'cabinLodging',
            'Has cabins for rent',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Hotel Lodging',
            'hotelLodging',
            'Has lodging in a hotel facility',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Picnic Shelter Rentals',
            'picnicShelterRentals',
            'Can rent picnic shelters',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Recreation Vehicle Sites',
            'rvSites',
            'Has sites for RVs',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Handicap Accessible',
            'handicapAccessible',
            'Site is handicap-accessible',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Electric Hookup',
            'electricHookup',
            'Has an electric hookup',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Septic Hookup',
            'septicHookup',
            'Has a septic/sewage hookup',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Generators Allowed',
            'generatorsAllowed',
            'Use of generators is permitted',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'String'),
		    'Generator Rules',
            'generatorRules',
            'Rules for use of a generator',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Max Occupants',
            'maxOccupants',
            'Maximum number of people who may stay at this site',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Min Occupants',
            'minOccupants',
            'Minimum number of people who may stay at this site',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Surface Type'),
		    'Parking Surface',
            'parkingSurface',
            'Parking surface type',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Parking Level',
            'parkingLevel',
            'Is the parking area level',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Integer'),
		    'Parking Length',
            'parkingLength',
            'Length of the parking area (in feet)',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Boat Accessible',
            'boatAccessible',
            'Is the site adjacent to a boat slip',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Horse Accomodation',
            'horseAccomodation',
            'Site supports the stay of horses',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Shade Type'),
		    'Shade',
            'shade',
            'Type of shade available',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Pets Allowed',
            'petsAllowed',
            'Whether pets are allowed during the stay',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Site Type'),
		    'Site Type',
            'siteType',
            'The type of recreation site',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Drinking Water Fountains',
            'drinkingWaterFountains',
            'Drinking water fountains are available',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Chemical Toilets',
            'chemicalToilets',
            'Chemical toilet facilities are available',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Trash Dumpsters',
            'trashDumpsters',
            'Trash dumpsters are available for the disposal of refuse',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'String'),
		    'Animal Warning',
            'animalsWarning',
            'Warning, animals may be present at this location',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Public Telephones',
            'publicTelephones',
            'Publicly-accessible telephones are available',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Visitor Parking',
            'visitorParking',
            'Visitor parking is available at this location',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Sanitary Dump Station',
            'sanitaryDumpStation',
            'A sanitary dump station is available for the disposal of sewage and other effluent',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Integer'),
		    'Parking Capacity',
            'parkingCapcity',
            'Number of vehicles that may park at this site',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Electricity',
            'electricity',
            'Electrical outlets are available',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Shelter',
            'shelter',
            'A shelter is available at this site',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Table',
            'table',
            'One or more tables are available at this site',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Fire Ring/Grate',
            'fireRingGrate',
            'A fire ring or grate is available at this site',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Section',
            'section',
            'Section, area or neighborhood within the location',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'Boolean'),
		    'Reservable',
            'reservable',
            'This site is reservable in advance',
            1)
GO

INSERT INTO [dbo].[Features]
           ([FeatureTypeID]
		   ,[Name]
           ,[Abbreviation]
           ,[Description]
           ,[Active])
     VALUES
           ((SELECT FeatureTypeID FROM FeatureTypes WHERE Name = 'String'),
		    'Base URL',
            'baseURL',
            'Base URL for all other resources',
            1)
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
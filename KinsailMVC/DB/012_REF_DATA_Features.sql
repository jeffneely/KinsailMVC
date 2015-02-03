--------------------------------------------------------------------------------
-- REF DATA script
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
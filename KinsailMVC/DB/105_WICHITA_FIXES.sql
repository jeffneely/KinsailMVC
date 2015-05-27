--------------------------------------------------------------------------------
-- FIXES script
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



-----------------------------
-- Changes to Wichita data --
--------------------------------------------------------------------------------

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

 --Fixes to rates for Fawn Creek
--SELECT * FROM Rates
UPDATE Rates
   SET BaseFee = 5.00,
       DailyFee = 0.0,
       DepositDailyFee = 0.0
 WHERE RateID = (SELECT RateID FROM Rates WHERE Name='Fawn Creek Campground - Group 2015')

--Fixes to availability schedules for Doris
--SELECT * FROM Availability
UPDATE [Availability]
   SET MaxDurationWeekends = 2,
       BetweenStaysDays = 2
 WHERE AvailID = (SELECT AvailID FROM [Availability] WHERE Name = 'Doris Campground Availability - Period 1')

UPDATE [Availability]
  SET MaxDurationWeekends = 4,
      BetweenStaysDays = 2
WHERE AvailID = (SELECT AvailID FROM [Availability] WHERE Name = 'Doris Campground Availability - Period 2')

--Fixes to availability schedules for Fawn Creek
UPDATE [Availability]
   SET MaxDurationWeekends = 2,
       BetweenStaysDays = 0
 WHERE AvailID = (SELECT AvailID FROM [Availability] WHERE Name = 'Fawn Creek Campground Availability - Period 1')
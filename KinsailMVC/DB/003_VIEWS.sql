--------------------------------------------------------------------------------
-- VIEWS script
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


--
-- Views
--

-- Returns first active gallery image for a site/location
IF OBJECT_ID('dbo.ItemsXFirstGalleryImage', 'V') IS NOT NULL
    DROP VIEW dbo.ItemsXFirstGalleryImage
GO
CREATE VIEW dbo.ItemsXFirstGalleryImage
    AS
SELECT x.ID, x.ItemID, x.ImageID, mingi.DisplayOrder
  FROM ItemsXImages x
  JOIN (SELECT ItemID, MIN(DisplayOrder) AS DisplayOrder
          FROM ItemsXImages x
          JOIN Images AS i ON x.ImageID = i.ImageID
         WHERE i.ImageTypeID = (SELECT ImageTypeID FROM ImageTypes WHERE Name = 'Gallery Image')
           AND i.Active = 1
         GROUP BY ItemID) mingi ON x.ItemID = mingi.ItemID -- minimum image display order for each ItemID
   AND mingi.DisplayOrder = x.DisplayOrder;
GO

-- Returns first active banner image for a site/location
IF OBJECT_ID('dbo.ItemsXFirstBannerImage', 'V') IS NOT NULL
    DROP VIEW dbo.ItemsXFirstBannerImage
GO
CREATE VIEW ItemsXFirstBannerImage
    AS
SELECT x.ID, x.ItemID, x.ImageID, minbi.DisplayOrder
  FROM ItemsXImages x
  JOIN (SELECT ItemID, MIN(DisplayOrder) AS DisplayOrder
          FROM ItemsXImages x
          JOIN Images AS i ON x.ImageID = i.ImageID
         WHERE i.ImageTypeID = (SELECT ImageTypeID FROM ImageTypes WHERE Name = 'Banner Image')
           AND i.Active = 1
         GROUP BY ItemID) minbi ON x.ItemID = minbi.ItemID -- minimum image display order for each ItemID
   AND minbi.DisplayOrder = x.DisplayOrder;
GO

-- Returns first active availability record for a site/location
IF OBJECT_ID('dbo.ItemsXFirstAvailRate', 'V') IS NOT NULL
    DROP VIEW dbo.ItemsXFirstAvailRate
GO
CREATE VIEW dbo.ItemsXFirstAvailRate
    AS
SELECT x.ID, x.ItemID, x.AvailID, x.RateID, x.MaxUnits, mina.DisplayOrder
  FROM ItemsXAvailRates x
  JOIN (SELECT ItemID, MIN(DisplayOrder) AS DisplayOrder
          FROM ItemsXAvailRates ixar
          JOIN Availability AS a ON ixar.AvailID = a.AvailID
         WHERE a.Active = 1
         GROUP BY ItemID) mina ON x.ItemID = mina.ItemID
   AND mina.DisplayOrder = x.DisplayOrder;
GO

-- Returns first active map record for a site/location
IF OBJECT_ID('dbo.ItemsXFirstMap', 'V') IS NOT NULL
    DROP VIEW dbo.ItemsXFirstMap
GO
CREATE VIEW dbo.ItemsXFirstMap
    AS
SELECT x.ID, x.ItemID, x.MapID, x.CoordinateX, x.CoordinateY, x.LatLongFlag, minm.DisplayOrder
  FROM ItemsXMaps x
  JOIN (SELECT ItemID, MIN(DisplayOrder) AS DisplayOrder
          FROM ItemsXMaps ixm
          JOIN Maps AS m ON ixm.MapID = m.MapID
         WHERE m.Active = 1
         GROUP BY ItemID) minm ON x.ItemID = minm.ItemID
   AND minm.DisplayOrder = x.DisplayOrder;
GO

-- Deprecated (2/3/2015) - availability and rate information are now modeled differently
/*
CREATE VIEW LocationsSitesRates
    AS
SELECT l.ItemID AS LocationID, 
       MIN(mmc.MinBaseRate) AS MinBaseRate, MAX(mmc.MaxBaseRate) AS MaxBaseRate,
       MIN(mmc.MinWeekdayRate) AS MinWeekdayRate, MAX(mmc.MaxWeekdayRate) AS MaxWeekdayRate, 
       MIN(mmc.MinWeekendRate) AS MinWeekendRate, MAX(mmc.MaxWeekendRate) AS MaxWeekendRate,
       COUNT(*) AS SiteCount 
  FROM Items l 
  -- child sites
  LEFT OUTER JOIN ItemsXItems ixi ON l.ItemID = ixi.ParentItemID
             JOIN Items s ON ixi.ItemID = s.ItemID 
  -- min/max site|location availability rates (for any number of associated availability rows)
             JOIN (SELECT ixa.ItemID, 
                          MIN(ixa.BaseRate) AS MinBaseRate, MAX(ixa.BaseRate) AS MaxBaseRate,
                          MIN(ixa.WeekdayRate) AS MinWeekdayRate, MAX(ixa.WeekdayRate) AS MaxWeekdayRate, 
                          MIN(ixa.WeekendRate) AS MinWeekendRate, MAX(ixa.WeekendRate) AS MaxWeekendRate
                     FROM ItemsXAvailability ixa 
					 JOIN Availability a ON ixa.AvailID = a.AvailID
					WHERE a.Available = 1
                    GROUP BY ixa.ItemID) mmc ON s.ItemID = mmc.ItemID 
 WHERE l.ItemTypeID = (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Location') 
   AND s.ItemTypeID = (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site') 
 GROUP BY l.ItemID;
GO
*/

-- Returns availability information,
-- splitting any date ranges that cross year boundaries into multiple rows
IF OBJECT_ID('dbo.AvailabilityRanges', 'V') IS NOT NULL
    DROP VIEW dbo.AvailabilityRanges
GO
CREATE VIEW dbo.AvailabilityRanges
    AS
SELECT AvailID, Name, AvailStartYear, AvailStartMonth, AvailStartDay, AvailStartDate, AvailEndYear, 12 AS AvailEndMonth, 31 AS AvailEndDay, dbo.GetAvailableDate(AvailEndYear, 12, 31, 1) AS AvailEndDate
  FROM [Availability]
 WHERE Available = 1
   AND Active = 1
   AND AvailStartMonth > AvailEndMonth
 UNION
SELECT AvailID, Name, AvailStartYear, 1 AS AvailStartMonth, 1 AS AvailStartDay, dbo.GetAvailableDate(AvailStartYear, 1, 1, 0) AS AvailStartDate, AvailEndYear, AvailEndMonth, AvailEndDay, AvailEndDate
  FROM [Availability]
 WHERE Available = 1
   AND Active = 1
   AND AvailStartMonth > AvailEndMonth
 UNION
SELECT AvailID, Name, AvailStartYear, AvailStartMonth, AvailStartDay, AvailStartDate, AvailEndYear, AvailEndMonth, AvailEndDay, AvailEndDate
  FROM [Availability]
 WHERE Available = 1
   AND Active = 1
   AND AvailStartMonth <= AvailEndMonth
GO

-- Find availability ranges marked as not available
-- splitting any date ranges that cross year boundaries into multiple rows
IF OBJECT_ID('dbo.UnAvailabilityRanges', 'V') IS NOT NULL
    DROP VIEW dbo.UnAvailabilityRanges
GO
CREATE VIEW dbo.UnAvailabilityRanges
    AS
SELECT AvailID, Name, AvailStartYear, AvailStartMonth, AvailStartDay, AvailStartDate, AvailEndYear, 12 AS AvailEndMonth, 31 AS AvailEndDay, dbo.GetAvailableDate(AvailEndYear, 12, 31, 1) AS AvailEndDate
  FROM [Availability]
 WHERE Available = 0
   AND Active = 1
   AND AvailStartMonth > AvailEndMonth
 UNION
SELECT AvailID, Name, AvailStartYear, 1 AS AvailStartMonth, 1 AS AvailStartDay, dbo.GetAvailableDate(AvailStartYear, 1, 1, 0) AS AvailStartDate, AvailEndYear, AvailEndMonth, AvailEndDay, AvailEndDate
  FROM [Availability]
 WHERE Available = 0
   AND Active = 1
   AND AvailStartMonth > AvailEndMonth
 UNION
SELECT AvailID, Name, AvailStartYear, AvailStartMonth, AvailStartDay, AvailStartDate, AvailEndYear, AvailEndMonth, AvailEndDay, AvailEndDate
  FROM [Availability]
 WHERE Available = 0
   AND Active = 1
   AND AvailStartMonth <= AvailEndMonth
GO

-- Find ALL availability ranges (those marked available + those marked as not available)
-- splitting any date ranges that cross year boundaries into multiple rows
IF OBJECT_ID('dbo.AllAvailabilityRanges', 'V') IS NOT NULL
    DROP VIEW dbo.AllAvailabilityRanges
GO
CREATE VIEW dbo.AllAvailabilityRanges
    AS
SELECT AvailID, Name, AvailStartYear, AvailStartMonth, AvailStartDay, AvailStartDate, AvailEndYear, 12 AS AvailEndMonth, 31 AS AvailEndDay, dbo.GetAvailableDate(AvailEndYear, 12, 31, 1) AS AvailEndDate, Available
  FROM [Availability]
 WHERE Active = 1
   AND AvailStartMonth > AvailEndMonth
 UNION
SELECT AvailID, Name, AvailStartYear, 1 AS AvailStartMonth, 1 AS AvailStartDay, dbo.GetAvailableDate(AvailStartYear, 1, 1, 0) AS AvailStartDate, AvailEndYear, AvailEndMonth, AvailEndDay, AvailEndDate, Available
  FROM [Availability]
 WHERE Active = 1
   AND AvailStartMonth > AvailEndMonth
 UNION
SELECT AvailID, Name, AvailStartYear, AvailStartMonth, AvailStartDay, AvailStartDate, AvailEndYear, AvailEndMonth, AvailEndDay, AvailEndDate, Available
  FROM [Availability]
 WHERE Active = 1
   AND AvailStartMonth <= AvailEndMonth
GO

-- View DiscreteAvailabilityRanges
--   returns contiguous spans of discrete availability information, splitting any recurring date ranges 
--   that cross year boundaries into multiple rows for the contiguous month spans within each year
--     (handled by View AvailabilityRanges, which only returns ranges that are available=1 and active=1)
--   also splitting any recurring (yearly) ranges into discrete ranges for each year between 2000 and 2029
IF OBJECT_ID('dbo.DiscreteAvailabilityRanges', 'V') IS NOT NULL
    DROP VIEW dbo.DiscreteAvailabilityRanges
GO
CREATE VIEW DiscreteAvailabilityRanges
    AS
SELECT AvailID, Name, AvailStartYear, AvailStartMonth, AvailStartDay, AvailStartDate, AvailEndYear, AvailEndMonth, AvailEndDay, AvailEndDate, 0 AS Recurring
  FROM AvailabilityRanges
 WHERE AvailStartYear IS NOT NULL
   AND AvailEndYear IS NOT NULL
 UNION
SELECT AvailID, Name, y.Value AS AvailStartYear, AvailStartMonth, AvailStartDay, 
       DATEADD(DAY, AvailStartDay - 1, DATEADD(MONTH, AvailStartMonth - 1, DATEADD(YEAR, y.Value - 1900, 0))) AS AvailStartDate, 
       y.Value AS AvailEndYear, AvailEndMonth, AvailEndDay, 
       DATEADD(DAY, AvailEndDay - 1, DATEADD(MONTH, AvailEndMonth - 1, DATEADD(YEAR, y.Value - 1900, 0))) AS AvailEndDate,
       1 AS Recurring
  FROM AvailabilityRanges
  JOIN (SELECT Value
          FROM Integers
         WHERE Value BETWEEN 2000 AND 2029) y 
    ON ((y.Value >= COALESCE(AvailStartYear, 2000)) AND (y.Value <= COALESCE(AvailEndYear, 2029)))
 WHERE AvailStartYear IS NULL
    OR AvailEndYear IS NULL
GO

-- Find discrete availability ranges marked as not available (combining static ranges with those the are recurring)
-- constrained to years 2000 - 2029
IF OBJECT_ID('dbo.DiscreteUnAvailabilityRanges', 'V') IS NOT NULL
    DROP VIEW dbo.DiscreteUnAvailabilityRanges
GO
CREATE VIEW dbo.DiscreteUnAvailabilityRanges
    AS
SELECT AvailID, Name, AvailStartYear, AvailStartMonth, AvailStartDay, AvailStartDate, AvailEndYear, AvailEndMonth, AvailEndDay, AvailEndDate, 0 AS Recurring
  FROM UnAvailabilityRanges
 WHERE AvailStartYear IS NOT NULL
   AND AvailEndYear IS NOT NULL
 UNION ALL
SELECT AvailID, Name, y.Value AS AvailStartYear, AvailStartMonth, AvailStartDay, 
       DATEADD(DAY, AvailStartDay - 1, DATEADD(MONTH, AvailStartMonth - 1, DATEADD(YEAR, y.Value - 1900, 0))) AS AvailStartDate, 
       y.Value AS AvailEndYear, AvailEndMonth, AvailEndDay, 
       DATEADD(DAY, AvailEndDay - 1, DATEADD(MONTH, AvailEndMonth - 1, DATEADD(YEAR, y.Value - 1900, 0))) AS AvailEndDate,
       1 AS Recurring
  FROM UnAvailabilityRanges
  JOIN (SELECT Value
          FROM Integers
         WHERE Value BETWEEN 2000 AND 2029) y 
    ON ((y.Value >= COALESCE(AvailStartYear, 2000)) AND (y.Value <= COALESCE(AvailEndYear, 2029)))
 WHERE AvailStartYear IS NULL
    OR AvailEndYear IS NULL
GO


-- Find discrete availability ranges (combining static ranges with those the are recurring)
-- constrained to years 2000 - 2029
IF OBJECT_ID('dbo.DiscreteAllAvailabilityRanges', 'V') IS NOT NULL
    DROP VIEW dbo.DiscreteAllAvailabilityRanges
GO
CREATE VIEW dbo.DiscreteAllAvailabilityRanges
    AS
SELECT AvailID, Name, AvailStartYear, AvailStartMonth, AvailStartDay, AvailStartDate, AvailEndYear, AvailEndMonth, AvailEndDay, AvailEndDate, Available, 0 AS Recurring
  FROM AllAvailabilityRanges
 WHERE AvailStartYear IS NOT NULL
   AND AvailEndYear IS NOT NULL
 UNION ALL
SELECT AvailID, Name, y.Value AS AvailStartYear, AvailStartMonth, AvailStartDay, 
       DATEADD(DAY, AvailStartDay - 1, DATEADD(MONTH, AvailStartMonth - 1, DATEADD(YEAR, y.Value - 1900, 0))) AS AvailStartDate, 
       y.Value AS AvailEndYear, AvailEndMonth, AvailEndDay, 
       DATEADD(DAY, AvailEndDay - 1, DATEADD(MONTH, AvailEndMonth - 1, DATEADD(YEAR, y.Value - 1900, 0))) AS AvailEndDate, Available, 
       1 AS Recurring
  FROM AllAvailabilityRanges
  JOIN (SELECT Value
          FROM Integers
         WHERE Value BETWEEN 2000 AND 2029) y 
    ON ((y.Value >= COALESCE(AvailStartYear, 2000)) AND (y.Value <= COALESCE(AvailEndYear, 2029)))
 WHERE AvailStartYear IS NULL
    OR AvailEndYear IS NULL
GO


-- Returns summarized rates (not including base fees) and availability for sites at locations
-- Handles sites with more than one Availability/Rate assigned (ignoring those that are not active)
--DROP VIEW RatesAtLocations
CREATE VIEW RatesAtLocations
    AS
SELECT ItemID AS LocationID, Name AS LocationName,
       MIN(MinDailyRate) AS MinDailyRate, MAX(MaxDailyRate) AS MaxDailyRate,
       MIN(MinWeekdayRate) AS MinWeekdayRate, MAX(MaxWeekdayRate) AS MaxWeekdayRate,
       MIN(MinWeekendRate) AS MinWeekendRate, MAX(MaxWeekendRate) AS MaxWeekendRate,
       MIN(MinAvailStartDate) AS MinAvailStartDate, MAX(MaxAvailEndDate) AS MaxAvailEndDate,
       COUNT(*) AS SiteCount
  FROM (
        SELECT l.ItemID, l.Name,
               MIN(r.DailyFee) AS MinDailyRate, MAX(r.DailyFee) AS MaxDailyRate,
               MIN(r.DailyFee + r.WeekdayFee) AS MinWeekdayRate, MAX(r.DailyFee + r.WeekdayFee) AS MaxWeekdayRate,
               MIN(r.DailyFee + r.WeekendFee) AS MinWeekendRate, MAX(r.DailyFee + r.WeekendFee) AS MaxWeekendRate,
               MIN(a.AvailStartDate) AS MinAvailStartDate, MAX(a.AvailEndDate) AS MaxAvailEndDate
          FROM Items l 
          -- child sites
          LEFT OUTER JOIN ItemsXItems ixi ON l.ItemID = ixi.ParentItemID
                     JOIN Items s ON ixi.ItemID = s.ItemID 
          -- min/max site|location availability rates (for any number of associated availability rows)
          JOIN ItemsXAvailRates ixar ON ixar.ItemID = s.ItemID
          JOIN Rates r ON r.RateID = ixar.RateID
          JOIN AvailabilityRanges a ON a.AvailID = ixar.AvailID
         WHERE l.ItemTypeID = (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Location') 
           AND s.ItemTypeID = (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site') 
           AND r.Active = 1
         GROUP BY l.ItemID, l.Name, s.ItemID
        ) x
 GROUP BY ItemID, Name
GO

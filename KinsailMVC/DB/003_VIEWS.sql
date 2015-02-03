--------------------------------------------------------------------------------
-- VIEWS script
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
-- Views
--
--DROP VIEW ItemsXFirstGalleryImage
CREATE VIEW ItemsXFirstGalleryImage
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

--DROP VIEW ItemsXFirstBannerImage
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
--DROP VIEW ItemsXFirstAvailRate
CREATE VIEW ItemsXFirstAvailRate
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

-- Deprecated (2/3/2015) - availability and rate information are now modeled differently
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

-- Returns availability information,
-- splitting any date ranges that cross year boundaries into multiple rows
CREATE VIEW AvailabilityRanges
    AS
SELECT AvailID, Name, AvailStartYear, AvailStartMonth, AvailStartDay, AvailStartDate, AvailEndYear, 12 AS AvailEndMonth, 31 AS AvailEndDay, dbo.GetAvailableDate(AvailEndYear, 12, 31, 1) AS AvailEndDate
  FROM Availability
 WHERE Available = 1
   AND Active = 1
   AND AvailStartMonth > AvailEndMonth
 UNION
SELECT AvailID, Name, AvailStartYear, 1 AS AvailStartMonth, 1 AS AvailStartDay, dbo.GetAvailableDate(AvailStartYear, 1, 1, 0) AS AvailStartDate, AvailEndYear, AvailEndMonth, AvailEndDay, AvailEndDate
  FROM Availability
 WHERE Available = 1
   AND Active = 1
   AND AvailStartMonth > AvailEndMonth
 UNION
SELECT AvailID, Name, AvailStartYear, AvailStartMonth, AvailStartDay, AvailStartDate, AvailEndYear, AvailEndMonth, AvailEndDay, AvailEndDate
  FROM Availability
 WHERE Available = 1
   AND Active = 1
   AND AvailStartMonth <= AvailEndMonth
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

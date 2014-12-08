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
CREATE VIEW ItemsXFirstGalleryImage
    AS
SELECT x.ID, x.ItemID, x.ImageID, mingi.DisplayOrder
  FROM ItemsXImages x
  JOIN (SELECT ItemID, MIN(DisplayOrder) AS DisplayOrder
          FROM ItemsXImages x
          JOIN Images AS i 
            ON x.ImageID = i.ImageID
         WHERE i.ImageTypeID = (SELECT ImageTypeID FROM ImageTypes WHERE Name = 'Gallery Image')
         GROUP BY ItemID) mingi ON x.ItemID = mingi.ItemID -- minimum image display order for each ItemID
           AND mingi.DisplayOrder = x.DisplayOrder;
GO

CREATE VIEW ItemsXFirstBannerImage
    AS
SELECT x.ID, x.ItemID, x.ImageID, minbi.DisplayOrder
  FROM ItemsXImages x
  JOIN (SELECT ItemID, MIN(DisplayOrder) AS DisplayOrder
          FROM ItemsXImages x
          JOIN Images AS i 
            ON x.ImageID = i.ImageID
         WHERE i.ImageTypeID = (SELECT ImageTypeID FROM ImageTypes WHERE Name = 'Banner Image')
         GROUP BY ItemID) minbi ON x.ItemID = minbi.ItemID -- minimum image display order for each ItemID
           AND minbi.DisplayOrder = x.DisplayOrder;
GO

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
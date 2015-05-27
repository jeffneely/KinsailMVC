--------------------------------------------------------------------------------
-- QUERIES
-- Various useful queries
--------------------------------------------------------------------------------


------------------------------------------------------------
-- MISC
------------------------------------------------------------

-- Find numbers between two numbers
SELECT Value
  FROM Integers
 WHERE Value BETWEEN 1990 AND 2099
 ORDER BY Value
GO

-- Find all dates
SELECT * 
  FROM Dates

-- Find Dates in the future
SELECT *
  FROM Dates
 WHERE [Date] > GETDATE()

-- Find Dates between two dates
SELECT *
  FROM Dates
 WHERE [Date] BETWEEN '4-20-2015' AND '4-25-2015'

-- Find Dates between two dates (only retrieving the indexed column)
SELECT [Date]
  FROM Dates
 WHERE [Date] BETWEEN '4-20-2015' AND '4-25-2015'

-- Find dates and date values (figuring out deterministic solutions)
SELECT DATEADD(DAY, [Value], -1) AS [Date], 
	   DATEDIFF(DAY, -1, DATEADD(DAY, [Value], -1)) % 7 + 1 AS DtmDayOfWeek, --deterministic DayOfWeek
	   CASE DATEDIFF(DAY, -1, DATEADD(DAY, [Value], -1)) % 7 + 1 --deterministic DayOfWeekName
	       WHEN 1 THEN 'Sunday'
	       WHEN 2 THEN 'Monday'
	       WHEN 3 THEN 'Tuesday'
	       WHEN 4 THEN 'Wednesday'
	       WHEN 5 THEN 'Thursday'
	       WHEN 6 THEN 'Friday'
	       ELSE 'Saturday'
	   END AS DtmDayOfWeekName,
	   DATEADD(YEAR, DATEDIFF(YEAR, 0, DATEADD(DAY, [Value], -1)), 0) AS DtmFirstDayOfYear, --deterministic FirstDayOfYear
	   DATEDIFF(DAY, -1, DATEADD(YEAR, DATEDIFF(YEAR, 0, DATEADD(DAY, [Value], -1)), 0)) % 7 + 1 AS DtmFirstDayOfYearDoW, --deterministic FirstDayOfYearDoW
	   --DATEDIFF(DAY, DATEADD(DAY, [Value], -1), DATEFROMPARTS(DATEPART(YEAR, DATEADD(DAY, [Value], -1)), 1, 1)) / 7 AS DtmWeek, --deterministic WeekOfYear
	   CASE DATEPART(MONTH, DATEADD(DAY, [Value], -1)) --deterministic MonthName
	       WHEN 1 THEN 'January'
	       WHEN 2 THEN 'February'
	       WHEN 3 THEN 'March'
	       WHEN 4 THEN 'April'
	       WHEN 5 THEN 'May'
	       WHEN 6 THEN 'June'
	       WHEN 7 THEN 'July'
	       WHEN 8 THEN 'August'
	       WHEN 9 THEN 'September'
	       WHEN 10 THEN 'October'
	       WHEN 11 THEN 'November'
	       ELSE 'December'
	   END AS DtmMonthName, -- deterministic MonthName
	   DATEPART(WEEKDAY, DATEADD(DAY, [Value], -1)) AS [DayOfWeek],
	   DATENAME(WEEKDAY, DATEADD(DAY, [Value], -1)) AS DayOfWeekName,
	   DATENAME(DAYOFYEAR, DATEADD(DAY, [Value], -1)) AS [DayOfYear],
	   DATEPART(WEEK, DATEADD(DAY, [Value], -1)) AS [Week]
  FROM Integers
 WHERE [Value] BETWEEN ((2000 - 1900) * 365 + 25) -- Year 2000
                   AND ((2001 - 1900) * 365 + 25) -- Year 2001



------------------------------------------------------------
-- IMAGES
------------------------------------------------------------

--Find all images
SELECT * 
  FROM Images

--Find images for Fawn Creek sites
SELECT l.ItemID AS LocationID, l.Name AS Location, s.ItemID AS SiteID, s.Name AS Site, i.ImageID, i.FullURL, i.Caption
  FROM Images i 
  JOIN ItemsXImages ixi ON ixi.ImageID = i.ImageID
  JOIN Items s ON ixi.ItemID = s.ItemID
  JOIN ItemsXItems sxl ON sxl.ItemID = s.ItemID
  JOIN Items l ON sxl.ParentItemID = l.ItemID
 WHERE l.Name = 'Fawn Creek Campground'

--Find images for Fawn Creek location
SELECT l.ItemID AS LocationID, l.Name AS Location, i.ImageID, i.FullURL, i.Caption
  FROM Images i 
  JOIN ItemsXImages ixi ON ixi.ImageID = i.ImageID
  JOIN Items l ON ixi.ItemID = l.ItemID
 WHERE l.Name = 'Fawn Creek Campground'



------------------------------------------------------------
-- SITES / ITEMS
------------------------------------------------------------

--Find item for Fawn Creek
SELECT *
  FROM Items WHERE Name = 'Fawn Creek Campground'

--Find sites at locations, showing group and partner associated
SELECT l.ItemID AS LocationID, l.Name AS Location, s.ItemID AS SiteID, s.Name AS SiteName, g.GroupID, g.Name AS GroupName, p.PartnerID, p.PartnerCode
  FROM Items s
  JOIN ItemsXItems ixi ON s.ItemID = ixi.ItemID
  JOIN Items l ON ixi.ParentItemID = l.ItemID
  JOIN Groups g ON l.GroupID = g.GroupID
  LEFT OUTER JOIN PartnersXGroups pxg ON pxg.GroupID = g.GroupID
  LEFT OUTER JOIN Partners p ON pxg.PartnerID = p.PartnerID
 WHERE l.Name = 'Doris Campground'
    OR l.Name = 'Fawn Creek Campground'

--Find sites with name A at a location with name LIKE
SELECT * 
  FROM Items s
  JOIN ItemsXItems ixi ON ixi.ItemID = s.ItemID
  JOIN Items l ON ixi.ParentItemID = l.ItemID
 WHERE s.Name LIKE 'A'
   AND l.Name LIKE 'Fawn%'

--Find Items
SELECT * FROM Items WHERE Name = '1'
SELECT * FROM Items WHERE ItemID = 861399
SELECT (SELECT l.Name FROM Items s JOIN ItemsXItems ixi ON ixi.ItemID = s.ItemID JOIN Items l ON ixi.ParentItemID = l.ItemID WHERE s.ItemID = 715289) + ' / Site ' + (SELECT Name FROM Items WHERE ItemID = 715289)


------------------------------------------------------------
-- GROUPS
------------------------------------------------------------

--Find group with ID
SELECT *
  FROM Groups g
 WHERE GroupID=36899

 --Find group with name LIKE
SELECT * 
  FROM Groups
 WHERE Name LIKE '%Camp%'


------------------------------------------------------------
-- FEATURES 
------------------------------------------------------------

--Find Features (also with bullet text) for a site ('D' in this case)
--Example query, showing new UDF
SELECT f.FeatureID, ft.Name AS Type, f.Name AS Label, 
       dbo.fGetFeatureBullet(f.Name, f.NameNegative, ft.Name, ixf.Value) AS Bullet,
/*       CASE ft.Name 
           WHEN 'Boolean' THEN
               CASE ixf.Value
                   WHEN 1 THEN f.Name
                   ELSE f.NameNegative
               END
           ELSE f.Name + ': ' + ixf.Value
       END AS Label,*/
       f.Abbreviation AS Name, f.Description, ixf.Value
  FROM Features f
  JOIN ItemsXFeatures ixf ON ixf.FeatureID = f.FeatureID
  JOIN FeatureTypes ft ON f.FeatureTypeID = ft.FeatureTypeID
 WHERE ixf.ItemID = (SELECT ItemID FROM Items WHERE Name = 'D')
   AND f.Active = 1
   AND f.Hidden = 0
 ORDER BY ixf.DisplayOrder

--Find aggregate features for all sites at a location and order them smartly
--Sort: show those with the most variance in values at the top; those with no variance at the bottom.
--TODO: use this to build a REST call that Michael's front-end can use
SELECT MAX(l.ItemID) AS LocationID, MAX(l.Name) AS Location,
       MAX(f.Name) AS Feature, COUNT(f.Name) AS FeatureCount, COUNT(DISTINCT Value) AS ValCount
  FROM Items s
  JOIN ItemsXItems ixi ON s.ItemID = ixi.ItemID
  JOIN Items l ON ixi.ParentItemID = l.ItemID
  JOIN ItemsXFeatures ixf ON s.ItemID = ixf.ItemID
  JOIN Features f ON f.FeatureID = ixf.FeatureID
 WHERE l.Name = 'Doris Campground'                  -- could be an ID passed in
 GROUP BY f.FeatureID
 ORDER BY COUNT(DISTINCT Value) DESC, MAX(f.Name)

--Find aggregate features for all sites at a location and order them smartly, 
--including all values found (ordered by most-common, to least-common)
SELECT MAX(l.ItemID) AS LocationID, MAX(l.Name) AS Location,
       MAX(f.Name) AS Feature, COUNT(f.Name) AS FeatureCount, ixf.Value
  FROM Items s
  JOIN ItemsXItems ixi ON s.ItemID = ixi.ItemID
  JOIN Items l ON ixi.ParentItemID = l.ItemID
  JOIN ItemsXFeatures ixf ON s.ItemID = ixf.ItemID
  JOIN Features f ON f.FeatureID = ixf.FeatureID
 WHERE l.Name = 'Doris Campground'                  -- could be an ID passed in
 GROUP BY f.FeatureID, ixf.Value
 ORDER BY COUNT(ixf.Value) OVER (PARTITION BY f.FeatureID) DESC, MAX(f.Name), COUNT(f.Name) DESC



------------------------------------------------------------
-- AVAILABILITY
------------------------------------------------------------

-- Discrete availability ranges that are Available=1 for an ItemID
SELECT ixr.AvailID, a.AvailStartDate, a.AvailEndDate
  FROM dbo.ItemsXAvailRates ixr
  JOIN dbo.DiscreteAvailabilityRanges a ON ixr.AvailID = a.AvailID
 WHERE ixr.ItemID = 724289
 ORDER BY AvailStartDate
GO

-- Find all gaps between valid availability ranges (Available=1)
--   this expands on any ranges specifically marked Available=0 to cover 
--   any other date ranges not defined in an availability schedule
SELECT NULL AS ResourceID, ixr.ItemID, 'UNAVAILABLE' AS ResourceName, 'Date range not on an availability schedule' AS ResourceDescription,
       DATEADD(DAY, 1, a.AvailEndDate) AS StartDate,
       DATEADD(DAY, -1, b.AvailStartDate) AS EndDate,
	  NULL AS ReservationID, NULL AS UniqueID, NULL AS IsReserved, NULL AS Cancelled, NULL AS CartRefreshDateTime,
	  NULL AS Now, NULL AS Temp, NULL AS ExpiresMins
  FROM dbo.ItemsXAvailRates ixr
  JOIN dbo.DiscreteAvailabilityRanges a ON ixr.AvailID = a.AvailID
 CROSS APPLY (
       SELECT TOP (1) t.AvailStartDate
         FROM dbo.ItemsXAvailRates ti
         JOIN dbo.DiscreteAvailabilityRanges t ON ti.AvailID = t.AvailID
        WHERE ti.ItemID = 724289  -- @0 = SiteID
          AND t.AvailStartDate > a.AvailEndDate
        ORDER BY t.AvailStartDate) b
 WHERE ixr.ItemID = 724289  -- @0 = SiteID
   AND DATEDIFF(DAY, a.AvailEndDate, b.AvailStartDate) > 1
   AND b.AvailStartDate >= GETDATE()   -- only consider those that end in the future
 UNION
SELECT rr.ResourceID, rr.ItemID, rr.ResourceName, rr.ResourceDescription, rr.StartDateTime AS StartDate, rr.EndDateTime AS EndDate, r.ReservationID, r.UniqueID, r.IsReserved, r.Cancelled,
       r.CartRefreshDateTime, GETDATE() AS Now,
       1 - r.IsReserved AS Temp, CASE IsReserved WHEN 0 THEN DATEDIFF(MINUTE, GETDATE(), DATEADD(SECOND, rr.CartTimeoutSeconds, r.CartRefreshDateTime)) WHEN 1 THEN NULL END AS ExpiresInMins
  FROM dbo.Reservations r
  JOIN dbo.ReservationResources rr ON rr.ResourceID = r.ResourceID
 WHERE rr.ItemID = 724289           -- @0 = SiteID
   AND r.Cancelled = 0              -- disregard those marked cancelled
   AND rr.EndDateTime > GETDATE()   -- only consider those that end in the future
   AND (r.IsReserved = 1 OR (r.CartRefreshDateTime > DATEADD(SECOND, -1 * rr.CartTimeoutSeconds, GETDATE())))
 ORDER BY StartDate
GO

-- Return availability information,
-- splitting any recurring date ranges that cross year boundaries into multiple rows for the contiguous month spans

-- Return year-end range when yearly recurring period crosses the year-end boundary
SELECT AvailID, Name, AvailStartYear, AvailStartMonth, AvailStartDay, AvailStartDate, AvailEndYear, 12 AS AvailEndMonth, 31 AS AvailEndDay, dbo.GetAvailableDate(AvailEndYear, 12, 31, 1) AS AvailEndDate
  FROM Availability
 WHERE Available = 1
   AND Active = 1
   AND AvailStartMonth > AvailEndMonth
 UNION
-- Return year-start range when yearly recurring period crosses the year-end boundary
SELECT AvailID, Name, AvailStartYear, 1 AS AvailStartMonth, 1 AS AvailStartDay, dbo.GetAvailableDate(AvailStartYear, 1, 1, 0) AS AvailStartDate, AvailEndYear, AvailEndMonth, AvailEndDay, AvailEndDate
  FROM Availability
 WHERE Available = 1
   AND Active = 1
   AND AvailStartMonth > AvailEndMonth
 UNION
-- Return recurring ranges that do not cross the year-end boundary
SELECT AvailID, Name, AvailStartYear, AvailStartMonth, AvailStartDay, AvailStartDate, AvailEndYear, AvailEndMonth, AvailEndDay, AvailEndDate
  FROM Availability
 WHERE Available = 1
   AND Active = 1
   AND AvailStartMonth <= AvailEndMonth
GO

-- Find discrete availability schedule ranges assigned to sites/locations
-- this skips those that are not assigned to any Items
SELECT DISTINCT a.*
  FROM DiscreteAvailabilityRanges a
  JOIN ItemsXAvailRates ixr ON ixr.AvailID = a.AvailID
  --JOIN Items s ON ixr.ItemID = s.ItemID
 ORDER BY AvailStartDate, AvailEndDate
GO

-- Find availability info for a site on a date (returns all availability ranges that apply)
SELECT DISTINCT a.*
  FROM DiscreteAvailabilityRanges a
  JOIN ItemsXAvailRates ixr ON ixr.AvailID = a.AvailID
  JOIN Items s ON ixr.ItemID = s.ItemID
 WHERE GETDATE() BETWEEN AvailStartDate AND AvailEndDate  --date param here
   AND s.ItemID = 715289                                  --site ItemID param here (715289 is Kinsail_JNeely ItemID)
 ORDER BY AvailStartDate, AvailEndDate
GO

-- Find availability and costs info by day (for each day) between two dates for a site
SELECT s.ItemID, s.Name AS SiteName, d.[Date], a.AvailID, a.Name AS AvailName, 
       r.RateID, r.BaseFee, r.DailyFee, r.WeekdayFee, r.WeekendFee, r.DepositBaseFee, r.DepositDailyFee, r.ProcessorBaseFee, r.ProcessorDailyFee
  FROM DiscreteAvailabilityRanges a
  JOIN ItemsXAvailRates ixr ON ixr.AvailID = a.AvailID
  JOIN Items s ON ixr.ItemID = s.ItemID
  JOIN Rates r ON ixr.RateID = r.RateID
  JOIN Dates d ON d.[Date] >= a.AvailStartDate AND d.[Date] <= a.AvailEndDate
 WHERE d.[Date] >= '3-28-2015'
   AND d.[Date] < '4-3-2015'                              --reservation date params here
   AND s.ItemID = 715289                                  --site ItemID param here (715289 is Kinsail_JNeely ItemID)
 ORDER BY d.[Date]
GO

-- Find discrete availability ranges that overlap a date range
SELECT * 
  FROM dbo.DiscreteAvailabilityRanges dar
 WHERE dar.AvailStartDate <= '6-25-2015' 
   AND dar.AvailEndDate >= '6-23-2015'
GO

-- Find dates within the reservation date span and the schedules/rates that apply to each day
SELECT s.ItemID, s.Name AS SiteName, ixf.Value AS Reservable, d.[Date], d.DayofWeekName, d.IsResvWeekend,
       ar.ItemID, ar.RateID, ar.AvailID, ar.AvailStartDate, ar.AvailEndDate,
       ar.AvailBeforeDays, ar.ReserveBeforeDays, ar.MinDurationDays, ar.MaxDurationDays, 
       ar.MaxDurationWeekends, ar.BetweenStaysDays,
       DATEDIFF(DAY, GETDATE(), d.[Date]) DaysBefore,
       CASE 
           WHEN (DATEDIFF(DAY, GETDATE(), d.[Date]) BETWEEN ar.ReserveBeforeDays AND ar.AvailBeforeDays) 
               THEN 1 
           ELSE 0 
       END AS WithinAdvWindow,
       ar.RateID, ar.BaseFee, ar.DailyFee, ar.WeekdayFee, ar.WeekendFee, ar.DepositBaseFee, ar.DepositDailyFee,
       ar.ProcessorBaseFee, ar.ProcessorDailyFee, ar.DepositPercent, ar.ProcessorPercent
  FROM Dates d
 CROSS JOIN Items s
  LEFT JOIN ItemsXFeatures ixf ON s.ItemID = ixf.ItemID
  LEFT JOIN (SELECT ixar.ItemID, 
                    dar.AvailID, dar.AvailStartDate, dar.AvailEndDate,
                    a.AvailBeforeDays, a.ReserveBeforeDays, a.MinDurationDays, a.MaxDurationDays, 
                    a.MaxDurationWeekends, a.BetweenStaysDays,
                    r.RateID, r.BaseFee, r.DailyFee, r.WeekdayFee, r.WeekendFee, r.DepositBaseFee, r.DepositDailyFee,
                    r.ProcessorBaseFee, r.ProcessorDailyFee, r.DepositPercent, r.ProcessorPercent
               FROM ItemsXAvailRates ixar
               JOIN Rates r 
                 ON ixar.RateID = r.RateID
               JOIN DiscreteAvailabilityRanges dar 
                 ON ixar.AvailID = dar.AvailID
               JOIN [Availability] a
                 ON dar.AvailID = a.AvailID
            ) ar
    ON s.ItemID = ar.ItemID
   AND d.[Date] >= ar.AvailStartDate
   AND d.[Date] <= ar.AvailEndDate
 WHERE s.ItemID = 715289               --site ItemID param here (715289 is Kinsail_JNeely ItemID)
   AND ixf.FeatureID = (SELECT FeatureID FROM Features WHERE Name = 'Reservable')
   AND d.[Date] >= '3-26-2015'         --reservation StartDate param here
   AND d.[Date] < '4-1-2015'           --reservation EndDate param here
GO



------------------------------------------------------------
-- PARTNERS
------------------------------------------------------------

--Find the default Kinsail partner
SELECT * FROM Partners WHERE PartnerCode='corp'

--Find the Wichi partner
SELECT pxg .*, p.*
  FROM PartnersXGroups pxg
  JOIN Partners p ON pxg.PartnerID = p.PartnerID
 WHERE p.PartnerCode='wichi'

--Find partner info and associated groups/items
SELECT p.PartnerID, p.PartnerCode, p.PartnerName, pt.PartnerTypeName, pxg.PrimaryPartner, pxg.GroupID, g.Name AS GroupName, i.ItemID, i.Name AS ItemName
  FROM Partners p 
  LEFT OUTER JOIN PartnersXGroups pxg ON p.PartnerID = pxg.PartnerID
  LEFT OUTER JOIN Groups g ON pxg.GroupID = g.GroupID
  LEFT OUTER JOIN Items i ON g.GroupID = i.GroupID
  LEFT OUTER JOIN PartnerTypes pt ON p.PartnerTypeID = pt.PartnerTypeID
 WHERE PartnerCode='wichi'



------------------------------------------------------------
-- RESERVATIONS / COSTS
------------------------------------------------------------

-- Find a reservation for a UniqueID
SELECT * 
  FROM dbo.Reservations r
 WHERE r.UniqueID = 33369758144590400
GO

--Find reservations
SELECT TOP 500 * FROM ReservationResources
SELECT COUNT(*) FROM ReservationResources
SELECT TOP 500 * FROM Reservations

-- Find total costs for a reservation of a site between two dates
SELECT s.ItemID, MAX(s.Name) AS SiteName, MAX(r.BaseFee) AS TransactionFee, SUM(r.DailyFee) AS DailyFees, 
       SUM(r.WeekdayFee * (1-d.IsResvWeekend)) AS WeekdayFees, SUM(r.WeekendFee * d.IsResvWeekend) AS WeekendFees,
       MAX(r.DepositBaseFee) AS TransactionDeposit, SUM(r.DepositDailyFee) AS DepositFee
  FROM DiscreteAvailabilityRanges a
  JOIN ItemsXAvailRates ixr ON ixr.AvailID = a.AvailID
  JOIN Items s ON ixr.ItemID = s.ItemID
  JOIN Rates r ON ixr.RateID = r.RateID
  JOIN Dates d ON d.[Date] >= a.AvailStartDate AND d.[Date] <= a.AvailEndDate
 WHERE d.[Date] >= '3-28-2015'
   AND d.[Date] < '4-3-2015'                              --reservation date params here
   AND s.ItemID = 715289                                  --site ItemID param here (715289 is Kinsail_JNeely ItemID)
 GROUP BY s.ItemID
GO

-- Find total costs (simplified) for a reservation of a site between two dates
SELECT s.ItemID, MAX(s.Name) AS SiteName, COUNT(d.[Date]) AS Days, 
       MIN(d.[Date]) AS FirstNight,
       MAX(d.[Date]) AS LastNight,
       MAX(r.BaseFee) + SUM(r.DailyFee) + 
       SUM(r.WeekdayFee * (1-d.IsResvWeekend)) + SUM(r.WeekendFee * d.IsResvWeekend) AS TotalFees,
       MAX(r.DepositBaseFee) + SUM(r.DepositDailyFee) AS TotalDeposit,
       MAX(r.ProcessorBaseFee) + SUM(r.ProcessorDailyFee) AS TotalKinsailFee
  FROM DiscreteAvailabilityRanges a
  JOIN ItemsXAvailRates ixr ON ixr.AvailID = a.AvailID
  JOIN Items s ON ixr.ItemID = s.ItemID
  JOIN Rates r ON ixr.RateID = r.RateID
  JOIN Dates d ON d.[Date] >= a.AvailStartDate AND d.[Date] <= a.AvailEndDate
 WHERE d.[Date] >= '6-23-2015'
   AND d.[Date] < '6-25-2015'                             --reservation date params here
   AND s.ItemID = 861399                                  --site ItemID param here (715289 is Kinsail_JNeely ItemID)
 GROUP BY s.ItemID
GO

--Find info about the reservation and how it meets the reservation rules (precursor to the validator below)
SELECT s.ItemID,
       MAX(s.Name) AS Name,
       1 - MIN(ixf.Value) AS SiteReservable,      --site is reservable?
       COUNT(*) AS Nights,                        --total nights in the stay
       COUNT(ar.ItemID) AS AvailableNights,       --total nights on an availability schedule
       MAX(ar.MinDurationDays) AS MinStayNights,  --minimum nights allowed in the stay
       MIN(ar.MaxDurationDays) AS MaxStayNights,  --maximum nights allowed in the stay
       SUM(1 * IsResvWeekend) AS WeekendNights,   --total weekend nights in the stay
	  MIN(ISNULL(ar.MaxDurationWeekends, 999)) AS MaxStayWeekendNights,  -- maximum weekend nights allowed in the stay
       SUM(CASE 
               WHEN (DATEDIFF(DAY, GETDATE(), d.[Date]) BETWEEN ar.ReserveBeforeDays AND ar.AvailBeforeDays) THEN 1 
               ELSE 0 
           END) AS NightsWithinWindow             --total nights that are within the advanced reservation window
  FROM Dates d
 CROSS JOIN Items s
  LEFT JOIN ItemsXFeatures ixf ON s.ItemID = ixf.ItemID
  LEFT JOIN (SELECT ixar.ItemID, 
                    dar.AvailID, dar.AvailStartDate, dar.AvailEndDate,
                    a.AvailBeforeDays, a.ReserveBeforeDays, a.MinDurationDays, a.MaxDurationDays, 
                    a.MaxDurationWeekends, a.BetweenStaysDays,
                    r.RateID, r.BaseFee, r.DailyFee, r.WeekdayFee, r.WeekendFee, r.DepositBaseFee, r.DepositDailyFee,
                    r.ProcessorBaseFee, r.ProcessorDailyFee, r.DepositPercent, r.ProcessorPercent
               FROM ItemsXAvailRates ixar
               JOIN Rates r 
                 ON ixar.RateID = r.RateID
               JOIN DiscreteAvailabilityRanges dar 
                 ON ixar.AvailID = dar.AvailID
               JOIN [Availability] a
                 ON dar.AvailID = a.AvailID
            ) ar
    ON s.ItemID = ar.ItemID
   AND d.[Date] >= ar.AvailStartDate
   AND d.[Date] <= ar.AvailEndDate
 WHERE s.ItemID = 861399               --site ItemID param here (715289 is Kinsail_JNeely ItemID)
   AND ixf.FeatureID = (SELECT FeatureID FROM Features WHERE Name = 'Reservable')
   AND d.[Date] >= '5-18-2015'         --reservation StartDate param here
   AND d.[Date] < '5-24-2015'          --reservation EndDate param here
 GROUP BY s.ItemID
GO

-- Validate a Reservation
-- Query evaluates site reservation rules, returning 0 if all rules are met,
-- else a positive number indicating which rules are not met:
--   1 = site is not reservable
--   2 = one or more days within the period are not on an active availability schedule
--   4 = reservation duration doesn't meet minimum stay requirement
--   8 = reservation duration exceeds maximum stay limit
--   16 = reservation exceeds maximum weekend stay limit
--   32 = reservation request does not fall within advanced reservation window
--   64 = one or more days within the period overlap with an existing reservation

SELECT 1 - MIN(ixf.Value) +  --site is reservable?
       CASE  --all days on active availability schedule?
	      WHEN COUNT(*) = COUNT(ar.ItemID) THEN 0
		 ELSE 2
       END +
       CASE  --meets minimum stay requirement?
           WHEN COUNT(*) >= MAX(ar.MinDurationDays) THEN 0
           ELSE 4
       END +
       CASE  --meets maximum stay limit?
           WHEN COUNT(*) <= MIN(ar.MaxDurationDays) THEN 0
           ELSE 8
       END +
       CASE  --meets maximum weekend limit?
           WHEN SUM(1 * IsResvWeekend) <= MIN(ISNULL(ar.MaxDurationWeekends, 999)) THEN 0
           ELSE 16
       END +
       CASE  --within advanced reservation window?
           WHEN COUNT(*) = SUM(CASE 
                                   WHEN (DATEDIFF(DAY, GETDATE(), d.[Date]) BETWEEN ar.ReserveBeforeDays AND ar.AvailBeforeDays) THEN 1 
                                   ELSE 0 
                               END) THEN 0
           ELSE 32
       END AS Result
  FROM Dates d
 CROSS JOIN Items s
  LEFT JOIN ItemsXFeatures ixf ON s.ItemID = ixf.ItemID
  LEFT JOIN (SELECT ixar.ItemID, 
                    dar.AvailID, dar.AvailStartDate, dar.AvailEndDate,
                    a.AvailBeforeDays, a.ReserveBeforeDays, a.MinDurationDays, a.MaxDurationDays, 
                    a.MaxDurationWeekends, a.BetweenStaysDays,
                    r.RateID, r.BaseFee, r.DailyFee, r.WeekdayFee, r.WeekendFee, r.DepositBaseFee, r.DepositDailyFee,
                    r.ProcessorBaseFee, r.ProcessorDailyFee, r.DepositPercent, r.ProcessorPercent
               FROM ItemsXAvailRates ixar
               JOIN Rates r 
                 ON ixar.RateID = r.RateID
               JOIN DiscreteAvailabilityRanges dar 
                 ON ixar.AvailID = dar.AvailID
               JOIN [Availability] a
                 ON dar.AvailID = a.AvailID
            ) ar
    ON s.ItemID = ar.ItemID
   AND d.[Date] >= ar.AvailStartDate
   AND d.[Date] <= ar.AvailEndDate
 WHERE s.ItemID = 715289               --site ItemID param here (715289 is Kinsail_JNeely ItemID)
   AND ixf.FeatureID = (SELECT FeatureID FROM Features WHERE Name = 'Reservable')
   AND d.[Date] >= '6-24-2015'         --reservation StartDate param here
   AND d.[Date] < '6-27-2015'           --reservation EndDate param here
 GROUP BY s.ItemID
GO

-- Find reservations (valid + expired) for recreation sites that end in the future
SELECT rr.ResourceID, i.ItemID, i.GroupID, rr.ResourceName, rr.ResourceDescription, r.UniqueID, r.IsReserved,
       rr.StartDateTime AS StartDate, rr.EndDateTime AS EndDate
  FROM ReservationResources rr
  JOIN Reservations r ON rr.ResourceID = r.ResourceID
  JOIN Items i ON rr.ItemID = i.ItemID
 WHERE rr.ItemID > 0
   AND rr.EndDateTime > GETDATE()  --that end in the future
   AND i.ItemTypeID = (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site')  --for recreation sites
 ORDER BY StartDateTime
 
SELECT rr.ResourceID, rr.ResourceName, rr.ResourceDescription, rr.StartDateTime AS StartDate, rr.EndDateTime AS EndDate
  FROM ReservationResources rr
 WHERE rr.ItemID = 724689 --@0
   AND rr.EndDateTime > getDate()
 ORDER BY StartDateTime

--Find valid future reservations (IsReserved=1)
SELECT r.*, rr.*, 1 - r.IsReserved AS TempReservation
  FROM dbo.Reservations r
  JOIN dbo.ReservationResources rr ON rr.ResourceID = r.ResourceID
 WHERE ((r.IsReserved = 1 AND rr.EndDateTime > GETDATE())
    OR r.CartRefreshDateTime > GETDATE())
   AND rr.ResourceName LIKE '%campground%'
GO

--reservations_for
--Find completed reservations plus any unexpired temporary reservations for a given ItemID
--(only for reservation dates in the future)
SELECT rr.ResourceID, rr.ItemID, rr.ResourceName, rr.ResourceDescription, rr.StartDateTime, rr.EndDateTime, r.ReservationID, r.UniqueID, r.IsReserved, r.Cancelled, 
       r.CartRefreshDateTime, GETDATE() AS Now, 
	  1 - r.IsReserved AS Temp, CASE IsReserved WHEN 0 THEN DATEDIFF(MINUTE, GETDATE(), DATEADD(SECOND, rr.CartTimeoutSeconds, r.CartRefreshDateTime)) WHEN 1 THEN NULL END AS ExpiresInMins
  FROM dbo.Reservations r
  JOIN dbo.ReservationResources rr ON rr.ResourceID = r.ResourceID
 WHERE rr.ItemID = 724689 --861399 --@SiteID
   AND r.Cancelled = 0 --disregard those marked cancelled
   AND rr.EndDateTime > GETDATE() --only consider those that end in the future
   AND (r.IsReserved = 1 OR (r.CartRefreshDateTime > DATEADD(SECOND, -1 * rr.CartTimeoutSeconds, GETDATE()))) --only those fully reserved or those temporarily reserved and within the timerout period
GO

--expired_reservations_for
--Find expired temporary reservations (ONLY) for a given ItemID
--(only for reservation dates in the future)
SELECT rr.ResourceID, rr.ItemID, rr.ResourceName, rr.ResourceDescription, rr.StartDateTime, rr.EndDateTime, r.ReservationID, r.UniqueID, r.IsReserved, r.Cancelled, 
       r.CartRefreshDateTime, GETDATE() AS Now, 
       1 - r.IsReserved AS Temp, DATEDIFF(MINUTE, DATEADD(SECOND, rr.CartTimeoutSeconds, r.CartRefreshDateTime), GETDATE()) AS ExpiredMinsAgo
  FROM dbo.Reservations r
  JOIN dbo.ReservationResources rr ON rr.ResourceID = r.ResourceID
 WHERE rr.ItemID = 724689 --861399 --@SiteID
   AND r.Cancelled = 0 --disregard those marked cancelled
   AND rr.EndDateTime > GETDATE() --only consider those that end in the future
   AND (r.IsReserved = 0 AND (DATEADD(SECOND, rr.CartTimeoutSeconds, r.CartRefreshDateTime) < GETDATE())) --only those not fully reserved AND that have expired
GO


--Create reservation and flag it as IsReserved=1 (completed reservation)
BEGIN
    DECLARE @ReservationID int = 0

    EXEC @ReservationID = dbo.ReserveSite
	     @SiteID = 724689,
	     @StartDate = '2015-05-05',
	     @EndDate = '2015-05-09',
	     @UniqueID = 123123123123

    IF (@ReservationID > 0)
    BEGIN
	   UPDATE dbo.Reservations
	      SET IsReserved = 1  
	    WHERE ReservationID = @ReservationID
    END
END
GO

--Example of calling the SP (first version, which returns error codes)
BEGIN
    DECLARE @ErrorMsg varchar(100);
    DECLARE @Result int;

    DECLARE @ID bigint = (SELECT dbo.fGetUniqueID(RAND())); --generate random UniqueID
    SELECT @ID AS UniqueID;

    EXEC @Result = dbo.ReserveSite
	   @SiteID = 715289,
	   @StartDate ='2015-04-25',
	   @EndDate ='2015-04-29',
	   @UniqueID = @ID,
	   @Message = @ErrorMsg OUTPUT
END
GO

--Example of calling the SP (second version, which outputs a message row)
BEGIN
    DECLARE @ID bigint = (SELECT dbo.fGetUniqueID(RAND())) --generate random UniqueID
    SELECT @ID AS UniqueID

    EXEC dbo.ReserveSite2
	   @SiteID = 724689, --861399,
	   @StartDate ='2015-06-20',
	   @EndDate ='2015-06-22',
	   @UniqueID = @ID
END
GO



------------------------------------------------------------
-- PAYMENTS
------------------------------------------------------------

--Find all charge types
SELECT ChargeTypeID, ChargeTypeName, ItemLevel, IsCustomPayment, KinsailFee, Multiplier, ClientCharge, RegistrantCharge, Active 
  FROM ChargeTypes 
 ORDER BY ItemLevel DESC, IsCustomPayment, KinsailFee, ChargeTypeID
GO

--Find PaymentData for a UniqueID
SELECT pd.*, ct.*
  FROM dbo.PaymentData pd
  JOIN dbo.ChargeTypes ct ON pd.ChargeTypeID = ct.ChargeTypeID 
 WHERE pd.UniqueID = 33369758144590400
GO



------------------------------------------------------------
-- ENTRY DATA
------------------------------------------------------------

--Find EntryData for a UniqueID
SELECT * 
  FROM dbo.EntryData ed
  JOIN dbo.FormFields ff ON ed.FormFieldID = ff.FormFieldID
  JOIN dbo.Fields f ON f.FieldID = ff.FieldID
 WHERE ed.UniqueID = 39942396496393296
 --WHERE ed.UniqueID = 8184716794208501



------------------------------------------------------------
-- PERMISSIONS
------------------------------------------------------------

--Permissions assigned to users for group=37099
SELECT g.GroupID, g.Name, c.ContactID, c.FirstName + ' ' + c.LastName, pt.*, p.*
 FROM Groups g
 JOIN dbo.GroupsXContacts gx ON g.GroupID = gx.GroupID
 JOIN Contacts c ON c.ContactID = gx.ContactID
 JOIN dbo.Permissions p ON p.GroupContactID = gx.ContactID
 JOIN dbo.PermissionTypes pt ON p.PermissionTypeID = pt.PermissionTypeID
WHERE g.GroupID = 37099
  AND p.IsGroup = 0

--GroupPermissions (aka Role) assigned to users for group=37099
SELECT g.GroupID, g.Name, c.ContactID, c.FirstName + ' ' + c.LastName, pt.*, pg.*, p.*
 FROM Groups g
 JOIN dbo.GroupsXContacts gx ON g.GroupID = gx.GroupID
 JOIN Contacts c ON c.ContactID = gx.ContactID
 JOIN dbo.PermissionGroups pg ON pg.PermissionGroupID = c.PermissionGroupID
 JOIN dbo.Permissions p ON p.GroupContactID = pg.PermissionGroupID
 JOIN dbo.PermissionTypes pt ON p.PermissionTypeID = pt.PermissionTypeID
WHERE g.GroupID = 37099
  AND p.IsGroup = 1

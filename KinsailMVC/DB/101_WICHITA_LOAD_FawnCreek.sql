------------------------------------------------------------
-- Fawn Creek Campground
--   Data Load Script
--   3/18/2015
--   Assumes base campsites DB schema has already been created
------------------------------------------------------------



------------------------------------------------------------
--Location (Address)
------------------------------------------------------------

INSERT INTO Locations (LocationName, StreetAddress, StreetAddress2, City, State, ZipCode, Country, Directions, Parking, Latitude, Longitude, Active, Audit_ContactID)
VALUES ('Fawn Creek Campground Address', '32 Refuge Headquarters', '', 'Indiahoma', 'OK', '73552', 'US', '', '', 34.750961, -98.682064, 1, NULL)
GO


--Items
INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('Fawn Creek Campground', 'Fawn Creek Campground, located south of Refuge Headquarters near the Charons Garden Wilderness Area, has four camping sites available for organized youth groups.', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Location'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Fawn Creek Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO


--ItemsXLocations
INSERT INTO ItemsXLocations (ItemID, LocationID, DisplayOrder, Description)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT LocationID FROM Locations WHERE LocationName = 'Fawn Creek Campground Address'), 0, 'Main Address')
GO


--ItemsXOrganizations
INSERT INTO ItemsXOrganizations (ItemID, OrgID, DisplayOrder, Description)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT OrgID FROM Organizations WHERE Name = 'Wichita Mountains Wildlife Refuge'), 0, 'Primary Operating Organization')
GO


--ItemsXFeatures
INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Hiking Trails'), '1', 1)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Tent Sites'), '1', 2)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Recreation Vehicle Sites'), '1', 3)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Group Tenting'), '1', 4)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Hot Water'), '1', 5)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Showers'), '1', 6)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Restrooms'), '1', 7)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Drinking Water Fountains'), '1', 8)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Chemical Toilets'), '1', 9)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Trash Dumpsters'), '1', 10)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Animal Warning'), 'Buffalo, Longhorn cattle', 11)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Public Telephones'), '1', 12)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Visitor Parking'), '1', 13)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Sanitary Dump Station'), '1', 14)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Base URL'), '/fawn', 15)
GO


--Maps
INSERT INTO Maps (Name, Description, TilesURL, Width, Height, CenterX, CenterY, ZoomMin, ZoomMax, ZoomDefault, LatitudeNorth, LatitudeSouth, LongitudeWest, LongitudeEast, Active)
VALUES ('Fawn Creek Campground Map', 'Map of the recreation location', '/tiles', 2048.00, 2048.00, 1024.00, 1024.00, 2, 4, 2, 0.00000, 0.00000, 0.00000, 0.00000, 1)
GO


--MapsXFeatures
INSERT INTO MapsXFeatures (MapID, FeatureID, DisplayOrder, CustomMarkerFlag, MatchOperator, MatchValue, Marker, Description, OffsetX, OffsetY)
VALUES ((SELECT MapID FROM Maps WHERE Name = 'Fawn Creek Campground Map'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, 0, 'GTE', '0', '', '', 0, 0)
GO


--ItemsXMaps
INSERT INTO ItemsXMaps (ItemID, MapID, DisplayOrder, CoordinateX, CoordinateY, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT MapID FROM Maps WHERE Name = 'Fawn Creek Campground Map'), 0, 0.00, 0.00, 0)
GO


--Images / ItemsXImages
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'scenic_01.jpg', 'scenic_01.jpg', '', '', 1)
GO

INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = 'scenic_01.jpg' AND FullURL = 'scenic_01.jpg' AND Caption = '' AND Source = ''), 1)
GO

INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'scenic_02.jpg', 'scenic_02.jpg', '', '', 1)
GO

INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = 'scenic_02.jpg' AND FullURL = 'scenic_02.jpg' AND Caption = '' AND Source = ''), 2)
GO

INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'scenic_03.jpg', 'scenic_03.jpg', '', '', 1)
GO

INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = 'scenic_03.jpg' AND FullURL = 'scenic_03.jpg' AND Caption = '' AND Source = ''), 3)
GO


--Availability
INSERT INTO Availability (Name, Description, Policies, Available, AvailStartYear, AvailStartMonth, AvailStartDay, AvailEndYear, AvailEndMonth, AvailEndDay, AvailBeforeDays, ReserveBeforeDays, CancelBeforeDays, MinDurationDays, MaxDurationDays, MaxDurationWeekends, BetweenStaysDays, Active)
VALUES ('Fawn Creek Campground Availability - Period 1', 'Availability during the entire year', 'POLICIES: 

FEES
Campers pay fees in advance, payable to U.S. Fish and Wildlife Service.  Fees cover the use of the facility from 3 pm on the day of payment until vacating time of 3 pm on the following day. America the Beautiful Passports will be honored. Campsites cannot be reserved or “saved” for campers arriving later.

GROUP SITE CAPACITY
Group camping is permitted only at one of the four designated group camping sites. Group camping sites are available by reservation
up to 90 days in advance by contacting the Refuge Manager, Wichita Mountains Wildlife Refuge, 32 Refuge Headquarters, Indiahoma, Oklahoma 73552 or 580/429-3222 during office hours. When not under reservation, the group camping sites are available on a first-come, first-serve basis.
A minimum of 8 and a maximum of 30 people may utilize/reserve a group camping site.
A responsible adult 18 years of age or older must accompany each group.

LENGTH OF STAY
Maximum camping period shall be limited to 7 consecutive days.

CHECK OUT TIME
Campsites must be vacated by 3 pm of the day camping permit expires unless the permit is renewed before 2 pm consistent with occupancy and/or availability. After 3 pm another day will be charged.

OCCUPANCY REQUIREMENT
Overnight campsite occupancy is mandatory during the entire camping period designated on the permit.', 1, NULL, 1, 1, NULL, 12, 31, 90, 1, 1, 1, 7, 1, 1, 1)
GO


--Rates
INSERT INTO Rates (Name, Description, ValidFrom, ValidTo, BaseFee, DailyFee, WeekdayFee, WeekendFee, DepositBaseFee, DepositDailyFee, Active)
VALUES ('Fawn Creek Campground - Group 2015', 'Rates for group tent sites (2015)', 'Jan 1 2015 12:00:00:000AM', 'Dec 31 2020 11:59:59:999PM', 0.00, 5.00, 0.00, 0.00, 0.00, 0.00, 1)
GO


--Fix Map
UPDATE dbo.Maps
   SET CenterX = 34.7199, CenterY = -98.7069, LatitudeNorth = 34.7260, LatitudeSouth = 34.7160, LongitudeEast = -98.6920, LongitudeWest = -98.7120,
       ZoomMin = 17, ZoomMax = 19, ZoomDefault = 17
 WHERE Name = 'Fawn Creek Campground Map'
GO


--
--Sites
--

--Items (Sites)
INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('A', 'Fawn Creek group camping site A', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Fawn Creek Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('B', 'Fawn Creek group camping site B', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Fawn Creek Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('C', 'Fawn Creek group camping site C', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Fawn Creek Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('D', 'Fawn Creek group camping site D', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Fawn Creek Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

--ItemsXItems
INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Fawn Creek Campground'), (SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Fawn Creek Campground'), (SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Fawn Creek Campground'), (SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'D' AND LocationName = 'Fawn Creek Campground'), (SELECT ItemID FROM Items WHERE Name = 'Fawn Creek Campground'), 'Site within Location')
GO


--ItemsXFeatures

--Site Type
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '10')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '10')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '10')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'D' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '10')
GO

--Reservable
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'D' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '1')
GO

--Max Occupants
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '30')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '30')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '30')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'D' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '30')
GO

--Pets Allowed
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'D' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 5, '1')
GO

--Table
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'D' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 6, '1')
GO

--Fire Ring/Grate
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 7, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 7, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 7, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'D' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 7, '1')
GO

--Handicap Accessible
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'D' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 8, '0')
GO

--Electricity
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 9, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 9, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 9, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'D' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 9, '0')
GO

--Min Occupants
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 4, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 4, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 4, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'D' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 4, '8')
GO

--Parking Capacity
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'D' AND LocationName = 'Fawn Creek Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '8')
GO

--ItemsXMaps
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Fawn Creek Campground'), (SELECT MapID FROM Maps WHERE Name = 'Fawn Creek Campground Map'), 34.7209799909571, -98.7076252698898, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Fawn Creek Campground'), (SELECT MapID FROM Maps WHERE Name = 'Fawn Creek Campground Map'), 34.7204420661006, -98.70874106884, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Fawn Creek Campground'), (SELECT MapID FROM Maps WHERE Name = 'Fawn Creek Campground Map'), 34.7195602145023, -98.7097924947738, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'D' AND LocationName = 'Fawn Creek Campground'), (SELECT MapID FROM Maps WHERE Name = 'Fawn Creek Campground Map'), 34.719057554883, -98.708569407463, 1, 1)
GO

--Images & ItemsXImages
--Site A
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'site_photo_01.jpg', 'site_photo_01.jpg', 'Site A - site_photo_01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Fawn Creek Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = 'site_photo_01.jpg' AND FullURL = 'site_photo_01.jpg' AND Caption = 'Site A - site_photo_01.jpg' AND Source = ''), 1)
GO

--Site B
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'site_photo_02.jpg', 'site_photo_02.jpg', 'Site B - site_photo_02.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Fawn Creek Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = 'site_photo_02.jpg' AND FullURL = 'site_photo_02.jpg' AND Caption = 'Site B - site_photo_02.jpg' AND Source = ''), 1)
GO

--Site C
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'site_photo_03.jpg', 'site_photo_03.jpg', 'Site C - site_photo_03.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Fawn Creek Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = 'site_photo_03.jpg' AND FullURL = 'site_photo_03.jpg' AND Caption = 'Site C - site_photo_03.jpg' AND Source = ''), 1)
GO

--Site D
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'site_photo_04.jpg', 'site_photo_04.jpg', 'Site D - site_photo_04.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'D' AND LocationName = 'Fawn Creek Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = 'site_photo_04.jpg' AND FullURL = 'site_photo_04.jpg' AND Caption = 'Site D - site_photo_04.jpg' AND Source = ''), 1)
GO


--ItemsXAvailRates
INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Fawn Creek Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Fawn Creek Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Fawn Creek Campground - Group 2015'), 30, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Fawn Creek Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Fawn Creek Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Fawn Creek Campground - Group 2015'), 30, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Fawn Creek Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Fawn Creek Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Fawn Creek Campground - Group 2015'), 30, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'D' AND LocationName = 'Fawn Creek Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Fawn Creek Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Fawn Creek Campground - Group 2015'), 30, 1)
GO


------------------------------------------------------------
-- Doris Campground
--   Data Load Script
--   1/16/2015
--   Assumes base campsites DB schema has already been created
------------------------------------------------------------



------------------------------------------------------------
-- Location (Address)
------------------------------------------------------------

INSERT INTO Locations (LocationName, StreetAddress, StreetAddress2, City, State, ZipCode, Country, Directions, Parking, Latitude, Longitude, Active, Audit_ContactID)
VALUES ('Doris Campground Address', '32 Refuge Headquarters', '', 'Indiahoma', 'OK', '73552', 'US', '', '', 34.750961, -98.682064, 1, NULL)
GO



------------------------------------------------------------
-- Group
------------------------------------------------------------

INSERT INTO Groups (Name, Description, Sponsor, LocationID, TypeID, MaxEntries, MaxServiceCharge, MinEntryFee, IncludedEntries, GeneralRegistrationPercentage, GeneralRegistrationFee, CheckFee, StandardRegistrationFee, StandardRegistrationPercentage, DefaultApprovalCode, Featured, ShowSponsor, ShowContact, ShowDeadline, ShowWaiverLink, ShowBillingPolicyLink, ShowInContactForm, ShowAccountAfterRegistration, ResultsPageShowTimeline, AllowSignWaivers, AllowNavigation, AllowHTML, AllowResumeRegistration, CanSaveRegistration, SaveRegistrationFirstPage, ApplyServiceChargeForMailedPayment, ChargeInFee, ProcessPayment, AutoSettleTransaction, SendPaymentFollowUpEmail, Active, WarningText, WarningTextEvaluationMethod, FeaturedText, FeaturedTextEvaluationMethod, ResultsDescriptionColumnHeader, ResultsDescriptionColumnHeaderEvaluationMethod, ResultsFeeColumnHeader, ResultsFeeColumnHeaderEvaluationMethod, ResultsQuantityColumnHeader, ResultsQuantityColumnHeaderEvaluationMethod, RegisterButtonText, RegisterButtonTextEvaluationMethod, PostSubmitRegisterButtonText, PostSubmitRegisterButtonTextEvaluationMethod, RegistrantEmail, RegistrantEmailEvaluationMethod, RegistrantNameColumns, RegistrantNameColumnsEvaluationMethod, RegistrantAddressColumns, RegistrantAddressColumnsEvaluationMethod, InvoiceWaitlistText, InvoiceWaitlistTextEvaluationMethod, PickListMessageText, PickListMessageTextEvaluationMethod, RegistrationOrganizationColumnName, RegistrationOrganizationColumnNameEvaluationMethod, ResultsDateColumnHeader, ResultsDateColumnHeaderEvaluationMethod, ExcessSelectionsErrorMessageID, NoSelectionErrorMessageID, BillingID, BillingPolicyID, PaymentechDivision, PaymentechSubmitterID, PaymentechMerchantDescriptor, PaymentechEntryDescription, PaypalVendor, PayGovAgencyID, OverrideEmailAddresses, FiscalYearEndDate, TimeZoneOffset, TimeZoneLabel, RegistrationTimeout, SaveRegistrationTimeoutSeconds, RegistrationTimeoutWarning, WebServiceCompletePageID, Audit_ContactID)
VALUES ('Doris Campground Reservations',
        'Campground reservations',
        'Wichita Mountains Wildlife Refuge',
        (SELECT LocationID FROM Locations WHERE LocationName = 'Doris Campground Address'),
        1604,
        0,
        0.00,
        0.00,
        0,
        0.00000,
        0.00,
        0.00,
        2.00,
        3.50000,
        'NONE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, '', '', '', '', 'Campsite', '', 'Cost', '', 'Days', '', 'Reserve Now!', '', 'Processing… please wait', '', 'Email', '', '', '', '', '', '', '', '', '', '', '', '', '', 5, 4, 1102, 703, 0, 1047, 'Kinsail*DORI', 'Reservations', 'KINSAIL', '', '', 'Dec 31 2015 12:00:00:000AM', NULL, NULL, 10, 864000, 5, 5401, NULL)
GO



------------------------------------------------------------
-- Recreation Location
------------------------------------------------------------

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('Doris Campground', 'Doris Campground is a modern camping facility designed to enhance your visit to the Wichita Mountains Wildlife Refuge. The campground offers a wide range of camping opportunities.', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Location'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO ItemsXLocations (ItemID, LocationID, DisplayOrder, Description)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), (SELECT LocationID FROM Locations WHERE LocationName = 'Doris Campground Address'), 0, 'Main Address')
GO



------------------------------------------------------------
-- Organization
------------------------------------------------------------

INSERT INTO Organizations (Name, Abbreviation, Description, PhoneLabel, Phone, Phone2Label, Phone2, EmailLabel, Email, URLLabel, URL, Active)
VALUES ('Wichita Mountains Wildlife Refuge', 'WMWR', 'Camping, rock climbing, trails & classes in an expansive preserve for bison, elk & other species.', 'Phone:', '(580) 429-2197', 'Reservation Phone:', '(580) 429-3222', 'Email:', 'Quinton_Smith@fws.gov ', 'Web Site:', 'http://www.fws.gov/refuge/Wichita_Mountains/', 1)
GO

INSERT INTO ItemsXOrganizations (ItemID, OrgID, DisplayOrder, Description)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), (SELECT OrgID FROM Organizations WHERE Name = 'Wichita Mountains Wildlife Refuge'), 0, 'Primary Operating Organization')
GO



------------------------------------------------------------
-- Features of the Recreation Location
------------------------------------------------------------

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Hiking Trails'), '1', 1)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Tent Sites'), '1', 2)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Recreation Vehicle Sites'), '1', 3)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Group Tenting'), '1', 4)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Hot Water'), '1', 5)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Showers'), '1', 6)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Restrooms'), '1', 7)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Drinking Water Fountains'), '1', 8)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Chemical Toilets'), '1', 9)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Trash Dumpsters'), '1', 10)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Animal Warning'), 'Buffalo, Longhorn cattle', 11)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Public Telephones'), '1', 12)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Visitor Parking'), '1', 13)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Sanitary Dump Station'), '1', 14)
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, Value, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Base URL'), '/doris', 15)
GO



------------------------------------------------------------
-- Map for the Recreation Location
------------------------------------------------------------

INSERT INTO Maps (Name, Description, TilesURL, Width, Height, CenterX, CenterY, ZoomMin, ZoomMax, ZoomDefault, LatitudeNorth, LatitudeSouth, LongitudeWest, LongitudeEast, Active)
VALUES ('Doris Campground Map', 'Map of the recreation location', '/tiles', 2048.00, 2048.00, 1024.00, 1024.00, 2, 4, 2, 0.00000, 0.00000, 0.00000, 0.00000, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, DisplayOrder, CoordinateX, CoordinateY, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 0, 0.00, 0.00, 0)
GO

INSERT INTO MapsXFeatures (MapID, FeatureID, DisplayOrder, CustomMarkerFlag, MatchOperator, MatchValue, Marker, Description, OffsetX, OffsetY)
VALUES ((SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, 0, 'GTE', '0', '', '', 0, 0)
GO

INSERT INTO MapsXFeatures (MapID, FeatureID, DisplayOrder, CustomMarkerFlag, MatchOperator, MatchValue, Marker, Description, OffsetX, OffsetY)
VALUES ((SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 2, 1, 'EQU', '1', '', 'Electricity available', 0, -16)
GO

INSERT INTO MapsXFeatures (MapID, FeatureID, DisplayOrder, CustomMarkerFlag, MatchOperator, MatchValue, Marker, Description, OffsetX, OffsetY)
VALUES ((SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 3, 0, 'EQU', '1', '', 'Handicap access', 16, 0)
GO



------------------------------------------------------------
-- Images for the Recreation Location
------------------------------------------------------------

INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', '', '', 1)
GO

INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = '' AND Source = ''), 1)
GO

INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo02.jpg', '/images/location/photo02.jpg', '', '', 1)
GO

INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo02.jpg' AND FullURL = '/images/location/photo02.jpg' AND Caption = '' AND Source = ''), 2)
GO

INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo03.jpg', '/images/location/photo03.jpg', '', '', 1)
GO

INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo03.jpg' AND FullURL = '/images/location/photo03.jpg' AND Caption = '' AND Source = ''), 3)
GO



------------------------------------------------------------
-- Availability for the Recreation Location
------------------------------------------------------------

INSERT INTO Availability (Name, Description, Policies, Available, AvailStartYear, AvailStartMonth, AvailStartDay, AvailEndYear, AvailEndMonth, AvailEndDay, AvailBeforeDays, ReserveBeforeDays, CancelBeforeDays, MinDurationDays, MaxDurationDays, Active)
VALUES ('Doris Campground Availability - Period 1', 'Availability during the Summer', 'POLICIES: 

Fees
Campers pay fees at Campground Contact Station before setting up camp. If campground attendant/fee collector is not available, campers may proceed to available site and set up; however, fees must be paid as soon as attendant/fee collector is available. Collector will make rounds prior to manning the booth. Camping fees shall be paid daily or if desired, may be paid in advance for the duration of the visit. The daily fee covers the use of the facility from 3 pm on the day of payment until vacating time of 3 pm on the following day. America the Beautiful Passports will be honored. Campsites cannot be reserved or “saved” for campers arriving later.

Single–Unit Site Capacity
Single–unit site camping, including semi- primitive, is permitted only at designed camping site. Camping shall be limited to 8 persons per site, including a responsible adult 18 years of age or older.

Group Site Capacity
Group camping is permitted only at one of the three designated group camping sites. Group camping sites are available by reservation
up to 90 days in advance by contacting the Refuge Manager, Wichita Mountains Wildlife Refuge, 32 Refuge Headquarters, Indiahoma, Oklahoma 73552 or 580/429-3222 during office hours. When not under reservation, the group camping sites are available on a first-come, first-serve basis. The electricity within the group shelters is for small appliances only.
A minimum of 8 and a maximum of 30 people may utilize/reserve a group camping site.
A responsible adult 18 years of age or older must accompany each group.

Length of Stay
Maximum camping period shall be limited to 10 consecutive days during the period of April through October. The 10-day stay may include only one weekend. A 14-day camping limit is permitted the remainder of the year. All camping equipment must be removed from the campground for 48 hours at the end of any 10 consecutive days (14 days in winter).

Check Out Time
Campsites must be vacated by 3 pm of the day camping permit expires unless the permit is renewed before 2 pm consistent with occupancy and/or availability. After 3 pm another day will be charged.

Occupancy Requirement
Overnight campsite occupancy is mandatory during the entire camping period designated on the permit.', 1, NULL, 4, 1, NULL, 10, 31, 90, 1, 1, 1, 10, 1)
GO

INSERT INTO Availability (Name, Description, Policies, Available, AvailStartYear, AvailStartMonth, AvailStartDay, AvailEndYear, AvailEndMonth, AvailEndDay, AvailBeforeDays, ReserveBeforeDays, CancelBeforeDays, MinDurationDays, MaxDurationDays, Active)
VALUES ('Doris Campground Availability - Period 2', 'Availability during the Winter', 'POLICIES: 

Fees
Campers pay fees at Campground Contact Station before setting up camp. If campground attendant/fee collector is not available, campers may proceed to available site and set up; however, fees must be paid as soon as attendant/fee collector is available. Collector will make rounds prior to manning the booth. Camping fees shall be paid daily or if desired, may be paid in advance for the duration of the visit. The daily fee covers the use of the facility from 3 pm on the day of payment until vacating time of 3 pm on the following day. America the Beautiful Passports will be honored. Campsites cannot be reserved or “saved” for campers arriving later.

Single–Unit Site Capacity
Single–unit site camping, including semi- primitive, is permitted only at designed camping site. Camping shall be limited to 8 persons per site, including a responsible adult 18 years of age or older.

Group Site Capacity
Group camping is permitted only at one of the three designated group camping sites. Group camping sites are available by reservation
up to 90 days in advance by contacting the Refuge Manager, Wichita Mountains Wildlife Refuge, 32 Refuge Headquarters, Indiahoma, Oklahoma 73552 or 580/429-3222 during office hours. When not under reservation, the group camping sites are available on a first-come, first-serve basis. The electricity within the group shelters is for small appliances only.
A minimum of 8 and a maximum of 30 people may utilize/reserve a group camping site.
A responsible adult 18 years of age or older must accompany each group.

Length of Stay
Maximum camping period shall be limited to 10 consecutive days during the period of April through October. The 10-day stay may include only one weekend. A 14-day camping limit is permitted the remainder of the year. All camping equipment must be removed from the campground for 48 hours at the end of any 10 consecutive days (14 days in winter).

Check Out Time
Campsites must be vacated by 3 pm of the day camping permit expires unless the permit is renewed before 2 pm consistent with occupancy and/or availability. After 3 pm another day will be charged.

Occupancy Requirement
Overnight campsite occupancy is mandatory during the entire camping period designated on the permit.', 1, NULL, 11, 1, NULL, 3, 31, 90, 1, 1, 1, 14, 1)
GO

--INSERT INTO ItemsXAvailability (ItemID, AvailID, MaxUnits, BaseRate, WeekdayRate, WeekendRate, DisplayOrder, Description)
--VALUES ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), 30, 0.00, 0.00, 0.00, 0, 'Campground availability and rates in the Summer')
--GO

--INSERT INTO ItemsXAvailability (ItemID, AvailID, MaxUnits, BaseRate, WeekdayRate, WeekendRate, DisplayOrder, Description)
--VALUES ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), 30, 0.00, 0.00, 0.00, 1, 'Campground availability and rates in the Winter')
--GO



------------------------------------------------------------
-- Recreation Sites (Items)
--
-- Set 1 (sites 1-30)
------------------------------------------------------------

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('1', 'Camping site 1', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('2', 'Camping site 2', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('3', 'Camping site 3', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('4', 'Camping site 4', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('5', 'Camping site 5', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('6', 'Camping site 6', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('7', 'Camping site 7', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('8', 'Camping site 8', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('9', 'Camping site 9', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('10', 'Camping site 10', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('11', 'Camping site 11', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('12', 'Camping site 12', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('13', 'Camping site 13', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('14', 'Camping site 14', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('15', 'Camping site 15', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('16', 'Camping site 16', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('17', 'Camping site 17', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('18', 'Camping site 18', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('19', 'Camping site 19', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('20', 'Camping site 20', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('21', 'Camping site 21', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('22', 'Camping site 22', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('23', 'Camping site 23', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('24', 'Camping site 24', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('25', 'Camping site 25', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('26', 'Camping site 26', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('27', 'Camping site 27', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('28', 'Camping site 28', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('29', 'Camping site 29', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('30', 'Camping site 30', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

--ItemsXItems
INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '1' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '2' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '3' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '4' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '5' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '6' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '7' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '8' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '9' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '10' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '11' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '12' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '13' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '14' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '15' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '16' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '17' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '18' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '19' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '20' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '21' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '22' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '23' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '24' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '25' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '26' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '27' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '28' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '29' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '30' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO



--ItemsXFeatures

--Site Type
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '1' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '2' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '3' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '4' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '5' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '6' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '7' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '8' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '9' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '10' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '11' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '12' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '13' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '14' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '15' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '16' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '17' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '18' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '19' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '20' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '21' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '22' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '23' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '24' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '25' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '26' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '27' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '28' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '29' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '30' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

--Min Occupants
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '1' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '2' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '3' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '4' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '5' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '6' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '7' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '8' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '9' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '10' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '11' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '12' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '13' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '14' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '15' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '16' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '17' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '18' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '19' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '20' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '21' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '22' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '23' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '24' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '25' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '26' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '27' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '28' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '29' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '30' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Min Occupants'), 2, '1')
GO

--Max Occupants
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '1' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '2' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '3' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '4' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '5' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '6' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '7' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '8' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '9' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '10' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '11' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '12' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '13' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '14' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '15' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '16' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '17' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '18' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '19' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '20' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '21' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '22' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '23' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '24' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '25' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '26' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '27' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '28' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '29' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '30' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

--Pets Allowed
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '1' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '2' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '3' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '4' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '5' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '6' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '7' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '8' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '9' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '10' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '11' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '12' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '13' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '14' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '15' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '16' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '17' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '18' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '19' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '20' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '21' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '22' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '23' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '24' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '25' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '26' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '27' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '28' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '29' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '30' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

--Table
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '1' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '2' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '3' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '4' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '5' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '6' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '7' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '8' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '9' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '10' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '11' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '12' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '13' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '14' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '15' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '16' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '17' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '18' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '19' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '20' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '21' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '22' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '23' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '24' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '25' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '26' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '27' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '28' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '29' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '30' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

--Fire Ring/Grate
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '1' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '2' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '3' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '4' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '5' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '6' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '7' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '8' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '9' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '10' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '11' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '12' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '13' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '14' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '15' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '16' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '17' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '18' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '19' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '20' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '21' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '22' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '23' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '24' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '25' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '26' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '27' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '28' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '29' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '30' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

--Handicap Accessible
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '1' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '2' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '3' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '4' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '5' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '6' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '7' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '8' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '9' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '10' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '11' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '12' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '13' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '14' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '15' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '16' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '17' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '18' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '19' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '20' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '21' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '22' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '23' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '24' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '25' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '26' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '27' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '28' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '29' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '30' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

--Electricity
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '1' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '2' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '3' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '4' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '5' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '6' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '7' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '8' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '9' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '10' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '11' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '12' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '13' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '14' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '15' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '16' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '17' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '18' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '19' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '20' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '21' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '22' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '23' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '24' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '25' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '26' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '27' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '28' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '29' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '30' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

--Parking Capacity
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '1' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '2' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '3' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '4' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '5' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '6' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '7' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '8' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '9' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '10' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '11' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '12' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '13' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '14' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '15' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '16' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '17' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '18' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '19' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '20' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '21' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '22' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '23' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '24' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '25' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '26' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '27' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '28' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '29' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '30' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

--Section
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '1' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop A')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '2' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop A')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '3' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop A')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '4' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop A')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '5' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop A')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '6' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop A')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '7' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop A')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '8' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop A')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '9' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop A')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '10' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop A')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '11' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop A')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '12' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop A')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '13' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop A')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '14' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop A')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '15' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop A')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '16' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop A')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '17' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop A')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '18' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop A')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '19' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop C')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '20' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop C')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '21' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop D')
GO

--no feature data enterred

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '23' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop D')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '24' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop D')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '25' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop D')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '26' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop D')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '27' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop D')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '28' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop D')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '29' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop D')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '30' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop D')
GO

--Reservable
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '1' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '2' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '3' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '4' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '5' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '6' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '7' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '8' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '9' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '10' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '11' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '12' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '13' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '14' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '15' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '16' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '17' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '18' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '19' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '20' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '21' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '22' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '23' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '24' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '25' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '26' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '27' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '28' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '29' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '30' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 12, '0')
GO


-- ItemsXMaps
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '1' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 57.2790427649777, -121.113281249999, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '2' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 52.160454557747, -132.802734375, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '3' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 43.3890819391174, -126.386718749999, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '4' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 36.1733569352216, -121.640625, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '5' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 31.9521622380249, -131.572265625, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '6' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 19.1451681962052, -120.9375, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '7' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), -1.84538398857318, -126.123046875, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '8' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 5.35352135533732, -112.939453125, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '9' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), -5.7034479821495, -111.005859375, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '10' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 15.7922535703624, -95.009765624, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '11' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 23.0797317624498, -93.1640625, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '12' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 24.1267019586816, -105.1171875, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '13' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 31.3536369415009, -93.4277343749999, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '14' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.3797125804622, -105.556640625, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '15' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 42.6177914328234, -89.12109375, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '16' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 47.5172006978394, -96.767578125, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '17' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 49.8946343957342, -104.765625, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '18' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 42.9403392336318, -109.423828125, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '19' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 18.3128108464254, 20.2148437499999, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '20' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 29.1521612833189, 22.587890625, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '21' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 57.2315029914789, 7.64648437499999, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '22' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 57.9848080192398, -3.955078125, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '23' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 61.1007888315889, 9.66796874999999, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '24' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 65.6582745198266, 10.01953125, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '25' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 70.8446726342528, 7.119140625, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '26' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 77.3895040053973, 38.6718749999999, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '27' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 73.9467911571025, 30.05859375, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '28' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 73.022591571473, 42.71484375, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '29' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 0, 0, 1, 0)
GO
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '30' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 54.8766066541086, 27.6855468749999, 1, 0)
GO


--Images & ItemsXImages

--Site 1
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 1 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '1' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 1 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 2
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 2 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '2' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 2 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 3
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 3 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '3' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 3 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 4
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 4 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '4' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 4 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 5
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 5 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '5' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 5 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 6
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 6 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '6' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 6 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 7
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 7 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '7' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 7 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 8
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 8 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '8' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 8 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 9
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 9 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '9' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 9 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 10
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 10 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '10' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 10 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 11
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 11 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '11' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 11 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 12
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 12 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '12' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 12 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 13
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 13 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '13' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 13 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 14
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 14 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '14' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 14 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 15
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 15 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '15' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 15 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 16
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 16 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '16' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 16 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 17
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 17 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '17' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 17 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 18
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 18 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '18' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 18 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 19
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 19 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '19' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 19 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 20
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 20 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '20' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 20 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 21
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 21 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '21' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 21 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 22
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 22 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '22' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 22 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 23
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 23 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '23' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 23 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 24
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 24 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '24' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 24 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 25
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 25 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '25' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 25 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 26
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 26 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '26' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 26 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 27
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 27 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '27' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 27 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 28
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 28 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '28' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 28 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 29
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 29 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '29' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 29 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 30
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 30 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '30' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 30 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered


--Rates

INSERT INTO Rates (Name, Description, ValidFrom, ValidTo, BaseFee, DailyFee, WeekdayFee, WeekendFee, DepositBaseFee, DepositDailyFee, Active)
VALUES ('Doris Campground - Group A/B 2015', 'Rates for group tent sites A and B - with shelter (2015)', 'Jan 1 2015 12:00:00:000AM', 'Dec 31 2020 11:59:59:999PM', 0.00, 40.00, 0.00, 0.00, 0.00, 20.00, 1)
GO

INSERT INTO Rates (Name, Description, ValidFrom, ValidTo, BaseFee, DailyFee, WeekdayFee, WeekendFee, DepositBaseFee, DepositDailyFee, Active)
VALUES ('Doris Campground - Group C 2015', 'Rates for group tent site C - no shelter (2015)', 'Jan 1 2015 12:00:00:000AM', 'Dec 31 2020 11:59:59:999PM', 0.00, 28.00, 0.00, 0.00, 0.00, 14.00, 1)
GO
INSERT INTO Rates (Name, Description, ValidFrom, ValidTo, BaseFee, DailyFee, WeekdayFee, WeekendFee, DepositBaseFee, DepositDailyFee, Active)
VALUES ('Doris Campground - Single SP 2015', 'Rates for semi-primitive tent sites - no electricity (2015)', 'Jan 1 2015 12:00:00:000AM', 'Dec 31 2020 11:59:59:999PM', 0.00, 8.00, 0.00, 0.00, 0.00, 0.00, 1)
GO

INSERT INTO Rates (Name, Description, ValidFrom, ValidTo, BaseFee, DailyFee, WeekdayFee, WeekendFee, DepositBaseFee, DepositDailyFee, Active)
VALUES ('Doris Campground - Single No Elec 2015', 'Rates for single tent/RV sites - no electricity (2015)', 'Jan 1 2015 12:00:00:000AM', 'Dec 31 2020 11:59:59:999PM', 0.00, 10.00, 0.00, 0.00, 0.00, 0.00, 1)
GO

INSERT INTO Rates (Name, Description, ValidFrom, ValidTo, BaseFee, DailyFee, WeekdayFee, WeekendFee, DepositBaseFee, DepositDailyFee, Active)
VALUES ('Doris Campground - Single Elec 2015', 'Rates for single tent/RV sites - with electricity (2015)', 'Jan 1 2015 12:00:00:000AM', 'Dec 31 2020 11:59:59:999PM', 0.00, 20.00, 0.00, 0.00, 0.00, 0.00, 1)
GO


--ItemsXAvailRates

--Period 1
INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '1' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '2' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '3' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '4' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '5' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '6' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '7' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '8' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '9' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '10' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '11' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '12' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '13' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '14' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '15' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '16' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '17' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '18' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '19' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '20' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '21' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '22' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '23' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '24' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '25' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '26' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '27' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '28' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '29' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '30' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

--Period 2
INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '1' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '2' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '3' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '4' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '5' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '6' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '7' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '8' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '9' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '10' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '11' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '12' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '13' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '14' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '15' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '16' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '17' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '18' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '19' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '20' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '21' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '22' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '23' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '24' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '25' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '26' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '27' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '28' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '29' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '30' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

-- fix coordinates for sites 1-30
UPDATE ItemsXMaps SET
  CoordinateY=34.7175760140187,
  CoordinateX=-98.6473077535629,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '1' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7172938127492,
  CoordinateX=-98.6474901437759,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '2' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7169586974909,
  CoordinateX=-98.6473774909973,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '3' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7167294073211,
  CoordinateX=-98.6472594738006,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '4' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7165221637361,
  CoordinateX=-98.6475759744644,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '5' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7162575967025,
  CoordinateX=-98.6472755670547,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '6' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7157284600961,
  CoordinateX=-98.6476457118988,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '7' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7159048393411,
  CoordinateX=-98.6471736431121,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '8' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.715618222877,
  CoordinateX=-98.6471092700958,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '9' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7163898803251,
  CoordinateX=-98.6464816331863,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '10' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7165927148021,
  CoordinateX=-98.6465138196945,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '11' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7168087770672,
  CoordinateX=-98.6463850736618,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '12' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.71694987865,
  CoordinateX=-98.6469268798828,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '13' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7170512952639,
  CoordinateX=-98.6464601755142,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '14' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7172320810932,
  CoordinateX=-98.6465460062026,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '15' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7173599537582,
  CoordinateX=-98.64679813385,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '16' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7171615305727,
  CoordinateX=-98.6470663547515,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '17' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7171571211631,
  CoordinateX=-98.6470556259155,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '18' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7166897224195,
  CoordinateX=-98.6426997184753,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '19' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7168793278887,
  CoordinateX=-98.6426192522048,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '20' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.717902308036,
  CoordinateX=-98.643000125885,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '21' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7180566358389,
  CoordinateX=-98.6434239149093,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '22' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7180919107248,
  CoordinateX=-98.6428874731063,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '23' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7183211971166,
  CoordinateX=-98.6429142951965,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '24' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7187400840753,
  CoordinateX=-98.6429786682128,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '25' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7193088850746,
  CoordinateX=-98.6424475908279,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '26' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7188679544083,
  CoordinateX=-98.6425656080245,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '27' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7187709493462,
  CoordinateX=-98.6421686410903,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '28' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7185152081823,
  CoordinateX=-98.6426997184753,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '29' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO

UPDATE ItemsXMaps SET
  CoordinateY=34.7179155361446,
  CoordinateX=-98.6425548791885,
  DisplayOrder=1,
  LatLongFlag=1
WHERE ItemID=(SELECT ItemID FROM Items WHERE Name = '30' AND LocationName = 'Doris Campground') AND MapID=(SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map')
GO


------------------------------------------------------------
-- Recreation Sites (Items)
--
-- Set 2 (sites 31-60)
------------------------------------------------------------

--Items (Sites)
INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('31', 'Camping site 31', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('32', 'Camping site 32', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('33', 'Camping site 33', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('34', 'Camping site 34', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('35', 'Camping site 35', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('36', 'Camping site 36', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('37', 'Camping site 37', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('38', 'Camping site 38', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('39', 'Camping site 39', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('40', 'Camping site 40', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('41', 'Camping site 41', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('42', 'Camping site 42', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('43', 'Camping site 43', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('44', 'Camping site 44', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('45', 'Camping site 45', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('46', 'Camping site 46', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('47', 'Camping site 47', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('48', 'Camping site 48', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('49', 'Camping site 49', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('50', 'Camping site 50', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('51', 'Camping site 51', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('52', 'Camping site 52', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('53', 'Camping site 53', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('54', 'Camping site 54', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('55', 'Camping site 55', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('56', 'Camping site 56', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('57', 'Camping site 57', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('58', 'Camping site 58', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('59', 'Camping site 59', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('60', 'Camping site 60', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

--ItemsXItems
INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '31' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '32' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '33' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '34' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '35' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '36' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '37' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '38' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '39' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '40' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '41' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '42' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '43' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '44' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '45' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '46' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '47' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '48' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '49' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '50' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '51' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '52' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '53' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '54' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '55' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '56' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '57' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '58' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '59' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '60' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

--ItemsXFeatures

--Site Type
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '31' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '32' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '33' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '34' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '35' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '36' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '37' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '38' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '39' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '40' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '41' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '42' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '43' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '44' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '45' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '46' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '47' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '48' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '49' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '50' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '51' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '52' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '53' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '54' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '55' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '56' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '57' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '58' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '59' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '60' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

--Reservable
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '31' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '32' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '33' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '34' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '35' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '36' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '37' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '38' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '39' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '40' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '41' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '42' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '43' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '44' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '45' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '46' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '47' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '48' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '49' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '50' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '51' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '52' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '53' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '54' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '55' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '56' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '57' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '58' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '59' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '60' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

--Max Occupants
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '31' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '32' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '33' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '34' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '35' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '36' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '37' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '38' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '39' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '40' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '41' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '42' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '43' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '44' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '45' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '46' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '47' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '48' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '49' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '50' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '51' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '52' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '53' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '54' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '55' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '56' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '57' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '58' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '59' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '60' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

--Pets Allowed
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '31' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '32' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '33' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '34' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '35' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '36' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '37' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '38' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '39' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '40' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '41' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '42' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '43' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '44' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '45' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '46' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '47' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '48' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '49' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '50' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '51' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '52' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '53' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '54' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '55' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '56' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '57' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '58' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '59' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '60' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

--Table
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '31' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '32' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '33' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '34' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '35' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '36' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '37' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '38' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '39' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '40' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '41' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '42' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '43' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '44' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '45' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '46' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '47' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '48' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '49' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '50' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '51' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '52' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '53' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '54' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '55' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '56' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '57' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '58' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '59' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '60' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

--Fire Ring/Grate
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '31' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '32' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '33' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '34' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '35' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '36' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '37' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '38' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '39' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '40' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '41' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '42' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '43' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '44' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '45' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '46' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '47' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '48' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '49' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '50' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '51' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '52' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '53' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '54' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '55' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '56' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '57' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '58' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '59' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '60' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

--Handicap Accessible
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '31' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '32' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '33' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '34' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '35' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '36' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '37' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '38' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '39' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '40' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '41' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '42' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '43' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '44' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '45' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '46' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '47' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '48' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '49' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '50' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '51' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '52' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '53' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '54' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '55' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '56' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '57' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '58' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '59' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '60' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

--Electricity
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '31' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '32' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '33' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '34' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '35' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '36' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '37' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '38' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '39' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '40' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '41' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '42' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '43' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '44' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '45' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '46' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '47' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '48' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '49' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '50' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '51' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '52' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '53' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '54' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '55' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '56' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '57' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '58' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '59' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '60' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

--Parking Capacity
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '31' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '32' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '33' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '34' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '35' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '36' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '37' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '38' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '39' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '40' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '41' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '42' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '43' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '44' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '45' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '46' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '47' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '48' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '49' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '50' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '51' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '52' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '53' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '54' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '55' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '56' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '57' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '58' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '59' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '60' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

--Section
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '34' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop C')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '35' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop C')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '36' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop C')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '37' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop C')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '38' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop C')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '39' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop C')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '40' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop C')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '41' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop C')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '42' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop C')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '43' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop B')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '44' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop B')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '45' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop B')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '46' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop B')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '47' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop B')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '48' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop B')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '49' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop B')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '50' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop B')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '51' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop B')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '52' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop B')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '53' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop E')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '54' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop E')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '55' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop E')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '56' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop E')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '57' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop E')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '58' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop E')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '59' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop E')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '60' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop E')
GO

--ItemsXMaps
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '31' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7177435705668, -98.6418145895004, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '32' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7180081328461, -98.6415141820907, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '33' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7180301796645, -98.6421418190002, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '34' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7172144434687, -98.6427158117294, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '35' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7176068797241, -98.6420291662216, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '36' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7174084571311, -98.6419594287872, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '37' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7173599537582, -98.6423403024673, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '38' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7169895634267, -98.6424690485, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '39' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7171394835226, -98.6420077085494, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '40' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7166632658079, -98.6421900987625, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '41' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7163766519724, -98.6425387859344, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '42' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7163016912669, -98.6422330141067, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '43' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.715966571988, -98.6422973871231, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '44' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.715702003177, -98.6423081159591, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '45' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7155873564293, -98.6427426338195, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '46' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7153889289905, -98.6429089307784, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '47' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7153977479979, -98.6423081159591, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '48' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7153624719627, -98.6431610584259, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '49' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7152566437667, -98.6434239149093, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '50' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7150317584008, -98.6432951688766, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '51' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7150758536188, -98.6437082290649, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '52' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7156843652261, -98.6433434486389, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '53' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7174657792624, -98.645167350769, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '54' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7173731819536, -98.6455589532852, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '55' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7176024703383, -98.6454409360885, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '56' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7175319201338, -98.6459076404571, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '57' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.717747979945, -98.6457788944244, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '58' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7176774298647, -98.6463099718093, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '59' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7179155361446, -98.6461704969406, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '60' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7182109633538, -98.6462080478668, 1, 1)
GO

--Images & ItemsXImages

--Site 31
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 31 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '31' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 31 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 32
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 32 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '32' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 32 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 33
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 33 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '33' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 33 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 34
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 34 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '34' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 34 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 35
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 35 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '35' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 35 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 36
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 36 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '36' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 36 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 37
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 37 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '37' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 37 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 38
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 38 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '38' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 38 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 39
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 39 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '39' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 39 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 40
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 40 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '40' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 40 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 41
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 41 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '41' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 41 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 42
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 42 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '42' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 42 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 43
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 43 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '43' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 43 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 44
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 44 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '44' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 44 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 45
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 45 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '45' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 45 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 46
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 46 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '46' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 46 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 47
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 47 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '47' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 47 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 48
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 48 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '48' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 48 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 49
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 49 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '49' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 49 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 50
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 50 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '50' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 50 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 51
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 51 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '51' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 51 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 52
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 52 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '52' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 52 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 53
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 53 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '53' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 53 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 54
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 54 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '54' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 54 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 55
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 55 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '55' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 55 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 56
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 56 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '56' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 56 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 57
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 57 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '57' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 57 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 58
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 58 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '58' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 58 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 59
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 59 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '59' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 59 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 60
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 60 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '60' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 60 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered


--ItemsXAvailRates

--Period 1
INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '31' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '32' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '33' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '34' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '35' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '36' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '37' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '38' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '39' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '40' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '41' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '42' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '43' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '44' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '45' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '46' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '47' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '48' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '49' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '50' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '51' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '52' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '53' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '54' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '55' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '56' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '57' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '58' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '59' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '60' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 1)
GO

--Period 2
INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '31' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '32' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '33' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '34' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '35' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '36' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '37' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '38' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '39' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '40' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '41' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '42' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '43' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '44' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '45' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '46' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '47' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '48' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '49' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '50' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '51' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '52' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '53' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '54' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '55' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '56' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '57' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '58' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '59' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '60' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 2)
GO



------------------------------------------------------------
-- Recreation Sites (Items)
--
-- Set 3 (sites 61-90)
------------------------------------------------------------

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('61', 'Camping site 61', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('62', 'Camping site 62', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('63', 'Camping site 63', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('64', 'Camping site 64', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('65', 'Camping site 65', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('66', 'Camping site 66', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('67', 'Camping site 67', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('68', 'Camping site 68', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('69', 'Camping site 69', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('70', 'Camping site 70', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('SP1', 'Semi-primitive camping site 1', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('SP2', 'Semi-primitive camping site 2', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('SP3', 'Semi-primitive camping site 3', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('SP4', 'Semi-primitive camping site 4', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('SP5', 'Semi-primitive camping site 5', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('SP6', 'Semi-primitive camping site 6', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('SP7', 'Semi-primitive camping site 7', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('SP8', 'Semi-primitive camping site 8', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('SP9', 'Semi-primitive camping site 9', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('SP10', 'Semi-primitive camping site 10', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('SP11', 'Semi-primitive camping site 11', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('SP12', 'Semi-primitive camping site 12', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('SP13', 'Semi-primitive camping site 13', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('SP14', 'Semi-primitive camping site 14', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('SP15', 'Semi-primitive camping site 15', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('SP16', 'Semi-primitive camping site 16', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('SP17', 'Semi-primitive camping site 17', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('SP18', 'Semi-primitive camping site 18', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('SP19', 'Semi-primitive camping site 19', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('SP20', 'Semi-primitive camping site 20', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

--ItemsXItems
INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '61' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '62' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '63' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '64' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '65' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '66' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '67' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '68' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '69' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = '70' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP1' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP2' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP3' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP4' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP5' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP6' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP7' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP8' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP9' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP10' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP11' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP12' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP13' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP14' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP15' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP16' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP17' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP18' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP19' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP20' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

--ItemsXFeatures


--Site Type
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '61' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '62' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '63' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '64' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '65' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '66' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '67' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '68' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '69' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '70' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '3')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP1' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP2' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP3' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP4' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP5' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP6' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP7' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP8' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP9' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP10' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP11' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP12' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP13' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP14' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP15' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP16' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP17' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP18' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP19' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP20' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '1')
GO

--Reservable
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '61' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '62' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '63' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '64' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '65' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '66' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '67' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '68' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '69' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '70' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP1' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP2' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP3' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP4' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP5' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP6' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP7' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP8' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP9' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP10' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP11' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP12' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP13' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP14' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP15' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP16' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP17' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP18' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP19' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP20' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '0')
GO

--Max Occupants
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '61' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '62' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '63' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '64' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '65' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '66' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '67' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '68' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '69' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '70' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP1' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP2' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP3' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP4' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP5' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP6' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP7' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP8' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP9' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP10' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP11' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP12' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP13' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP14' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP15' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP16' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP17' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP18' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP19' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP20' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '8')
GO

--Pets Allowed
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '61' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '62' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '63' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '64' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '65' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '66' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '67' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '68' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '69' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '70' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP1' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP2' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP3' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP4' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP5' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP6' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP7' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP8' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP9' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP10' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP11' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP12' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP13' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP14' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP15' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP16' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP17' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP18' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP19' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP20' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

--Table
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '61' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '62' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '63' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '64' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '65' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '66' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '67' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '68' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '69' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '70' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP1' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP2' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP3' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP4' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP5' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP6' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP7' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP8' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP9' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP10' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP11' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP12' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP13' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP14' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP15' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP16' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP17' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP18' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP19' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP20' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

--Fire Ring/Grate
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '61' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '62' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '63' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '64' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '65' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '66' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '67' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '68' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '69' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '70' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP1' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP2' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP3' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP4' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP5' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP6' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP7' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP8' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP9' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP10' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP11' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP12' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP13' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP14' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP15' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP16' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP17' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP18' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP19' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP20' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

--Handicap Accessible
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '61' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '62' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '63' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '64' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '65' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '66' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '67' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '68' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '69' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '70' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP1' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP2' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP3' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP4' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP5' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP6' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP7' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP8' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP9' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP10' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP11' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP12' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP13' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP14' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP15' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP16' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP17' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP18' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP19' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP20' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

--Electricity
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '61' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '62' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '63' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '64' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '65' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '66' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '67' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '68' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '69' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '70' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP1' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP2' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP3' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP4' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP5' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP6' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP7' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP8' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP9' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP10' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP11' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP12' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP13' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP14' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP15' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP16' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP17' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP18' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP19' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP20' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

--Parking Capacity
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '61' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '62' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '63' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '64' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '65' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '66' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '67' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '68' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '69' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '70' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP1' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP2' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP3' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP4' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP5' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP6' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP7' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP8' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP9' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP10' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP11' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP12' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP13' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP14' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP15' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP16' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP17' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP18' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP19' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP20' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '2')
GO

--Section
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '61' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop E')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '62' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop E')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '63' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop E')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '64' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop E')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '65' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop E')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = '66' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop E')
GO


--ItemsXMaps
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '61' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7181889165836, -98.6459076404571, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '62' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7181183668794, -98.6455482244491, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '63' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7184093840211, -98.6453551054, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '64' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7178890799252, -98.6450493335723, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '65' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7175363295234, -98.6444807052612, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '66' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7174613698691, -98.6441105604171, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '67' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7176730204826, -98.643906712532, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '68' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7182594662275, -98.6441373825073, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '69' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7182947410269, -98.6436975002288, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = '70' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7187356747499, -98.6437404155731, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP1' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7162928723559, -98.6448454856872, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP2' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7162399588702, -98.6443841457366, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP3' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7160723992754, -98.6445879936218, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP4' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.716050351935, -98.6443895101547, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP5' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7159533435675, -98.6444807052612, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP6' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7157549170069, -98.6444163322448, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP7' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.715719641124, -98.6447596549987, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP8' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7160106667076, -98.644807934761, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP9' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7166323997502, -98.6452478170394, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP10' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7165221637361, -98.6451244354247, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP11' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7164868881805, -98.645349740982, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP12' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7163237385403, -98.6454570293426, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP13' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7160856276768, -98.6453819274902, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP14' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7162664156173, -98.6452531814575, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP15' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7158783824784, -98.6454516649246, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP16' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7159842098786, -98.6451244354247, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP17' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7156226323686, -98.6456555128097, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP18' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.715776964426, -98.6458218097686, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP19' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7160283045888, -98.6459934711456, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP20' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7159533435675, -98.6463689804077, 1, 1)
GO

--Images & ItemsXImages

--Site 61
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 61 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '61' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 61 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 62
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 62 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '62' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 62 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 63
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 63 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '63' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 63 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 64
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 64 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '64' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 64 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 65
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 65 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '65' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 65 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 66
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 66 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '66' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 66 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 67
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 67 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '67' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 67 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 68
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 68 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '68' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 68 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 69
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 69 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '69' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 69 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site 70
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site 70 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '70' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site 70 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site SP1
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site SP1 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP1' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site SP1 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site SP2
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site SP2 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP2' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site SP2 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site SP3
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site SP3 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP3' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site SP3 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site SP4
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site SP4 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP4' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site SP4 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site SP5
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site SP5 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP5' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site SP5 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site SP6
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site SP6 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP6' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site SP6 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site SP7
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site SP7 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP7' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site SP7 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site SP8
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site SP8 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP8' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site SP8 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site SP9
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site SP9 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP9' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site SP9 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site SP10
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site SP10 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP10' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site SP10 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site SP11
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site SP11 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP11' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site SP11 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site SP12
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site SP12 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP12' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site SP12 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site SP13
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site SP13 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP13' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site SP13 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site SP14
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site SP14 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP14' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site SP14 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site SP15
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site SP15 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP15' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site SP15 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site SP16
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site SP16 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP16' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site SP16 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site SP17
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site SP17 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP17' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site SP17 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site SP18
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site SP18 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP18' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site SP18 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site SP19
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site SP19 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP19' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site SP19 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site SP20
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site SP20 - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP20' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site SP20 - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered


--ItemsXAvailRates

--Period 1
INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '61' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '62' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '63' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '64' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '65' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '66' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '67' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '68' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '69' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '70' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP1' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP2' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP3' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP4' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP5' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP6' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP7' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP8' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP9' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP10' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP11' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP12' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP13' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP14' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP15' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP16' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP17' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP18' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP19' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP20' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 1)
GO

--Period 2
INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '61' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '62' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '63' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '64' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '65' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '66' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '67' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '68' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '69' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = '70' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single No Elec 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP1' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP2' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP3' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP4' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP5' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP6' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP7' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP8' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP9' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP10' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP11' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP12' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP13' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP14' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP15' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP16' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP17' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP18' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP19' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'SP20' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Single SP 2015'), 8, 2)
GO



------------------------------------------------------------
-- Recreation Sites (Items)
--
-- Set 4 (sites A, B, C)
------------------------------------------------------------

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('A', 'Group camping site A', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('B', 'Group camping site B', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

INSERT INTO Items (Name, Description, GroupID, ItemTypeID, AgeMin, AgeMax, AgeAsOfDate, StartDate, EndDate, CancellationDate, EntryOpenDate, EntryCloseDate, EntryFee, RegistrationFee, RegistrationPercentage, RegistrationFeeClientCharge, EarlyRegistrationCloseDate, EarlyRegistrationEntryFee, EarlyRegistrationRegistrationFee, EarlyRegistrationRegistrationFeeClientCharge, LateFeeDate, LateFee, LateFeeRegistrationFee, LateFeeRegistrationFeeClientCharge, EarlyDiscountScript, RegularDiscountScript, DiscountAmount, MaxEntries, MaxEntriesPerItem, WaitingListNumber, MaxWaitingListEntries, AllowCustomQuantity, KinsailFeesIncluded, HasReservations, ReservationsRequired, RegistrantSign, IncludeInClientAccounting, IncludeInRegistrantAccounting, IncludeInResultsPage, IncludeInCalendar, UseItemDetailsBox, ShowCurrentEntries, ShowItemDate, UseExpandableDescriptionOnResults, Active, OutputColumns, RegistrationNotOpenText, RegistrationNotOpenTextEvaluationMethod, RegistrationClosedText, RegistrationClosedTextEvaluationMethod, WaitListText, WaitListTextEvaluationMethod, WaitListPopUpText, WaitListPopUpTextEvaluationMethod, ClientIdentificationCode, DescriptionEvaluationMethod, RegistrationName, RegistrationNameEvaluationMethod, LocationName, QuestionSetupSource, QuestionSetupSourceName, EntrySelectTypeID, ResultsPageDisplayOrder, DirectorsDisplayOrder, DirectorsRowsPerPage, DefaultDirectorsFields, DefaultDirectorsSortColumn, DefaultDirectorsSortDirection, DetailsSimpleColumnList, UseCustomSPOnDetailsSimple, Audit_ContactID, Version_Number)
VALUES ('C', 'Group camping site C', (SELECT GroupID FROM Groups WHERE Name = 'Doris Campground Reservations'), (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), 0, 0, 'Jan 1 2015 12:00:00:000AM', 'Jan 1 2014 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Jan 1 1900 12:00:00:000AM', 'Dec 31 2015 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, 'Jan 1 1900 12:00:00:000AM', 0.00000, 0.00000, 0.00000, '', '', 0.00000, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 'Reservations', 'Online Reservations Not Open', '', 'Online Reservations Closed', '', 'Waiting List Only', '', 'Please note that this site is only accepting waiting list reservations', '', 'WMWR', '', 'Reservation', '', 'Doris Campground', 0, '', 408, 0, 0, 0, '', '', '', '', 0, NULL, 1)
GO

--ItemsXItems
INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

INSERT INTO ItemsXItems (ItemID, ParentItemID, RelationDesc)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Doris Campground'), (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), 'Site within Location')
GO

--ItemsXFeatures

--Site Type
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '10')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '10')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Site Type'), 1, '10')
GO

--Reservable
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Reservable'), 2, '1')
GO

--Max Occupants
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '30')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '30')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Max Occupants'), 3, '30')
GO

--Pets Allowed
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Pets Allowed'), 4, '1')
GO

--Table
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Table'), 5, '1')
GO

--Fire Ring/Grate
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Fire Ring/Grate'), 6, '1')
GO

--Handicap Accessible
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Handicap Accessible'), 7, '0')
GO

--Electricity
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Electricity'), 8, '0')
GO

--Shelter
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Shelter'), 9, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Shelter'), 9, '1')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Shelter'), 9, '0')
GO

--Parking Capacity
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '8')
GO

INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Parking Capacity'), 10, '8')
GO

--Section
INSERT INTO ItemsXFeatures (ItemID, FeatureID, DisplayOrder, Value)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Doris Campground'), (SELECT FeatureID FROM Features WHERE Name = 'Section'), 11, 'Loop D')
GO


--ItemsXMaps
INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7186254415396, -98.6469107866287, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7184446587565, -98.6463475227355, 1, 1)
GO

INSERT INTO ItemsXMaps (ItemID, MapID, CoordinateY, CoordinateX, DisplayOrder, LatLongFlag)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Doris Campground'), (SELECT MapID FROM Maps WHERE Name = 'Doris Campground Map'), 34.7194720288252, -98.6432093381881, 1, 1)
GO

--Images & ItemsXImages

--Site A
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site A - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site A - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site B
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site B - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site B - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered

--Site C
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, '/images/icons/location/photo01.jpg', '/images/location/photo01.jpg', 'Site C - photo01.jpg', '', 1)
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Doris Campground'), (SELECT ImageID FROM Images WHERE ImageTypeID = 1 AND IconURL = '/images/icons/location/photo01.jpg' AND FullURL = '/images/location/photo01.jpg' AND Caption = 'Site C - photo01.jpg' AND Source = ''), 1)
GO
--no #2 image data entered
--no #3 image data entered
--no #4 image data entered
--no #5 image data entered


--ItemsXAvailRates

--Period 1
INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Group A/B 2015'), 30, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Group A/B 2015'), 30, 1)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 1'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Group C 2015'), 30, 1)
GO

--Period 2
INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'A' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Group A/B 2015'), 30, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'B' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Group A/B 2015'), 30, 2)
GO

INSERT INTO ItemsXAvailRates (ItemID, AvailID, RateID, MaxUnits, DisplayOrder)
VALUES ((SELECT ItemID FROM Items WHERE Name = 'C' AND LocationName = 'Doris Campground'), (SELECT AvailID FROM Availability WHERE Name = 'Doris Campground Availability - Period 2'), (SELECT RateID FROM Rates WHERE Name = 'Doris Campground - Group C 2015'), 30, 2)
GO



------------------------------------------------------------
-- Fixes
------------------------------------------------------------

-- Fix images for Doris Location
DELETE ItemsXImages
  FROM ItemsXImages ixi
 WHERE ixi.ItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')
GO

DELETE Images
  FROM Images i
 WHERE i.IconURL = '/images/icons/location/photo01.jpg'
   AND i.FullURL = '/images/location/photo01.jpg'
   AND i.Caption = ''
GO
DELETE Images
  FROM Images i
 WHERE i.IconURL = '/images/icons/location/photo02.jpg'
   AND i.FullURL = '/images/location/photo02.jpg'
   AND i.Caption = ''
GO
DELETE Images
  FROM Images i
 WHERE i.IconURL = '/images/icons/location/photo03.jpg'
   AND i.FullURL = '/images/location/photo03.jpg'
   AND i.Caption = ''
GO

INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'scenic_29.jpg', 'scenic_29.jpg', 'Doris - scenic_29.jpg', '', 1)
GO
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'scenic_30.jpg', 'scenic_30.jpg', 'Doris - scenic_30.jpg', '', 1)
GO
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'scenic_31.jpg', 'scenic_31.jpg', 'Doris - scenic_31.jpg', '', 1)
GO
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'scenic_32.jpg', 'scenic_32.jpg', 'Doris - scenic_32.jpg', '', 1)
GO
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'scenic_33.jpg', 'scenic_33.jpg', 'Doris - scenic_33.jpg', '', 1)
GO
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'scenic_34.jpg', 'scenic_34.jpg', 'Doris - scenic_34.jpg', '', 1)
GO

INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'scenic_29.jpg' AND FullURL = 'scenic_29.jpg' AND Caption = 'Doris - scenic_29.jpg'), -- ImageID - bigint
         0  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'scenic_30.jpg' AND FullURL = 'scenic_30.jpg' AND Caption = 'Doris - scenic_30.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'scenic_31.jpg' AND FullURL = 'scenic_31.jpg' AND Caption = 'Doris - scenic_31.jpg'), -- ImageID - bigint
         2  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'scenic_32.jpg' AND FullURL = 'scenic_32.jpg' AND Caption = 'Doris - scenic_32.jpg'), -- ImageID - bigint
         3  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'scenic_33.jpg' AND FullURL = 'scenic_33.jpg' AND Caption = 'Doris - scenic_33.jpg'), -- ImageID - bigint
         4  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT ItemID FROM Items WHERE Name = 'Doris Campground'), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'scenic_34.jpg' AND FullURL = 'scenic_34.jpg' AND Caption = 'Doris - scenic_34.jpg'), -- ImageID - bigint
         5  -- DisplayOrder - int
         )
GO


-- Fix images for Doris sites
DELETE ItemsXImages
  FROM ItemsXImages ixi
 WHERE ixi.ItemID IN (SELECT i2.ItemID 
                        FROM Items i2
                        JOIN ItemsXItems ixi2 ON i2.ItemID = ixi2.ItemID
                       WHERE ixi2.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground'))
GO
DELETE Images
  FROM Images i
 WHERE ImageID NOT IN (SELECT DISTINCT ImageID FROM ItemsXImages)
   AND Caption LIKE 'Site%photo01.jpg'
GO

INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'site_photo_01.jpg', 'site_photo_01.jpg', 'Doris - site_photo_01.jpg', '', 1)
GO
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'site_photo_02.jpg', 'site_photo_02.jpg', 'Doris - site_photo_02.jpg', '', 1)
GO
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'site_photo_03.jpg', 'site_photo_03.jpg', 'Doris - site_photo_03.jpg', '', 1)
GO
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'site_photo_10.jpg', 'site_photo_10.jpg', 'Doris - site_photo_10.jpg', '', 1)
GO
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'site_photo_11.jpg', 'site_photo_11.jpg', 'Doris - site_photo_11.jpg', '', 1)
GO
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'site_photo_12.jpg', 'site_photo_12.jpg', 'Doris - site_photo_12.jpg', '', 1)
GO
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'site_photo_13.jpg', 'site_photo_13.jpg', 'Doris - site_photo_13.jpg', '', 1)
GO
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'site_photo_14.jpg', 'site_photo_14.jpg', 'Doris - site_photo_14.jpg', '', 1)
GO
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'site_photo_15.jpg', 'site_photo_15.jpg', 'Doris - site_photo_15.jpg', '', 1)
GO
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'site_photo_16.jpg', 'site_photo_16.jpg', 'Doris - site_photo_16.jpg', '', 1)
GO
INSERT INTO Images (ImageTypeID, IconURL, FullURL, Caption, Source, Active)
VALUES (1, 'site_photo_17.jpg', 'site_photo_17.jpg', 'Doris - site_photo_17.jpg', '', 1)
GO

INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'A' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_01.jpg' AND FullURL = 'site_photo_01.jpg' AND Caption = 'Doris - site_photo_01.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'A' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_02.jpg' AND FullURL = 'site_photo_02.jpg' AND Caption = 'Doris - site_photo_02.jpg'), -- ImageID - bigint
         2  -- DisplayOrder - int
         )
GO

INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'B' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_03.jpg' AND FullURL = 'site_photo_03.jpg' AND Caption = 'Doris - site_photo_03.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO

INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'C' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_10.jpg' AND FullURL = 'site_photo_10.jpg' AND Caption = 'Doris - site_photo_10.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'C' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_11.jpg' AND FullURL = 'site_photo_11.jpg' AND Caption = 'Doris - site_photo_11.jpg'), -- ImageID - bigint
         2  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'C' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_12.jpg' AND FullURL = 'site_photo_12.jpg' AND Caption = 'Doris - site_photo_12.jpg'), -- ImageID - bigint
         3  -- DisplayOrder - int
         )
GO

  -- Sites
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '1' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_13.jpg' AND FullURL = 'site_photo_13.jpg' AND Caption = 'Doris - site_photo_13.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '2' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_14.jpg' AND FullURL = 'site_photo_14.jpg' AND Caption = 'Doris - site_photo_14.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '3' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_15.jpg' AND FullURL = 'site_photo_15.jpg' AND Caption = 'Doris - site_photo_15.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '4' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_16.jpg' AND FullURL = 'site_photo_16.jpg' AND Caption = 'Doris - site_photo_16.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '5' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_17.jpg' AND FullURL = 'site_photo_17.jpg' AND Caption = 'Doris - site_photo_17.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '6' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_13.jpg' AND FullURL = 'site_photo_13.jpg' AND Caption = 'Doris - site_photo_13.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '7' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_14.jpg' AND FullURL = 'site_photo_14.jpg' AND Caption = 'Doris - site_photo_14.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '8' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_15.jpg' AND FullURL = 'site_photo_15.jpg' AND Caption = 'Doris - site_photo_15.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '9' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_16.jpg' AND FullURL = 'site_photo_16.jpg' AND Caption = 'Doris - site_photo_16.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '10' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_17.jpg' AND FullURL = 'site_photo_17.jpg' AND Caption = 'Doris - site_photo_17.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '11' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_13.jpg' AND FullURL = 'site_photo_13.jpg' AND Caption = 'Doris - site_photo_13.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '12' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_14.jpg' AND FullURL = 'site_photo_14.jpg' AND Caption = 'Doris - site_photo_14.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '13' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_15.jpg' AND FullURL = 'site_photo_15.jpg' AND Caption = 'Doris - site_photo_15.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '14' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_16.jpg' AND FullURL = 'site_photo_16.jpg' AND Caption = 'Doris - site_photo_16.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '15' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_17.jpg' AND FullURL = 'site_photo_17.jpg' AND Caption = 'Doris - site_photo_17.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '16' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_13.jpg' AND FullURL = 'site_photo_13.jpg' AND Caption = 'Doris - site_photo_13.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '17' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_14.jpg' AND FullURL = 'site_photo_14.jpg' AND Caption = 'Doris - site_photo_14.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '18' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_15.jpg' AND FullURL = 'site_photo_15.jpg' AND Caption = 'Doris - site_photo_15.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '19' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_16.jpg' AND FullURL = 'site_photo_16.jpg' AND Caption = 'Doris - site_photo_16.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '20' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_17.jpg' AND FullURL = 'site_photo_17.jpg' AND Caption = 'Doris - site_photo_17.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '21' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_13.jpg' AND FullURL = 'site_photo_13.jpg' AND Caption = 'Doris - site_photo_13.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '22' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_14.jpg' AND FullURL = 'site_photo_14.jpg' AND Caption = 'Doris - site_photo_14.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '23' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_15.jpg' AND FullURL = 'site_photo_15.jpg' AND Caption = 'Doris - site_photo_15.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '24' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_16.jpg' AND FullURL = 'site_photo_16.jpg' AND Caption = 'Doris - site_photo_16.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '25' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_17.jpg' AND FullURL = 'site_photo_17.jpg' AND Caption = 'Doris - site_photo_17.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '26' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_13.jpg' AND FullURL = 'site_photo_13.jpg' AND Caption = 'Doris - site_photo_13.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '27' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_14.jpg' AND FullURL = 'site_photo_14.jpg' AND Caption = 'Doris - site_photo_14.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '28' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_15.jpg' AND FullURL = 'site_photo_15.jpg' AND Caption = 'Doris - site_photo_15.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '29' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_16.jpg' AND FullURL = 'site_photo_16.jpg' AND Caption = 'Doris - site_photo_16.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '30' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_17.jpg' AND FullURL = 'site_photo_17.jpg' AND Caption = 'Doris - site_photo_17.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '31' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_13.jpg' AND FullURL = 'site_photo_13.jpg' AND Caption = 'Doris - site_photo_13.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '32' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_14.jpg' AND FullURL = 'site_photo_14.jpg' AND Caption = 'Doris - site_photo_14.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '33' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_15.jpg' AND FullURL = 'site_photo_15.jpg' AND Caption = 'Doris - site_photo_15.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '34' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_16.jpg' AND FullURL = 'site_photo_16.jpg' AND Caption = 'Doris - site_photo_16.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '35' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_17.jpg' AND FullURL = 'site_photo_17.jpg' AND Caption = 'Doris - site_photo_17.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '36' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_13.jpg' AND FullURL = 'site_photo_13.jpg' AND Caption = 'Doris - site_photo_13.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '37' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_14.jpg' AND FullURL = 'site_photo_14.jpg' AND Caption = 'Doris - site_photo_14.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '38' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_15.jpg' AND FullURL = 'site_photo_15.jpg' AND Caption = 'Doris - site_photo_15.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '39' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_16.jpg' AND FullURL = 'site_photo_16.jpg' AND Caption = 'Doris - site_photo_16.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '40' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_17.jpg' AND FullURL = 'site_photo_17.jpg' AND Caption = 'Doris - site_photo_17.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '41' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_13.jpg' AND FullURL = 'site_photo_13.jpg' AND Caption = 'Doris - site_photo_13.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '42' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_14.jpg' AND FullURL = 'site_photo_14.jpg' AND Caption = 'Doris - site_photo_14.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '43' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_15.jpg' AND FullURL = 'site_photo_15.jpg' AND Caption = 'Doris - site_photo_15.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '44' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_16.jpg' AND FullURL = 'site_photo_16.jpg' AND Caption = 'Doris - site_photo_16.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '45' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_17.jpg' AND FullURL = 'site_photo_17.jpg' AND Caption = 'Doris - site_photo_17.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '46' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_13.jpg' AND FullURL = 'site_photo_13.jpg' AND Caption = 'Doris - site_photo_13.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '47' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_14.jpg' AND FullURL = 'site_photo_14.jpg' AND Caption = 'Doris - site_photo_14.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '48' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_15.jpg' AND FullURL = 'site_photo_15.jpg' AND Caption = 'Doris - site_photo_15.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '49' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_16.jpg' AND FullURL = 'site_photo_16.jpg' AND Caption = 'Doris - site_photo_16.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '50' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_17.jpg' AND FullURL = 'site_photo_17.jpg' AND Caption = 'Doris - site_photo_17.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '51' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_13.jpg' AND FullURL = 'site_photo_13.jpg' AND Caption = 'Doris - site_photo_13.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '52' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_14.jpg' AND FullURL = 'site_photo_14.jpg' AND Caption = 'Doris - site_photo_14.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '53' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_15.jpg' AND FullURL = 'site_photo_15.jpg' AND Caption = 'Doris - site_photo_15.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '54' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_16.jpg' AND FullURL = 'site_photo_16.jpg' AND Caption = 'Doris - site_photo_16.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '55' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_17.jpg' AND FullURL = 'site_photo_17.jpg' AND Caption = 'Doris - site_photo_17.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '56' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_13.jpg' AND FullURL = 'site_photo_13.jpg' AND Caption = 'Doris - site_photo_13.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '57' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_14.jpg' AND FullURL = 'site_photo_14.jpg' AND Caption = 'Doris - site_photo_14.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '58' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_15.jpg' AND FullURL = 'site_photo_15.jpg' AND Caption = 'Doris - site_photo_15.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '59' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_16.jpg' AND FullURL = 'site_photo_16.jpg' AND Caption = 'Doris - site_photo_16.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '60' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_17.jpg' AND FullURL = 'site_photo_17.jpg' AND Caption = 'Doris - site_photo_17.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '61' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_13.jpg' AND FullURL = 'site_photo_13.jpg' AND Caption = 'Doris - site_photo_13.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '62' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_14.jpg' AND FullURL = 'site_photo_14.jpg' AND Caption = 'Doris - site_photo_14.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '63' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_15.jpg' AND FullURL = 'site_photo_15.jpg' AND Caption = 'Doris - site_photo_15.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '64' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_16.jpg' AND FullURL = 'site_photo_16.jpg' AND Caption = 'Doris - site_photo_16.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '65' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_17.jpg' AND FullURL = 'site_photo_17.jpg' AND Caption = 'Doris - site_photo_17.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '66' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_13.jpg' AND FullURL = 'site_photo_13.jpg' AND Caption = 'Doris - site_photo_13.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '67' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_14.jpg' AND FullURL = 'site_photo_14.jpg' AND Caption = 'Doris - site_photo_14.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '68' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_15.jpg' AND FullURL = 'site_photo_15.jpg' AND Caption = 'Doris - site_photo_15.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '69' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_16.jpg' AND FullURL = 'site_photo_16.jpg' AND Caption = 'Doris - site_photo_16.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = '70' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_17.jpg' AND FullURL = 'site_photo_17.jpg' AND Caption = 'Doris - site_photo_17.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'SP1' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_13.jpg' AND FullURL = 'site_photo_13.jpg' AND Caption = 'Doris - site_photo_13.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'SP2' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_14.jpg' AND FullURL = 'site_photo_14.jpg' AND Caption = 'Doris - site_photo_14.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'SP3' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_15.jpg' AND FullURL = 'site_photo_15.jpg' AND Caption = 'Doris - site_photo_15.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'SP4' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_16.jpg' AND FullURL = 'site_photo_16.jpg' AND Caption = 'Doris - site_photo_16.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'SP5' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_17.jpg' AND FullURL = 'site_photo_17.jpg' AND Caption = 'Doris - site_photo_17.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'SP6' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_13.jpg' AND FullURL = 'site_photo_13.jpg' AND Caption = 'Doris - site_photo_13.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'SP7' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_14.jpg' AND FullURL = 'site_photo_14.jpg' AND Caption = 'Doris - site_photo_14.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'SP8' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_15.jpg' AND FullURL = 'site_photo_15.jpg' AND Caption = 'Doris - site_photo_15.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'SP9' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_16.jpg' AND FullURL = 'site_photo_16.jpg' AND Caption = 'Doris - site_photo_16.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'SP10' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_17.jpg' AND FullURL = 'site_photo_17.jpg' AND Caption = 'Doris - site_photo_17.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'SP11' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_13.jpg' AND FullURL = 'site_photo_13.jpg' AND Caption = 'Doris - site_photo_13.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'SP12' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_14.jpg' AND FullURL = 'site_photo_14.jpg' AND Caption = 'Doris - site_photo_14.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'SP13' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_15.jpg' AND FullURL = 'site_photo_15.jpg' AND Caption = 'Doris - site_photo_15.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'SP14' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_16.jpg' AND FullURL = 'site_photo_16.jpg' AND Caption = 'Doris - site_photo_16.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'SP15' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_17.jpg' AND FullURL = 'site_photo_17.jpg' AND Caption = 'Doris - site_photo_17.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'SP16' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_13.jpg' AND FullURL = 'site_photo_13.jpg' AND Caption = 'Doris - site_photo_13.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'SP17' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_14.jpg' AND FullURL = 'site_photo_14.jpg' AND Caption = 'Doris - site_photo_14.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'SP18' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_15.jpg' AND FullURL = 'site_photo_15.jpg' AND Caption = 'Doris - site_photo_15.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'SP19' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_16.jpg' AND FullURL = 'site_photo_16.jpg' AND Caption = 'Doris - site_photo_16.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO
INSERT INTO ItemsXImages (ItemID, ImageID, DisplayOrder)
VALUES  ((SELECT i.ItemID FROM Items i JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID WHERE i.Name = 'SP20' AND ixi.ParentItemID = (SELECT ItemID FROM Items WHERE Name = 'Doris Campground')), -- ItemID - bigint
         (SELECT ImageID FROM Images WHERE IconURL = 'site_photo_17.jpg' AND FullURL = 'site_photo_17.jpg' AND Caption = 'Doris - site_photo_17.jpg'), -- ImageID - bigint
         1  -- DisplayOrder - int
         )
GO


--Fix Map
--SELECT * FROM Maps
UPDATE dbo.Maps
   SET CenterX = 34.71739, CenterY = -98.64499, LatitudeNorth = 34.719908, LatitudeSouth = 34.714875, LongitudeEast = -98.639955, LongitudeWest = -98.650030,
       ZoomMin = 17, ZoomMax = 19, ZoomDefault = 17
 WHERE Name = 'Doris Campground Map'
GO

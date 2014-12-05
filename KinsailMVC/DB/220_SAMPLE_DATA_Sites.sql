--------------------------------------------------------------------------------
-- SAMPLE DATA script
-- Sites
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


-- Sample Recreation Site (Gastonia Cabin)
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'Gastonia Cabin', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Rustic cabin with timber construction that can accomodate up to 4 people.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2015 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2015 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Registration Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Registration Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this event is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (Salisbury Cabin)
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'Salisbury Cabin', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Sizable cabin that can accomodate up to 6 people, with 3 bedrooms.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2015 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2015 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Registration Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Registration Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this event is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (Ichabod Campsite)
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'Ichabod Campsite', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Large campsite surrounded by thick woods, with nearby access to the Charlatan stream.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2015 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2015 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Registration Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Registration Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this event is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sites to Locations
-- ItemsXItems
INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Gastonia Cabin')
           ,(SELECT ItemID FROM Items WHERE Name = 'Sleepy Hollow')
           ,'Site within Location')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Salisbury Cabin')
           ,(SELECT ItemID FROM Items WHERE Name = 'Sleepy Hollow')
           ,'Site within Location')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Ichabod Campsite')
           ,(SELECT ItemID FROM Items WHERE Name = 'Sleepy Hollow')
           ,'Site within Location')
GO


-------------------------------------------------------------------------------
-- Raven Ridge Sites
-------------------------------------------------------------------------------

-- Sample Recreation Site (Tent-01) --------------------------------------------------------------
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'Tent-01', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Wooded camping site suitable for tents.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2017 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2017 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Reservations Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Reservations Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this site is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (Tent-02) --------------------------------------------------------------
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'Tent-02', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Wooded camping site suitable for tents.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2017 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2017 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Reservations Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Reservations Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this site is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (Tent-03) --------------------------------------------------------------
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'Tent-03', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Lightly wooded camping site suitable for tents.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2017 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2017 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Reservations Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Reservations Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this site is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (Tent-04) --------------------------------------------------------------
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'Tent-04', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Open camping site suitable for tents.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2017 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2017 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Reservations Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Reservations Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this site is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (Tent-15) --------------------------------------------------------------
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'Tent-15', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Large wooded camping site suitable for one or more tents.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2017 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2017 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Reservations Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Reservations Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this site is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (Tent-16) --------------------------------------------------------------
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'Tent-16', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Densely wooded camping site near a small stream, suitable for tents.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2017 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2017 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Reservations Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Reservations Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this site is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (RV-01) --------------------------------------------------------------
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'RV-01', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Lightly wooded camping site, suitable for recreation vehicles.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2017 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2017 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Reservations Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Reservations Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this site is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (RV-02) --------------------------------------------------------------
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'RV-02', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Moderately wooded camping site with small shale outcrops, suitable for recreation vehicles.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2017 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2017 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Reservations Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Reservations Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this site is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (RV-04) --------------------------------------------------------------
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'RV-04', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Large wooded camping site near hiking trails, suitable for recreation vehicles.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2017 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2017 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Reservations Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Reservations Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this site is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (RV-06) --------------------------------------------------------------
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'RV-06', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Wooded camping site suitable for recreation vehicles.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2017 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2017 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Reservations Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Reservations Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this site is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (RV-11) --------------------------------------------------------------
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'RV-11', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Spacious wooded camping site with nearby amenities, suitable for recreation vehicles.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2017 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2017 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Reservations Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Reservations Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this site is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (Picnic-01) --------------------------------------------------------------
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'Picnic-01', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Community picnic shelter with 4 tables and 2 outdoor grills. Can accomodate up to 24 people.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2017 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2017 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Reservations Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Reservations Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this site is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (Cabin-08) --------------------------------------------------------------
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'Cabin-08', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Small cabin near the northern edge of the campground, accomodates 1-4 people.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2017 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2017 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Reservations Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Reservations Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this site is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (Cabin-11) --------------------------------------------------------------
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'Cabin-11', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Medium-sized cabin with two bedrooms near the Poquarry stream.  Accomodates 2-6 people.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2017 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2017 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Reservations Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Reservations Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this site is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (Cabin-14) --------------------------------------------------------------
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'Cabin-14', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Large cabin with three bedrooms in a heavily wooded area of the park.  Accomodates 3-8 people.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2017 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2017 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Reservations Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Reservations Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this site is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (Cabin-16) --------------------------------------------------------------
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'Cabin-16', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Rustic cabin with a large central fireplace.  Accomodates 1-4 people.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2017 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2017 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Reservations Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Reservations Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this site is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (Cabin-19) --------------------------------------------------------------
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'Cabin-19', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Modern cabin with a fully-appointed kitchen, common area and 2 bedrooms.  Accomodates 2-5 people.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2017 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2017 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Reservations Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Reservations Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this site is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (Dock-P1-03) --------------------------------------------------------------
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'Dock-P1-03', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Medium boat slip on the Northern pier, which can accomodate up to a 21 ft boat.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2017 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2017 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Reservations Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Reservations Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this site is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (Dock-P1-05) --------------------------------------------------------------
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'Dock-P1-05', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Small boat slip on the Northern pier, which can accomodate up to a 15 ft boat.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2017 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2017 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Reservations Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Reservations Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this site is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (Dock-P2-02) --------------------------------------------------------------
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'Dock-P2-02', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'The largest boat slip in the park, accomodates up to a 25 ft boat.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2017 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2017 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Reservations Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Reservations Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this site is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (Dock-P2-04) --------------------------------------------------------------
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'Dock-P2-04', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Small boat slip on the Southern pier, which can accomodate up to a 14 ft boat.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2017 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2017 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Reservations Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Reservations Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this site is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (Dock-P3-01) --------------------------------------------------------------
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'Dock-P3-01', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Small boat slip on the central gangway, which can accomodate up to a 12 ft boat.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2017 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2017 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Reservations Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Reservations Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this site is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (Trailer-02) --------------------------------------------------------------
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'Trailer-02', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Large trailer site, hidden from the main road, with access to electrical and water hookups.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2017 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2017 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Reservations Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Reservations Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this site is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sample Recreation Site (Group-03) --------------------------------------------------------------
INSERT INTO Items (
		GroupID, 
		Name, 
		ItemTypeID, 
		AgeMin, 
		AgeMax, 
		Description, 
		StartDate, 
		EndDate, 
		CancellationDate, 
		EntryOpenDate, 
		EntryCloseDate, 
		EntryFee, 
		RegistrationFee, 
		RegistrationPercentage, 
		RegistrationFeeClientCharge, 
		EarlyRegistrationCloseDate, 
		EarlyRegistrationEntryFee, 
		EarlyRegistrationRegistrationFee, 
		EarlyRegistrationRegistrationFeeClientCharge, 
		LateFeeDate, 
		LateFee, 
		LateFeeRegistrationFee, 
		LateFeeRegistrationFeeClientCharge, 
		MaxEntries, 
		MaxEntriesPerItem, 
		WaitingListNumber, 
		MaxWaitingListEntries, 
		AgeAsOfDate, 
		OutputColumns, 
		RegistrationNotOpenText, 
		RegistrationNotOpenTextEvaluationMethod, 
		RegistrationClosedText, 
		RegistrationClosedTextEvaluationMethod, 
		WaitListText, 
		WaitListTextEvaluationMethod, 
		WaitListPopUpText, 
		WaitListPopUpTextEvaluationMethod, 
		RegistrantSign, 
		IncludeInClientAccounting, 
		IncludeInRegistrantAccounting, 
		Active, 
		IncludeInResultsPage, 
		ResultsPageDisplayOrder, 
		DirectorsDisplayOrder, 
		ClientIdentificationCode, 
		DescriptionEvaluationMethod, 
		LocationName, 
		KinsailFeesIncluded, 
		QuestionSetupSource, 
		QuestionSetupSourceName, 
		UseItemDetailsBox, 
		ShowCurrentEntries, 
		EntrySelectTypeID, 
		DirectorsRowsPerPage, 
		ShowItemDate, 
		UseExpandableDescriptionOnResults, 
		EarlyDiscountScript, 
		RegularDiscountScript, 
		DiscountAmount, 
		DefaultDirectorsFields, 
		DefaultDirectorsSortColumn, 
		DefaultDirectorsSortDirection, 
		HasReservations, 
		ReservationsRequired, 
		IncludeInCalendar, 
		DetailsSimpleColumnList, 
		UseCustomSPOnDetailsSimple, 
		Audit_ContactID, 
		Version_Number, 
		RegistrationName, 
		RegistrationNameEvaluationMethod, 
		AllowCustomQuantity)--, 
		--ApplyTax, 
		--ShowOnInvoice, 
		--ShowQuantityOnInvoice, 
		--ShowRateOnInvoice)
VALUES (
		(SELECT GroupID FROM Groups WHERE Name = 'Recreation Reservations'), --GroupID
		'Group-03', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'Group camping site in a lightly wooded field, with nearby access to mountain biking trails.  Can accommodate up to 4 tents.', --Description
		'Jan  1 2014 12:00:00:000AM', --StartDate
		'Dec 31 2017 12:00:00:000AM', --EndDate
		'Jan  1 1900 12:00:00:000AM', --CancellationDate
		'Jan  1 1900 12:00:00:000AM', --EntryOpenDate
		'Dec 31 2017 12:00:00:000AM', --EntryCloseDate
		0.00000, --EntryFee
		0.00000, --RegistrationFee
		0.00000, --RegistrationPercentage
		0.00000, --RegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --EarlyRegistrationCloseDate
		0.00000, --EarlyRegistrationEntryFee
		0.00000, --EarlyRegistrationRegistrationFee
		0.00000, --EarlyRegistrationRegistrationFeeClientCharge
		'Jan  1 1900 12:00:00:000AM', --LateFeeDate
		0.00000, --LateFee
		0.00000, --LateFeeRegistrationFee
		0.00000, --LateFeeRegistrationFeeClientCharge
		0, --MaxEntries
		1, --MaxEntriesPerItem
		0, --WaitingListNumber
		0, --MaxWaitingListEntries
		'Jan 1 2014 12:00:00:000AM', --AgeAsOfDate
		'Reservations', --OutputColumns
		'Online Reservations Not Open', --RegistrationNotOpenText
		'', --RegistrationNotOpenTextEvaluationMethod
		'Online Reservations Closed', --RegistrationClosedText
		'', --RegistrationClosedTextEvaluationMethod
		'Waiting List Only', --WaitListText
		'', --WaitListTextEvaluationMethod
		'Please note that this site is only accepting wait list entries.', --WaitListPopUpText
		'', --WaitListPopUpTextEvaluationMethod
		0, --RegistrantSign
		1, --IncludeInClientAccounting
		1, --IncludeInRegistrantAccounting
		1, --Active
		1, --IncludeInResultsPage
		0, --ResultsPageDisplayOrder
		0, --DirectorsDisplayOrder
		'', --ClientIdentificationCode
		'', --DescriptionEvaluationMethod
		'', --LocationName
		1, --KinsailFeesIncluded
		0, --QuestionSetupSource
		'', --QuestionSetupSourceName
		0, --UseItemDetailsBox
		0, --ShowCurrentEntries
		408, --EntrySelectTypeID (408 = ImageButton/ImageLink)
		0, --DirectorsRowsPerPage
		0, --ShowItemDate
		0, --UseExpandableDescriptionOnResults
		'', --EarlyDiscountScript
		'', --RegularDiscountScript
		0.00000, --DiscountAmount
		'', --DefaultDirectorsFields
		'', --DefaultDirectorsSortColumn
		'', --DefaultDirectorsSortDirection
		1, --HasReservations
		0, --ReservationsRequired
		1, --IncludeInCalendar
		'', --DetailsSimpleColumnList
		0, --UseCustomSPOnDetailsSimple
		NULL, --Audit_ContactID
		1, --Version_Number
		'Reservation', --RegistrationName
		'', --RegistrationNameEvaluationMethod
		0)--, --AllowCustomQuantity
		--0, --ApplyTax
		--1, --ShowOnInvoice
		--1, --ShowQuantityOnInvoice
		--1) --ShowRateOnInvoice
GO

-- Sites to Locations
-- ItemsXItems
INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Tent-01')
           ,(SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park')
           ,'Campsite within Park')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Tent-02')
           ,(SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park')
           ,'Campsite within Park')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Tent-03')
           ,(SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park')
           ,'Campsite within Park')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Tent-04')
           ,(SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park')
           ,'Campsite within Park')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Tent-15')
           ,(SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park')
           ,'Campsite within Park')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Tent-16')
           ,(SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park')
           ,'Campsite within Park')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'RV-01')
           ,(SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park')
           ,'Campsite within Park')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'RV-02')
           ,(SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park')
           ,'Campsite within Park')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'RV-04')
           ,(SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park')
           ,'Campsite within Park')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'RV-06')
           ,(SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park')
           ,'Campsite within Park')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'RV-11')
           ,(SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park')
           ,'Campsite within Park')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Picnic-01')
           ,(SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park')
           ,'Campsite within Park')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Cabin-08')
           ,(SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park')
           ,'Campsite within Park')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Cabin-11')
           ,(SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park')
           ,'Campsite within Park')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Cabin-14')
           ,(SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park')
           ,'Campsite within Park')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Cabin-16')
           ,(SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park')
           ,'Campsite within Park')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Cabin-19')
           ,(SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park')
           ,'Campsite within Park')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Dock-P1-03')
           ,(SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park')
           ,'Campsite within Park')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Dock-P1-05')
           ,(SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park')
           ,'Campsite within Park')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Dock-P2-02')
           ,(SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park')
           ,'Campsite within Park')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Dock-P2-04')
           ,(SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park')
           ,'Campsite within Park')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Dock-P3-01')
           ,(SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park')
           ,'Campsite within Park')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Trailer-02')
           ,(SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park')
           ,'Campsite within Park')
GO

INSERT INTO [dbo].[ItemsXItems]
           ([ItemID]
           ,[ParentItemID]
           ,[RelationDesc])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Group-03')
           ,(SELECT ItemID FROM Items WHERE Name = 'Raven Ridge Park')
           ,'Campsite within Park')
GO


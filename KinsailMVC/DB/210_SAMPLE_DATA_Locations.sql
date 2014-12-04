--------------------------------------------------------------------------------
-- SAMPLE DATA script
-- Locations
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

-- Sample Locations (Items)
-- Copied mostly from prototype Item record (ItemID=729299)

-- Sample Recreation Location (Sleepy Hollow)
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
		'Sleepy Hollow', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Location'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'A village in the town of Mount Pleasant in Westchester County, New York. Located on the east bank of the Hudson River, about 30 miles north of New York City.', --Description
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

-- Sample Recreation Location (Beach Park)
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
		'Beach Park', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Location'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'An quaint lakeside park with several camping "neighborhoods", nestled into the surrounding woodlands.', --Description
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

-- Sample Recreation Location (Raven Ridge)
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
		'Raven Ridge Park', --Name
		(SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Location'), --ItemTypeID
		0, --AgeMin
		0, --AgeMax
		'A popular watchable wildlife area, Raven Rdige is home to abundant wildlife including elk, black bear, hawks, and mule deer.', --Description
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
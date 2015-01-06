--------------------------------------------------------------------------------
-- SAMPLE DATA script
-- Groups
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

-- This is largely a dumb copy of an existing group record, with almost no modification for this project
-- Just stamping out a copy of a known good group record
INSERT INTO Groups (
		Name,
		LocationID,
		TypeID,
		Description,
		Sponsor,
		MaxEntries,
		MaxServiceCharge,
		MinEntryFee,
		IncludedEntries,
		GeneralRegistrationPercentage,
		GeneralRegistrationFee,
		CheckFee,
		DefaultApprovalCode,
		Featured, 
		ChargeInFee, 
		AllowSignWaivers, 
		ShowSponsor, 
		ShowContact, 
		ShowDeadline, 
		ApplyServiceChargeForMailedPayment, 
		ShowAccountAfterRegistration, 
		ResultsPageShowTimeline, 
		ShowWaiverLink, 
		ProcessPayment, 
		AutoSettleTransaction, 
		ShowBillingPolicyLink, 
		SendPaymentFollowUpEmail, 
		WarningText, 
		WarningTextEvaluationMethod, 
		FeaturedText, 
		FeaturedTextEvaluationMethod, 
		ResultsDescriptionColumnHeader, 
		ResultsDescriptionColumnHeaderEvaluationMethod, 
		ResultsFeeColumnHeader, 
		ResultsFeeColumnHeaderEvaluationMethod, 
		ResultsQuantityColumnHeader, 
		ResultsQuantityColumnHeaderEvaluationMethod, 
		RegisterButtonText, 
		RegisterButtonTextEvaluationMethod, 
		PostSubmitRegisterButtonText, 
		PostSubmitRegisterButtonTextEvaluationMethod, 
		RegistrantEmail, 
		RegistrantEmailEvaluationMethod, 
		RegistrantNameColumns, 
		RegistrantNameColumnsEvaluationMethod, 
		RegistrantAddressColumns, 
		RegistrantAddressColumnsEvaluationMethod, 
		BillingID, 
		BillingPolicyID, 
		ExcessSelectionsErrorMessageID, 
		NoSelectionErrorMessageID, 
		Active, 
		PaymentechDivision, 
		PaymentechSubmitterID, 
		PaypalVendor, 
		ShowInContactForm, 
		InvoiceWaitlistText, 
		InvoiceWaitlistTextEvaluationMethod, 
		PickListMessageText, 
		PickListMessageTextEvaluationMethod, 
		StandardRegistrationFee, 
		StandardRegistrationPercentage, 
		PaymentechMerchantDescriptor, 
		RegistrationOrganizationColumnName, 
		RegistrationOrganizationColumnNameEvaluationMethod, 
		ResultsDateColumnHeader, 
		ResultsDateColumnHeaderEvaluationMethod, 
		PaymentechEntryDescription, 
		FiscalYearEndDate, 
		PayGovAgencyID, 
		WebServiceCompletePageID, 
		AllowResumeRegistration, 
		TimeZoneOffset, 
		TimeZoneLabel, 
		RegistrationTimeout, 
		CanSaveRegistration, 
		SaveRegistrationFirstPage, 
		SaveRegistrationTimeoutSeconds, 
		AllowNavigation, 
		RegistrationTimeoutWarning, 
		Audit_ContactID, 
		OverrideEmailAddresses, 
		AllowHTML)
VALUES (
		'Recreation Reservations', --Name
		3711, --LocationID
		403, --TypeID
		'Description here', --Description
		'Yosemite National Park', --Sponsor
		0, --MaxEntries
		0.00, --MaxServiceCharge
		0.00, --MinEntryFee
		0, --IncludedEntries
		0.00000, --GeneralRegistrationPercentage
		0.00, --GeneralRegistrationFee
		0.00, --CheckFee
		'NONE', --DefailtApprovalCode
		0, --Featured
		1, --ChargeInFee
		0, --AllowSignWaivers
		0, --ShowSponsor
		0, --ShowContact
		0, --ShowDeadline
		0, --ApplyServiceChargeForMailedPayment
		0, --ShowAccountAfterRegistration
		0, --ResultsPageShowTimeline
		0, --ShowWaiverLink
		0, --ProcessPayment
		1, --AutoSettleTransaction
		0, --ShowBillingPolicyLink
		0, --SendPaymentFollowUpEmail
		'', --WarningText
		'', --WarningTextEvaluationMethod
		'', --FeaturedText
		'', --FeaturedTextEvaluationMethod
		'Campground', --ResultsDescriptionColumnHeader
		'', --ResultsDescriptionColumnHeaderEvaluationMethod
		'Cost', --ResultsFeeColumnHeader
		'', --ResultsFeeColumnHeaderEvaluationMethod
		'Days', --ResultsQuantityColumnHeader
		'', --ResultsQuantityColumnHeaderEvaluationMethod
		'Reserve Now!', --RegisterButtonText
		'', --RegisterButtonTextEvaluationMethod
		'Processing...please wait', --PostSubmitRegisterButtonText
		'', --PostSubmitRegisterButtonTextEvaluationMethod
		'Email', --RegistrantEmail
		'', --RegistrantEmailEvaluationMethod
		'', --RegistrantNameColumns
		'', --RegistrantNameColumnsEvaluationMethod
		'', --RegistrantAddressColumns
		'', --RegistrantAddressColumnsEvaluationMethod
		1911, --BillingID
		703, --BillingPolicyID
		5, --ExcessSelectionsErrorMessageID
		4, --NoSelectionErrorMessageID
		1, --Active
		0, --PaymentechDivision
		1047, --PaymentechSubmitterID
		'KINSAIL', --PaypalVendor
		0, --ShowInContactForm
		'', --InvoiceWaitlistText
		'', --InvoiceWaitlistTextEvaluationMethod
		'', --PickListMessageText
		'', --PickListMessageTextEvaluationMethod
		2.00, --StandardRegistrationFee
		3.50000, --StandardRegistrationPercentage
		'Kinsail*YOSE', --PaymentechMerchantDescriptor
		'', --RegistrationOrganizationColumnName
		'', --RegistrationOrganizationColumnNameEvaluationMethod
		'', --ResultsDateColumnHeader
		'', --ResultsDateColumnHeaderEvaluationMethod
		'Permits', --PaymentechEntryDescription
		'Dec 31 2009 12:00:00:000AM', --FiscalYearEndDate
		'', --PayGovAgencyID
		5401, --WebServiceCompletePageID
		0, --AllowResumeRegistration
		NULL, --TimeZoneOffset
		NULL, --TimeZoneLabel
		10, --RegistrationTimeout
		0, --CanSaveRegistration
		0, --SaveRegistrationFirstPage
		864000, --SaveRegistrationTimeoutSeconds
		0, --AllowNavigation
		5, --RegistrationTimeoutWarning
		NULL, --Audit_ContactID
		'', --OverrideEmailAddresses
		1) --AllowHTML
GO
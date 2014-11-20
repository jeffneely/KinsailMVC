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
INSERT INTO Groups (Name, LocationID, TypeID, Description, Sponsor, MaxEntries, MaxServiceCharge, MinEntryFee, IncludedEntries, GeneralRegistrationPercentage, GeneralRegistrationFee, CheckFee, DefaultApprovalCode, Featured, ChargeInFee, AllowSignWaivers, ShowSponsor, ShowContact, ShowDeadline, ApplyServiceChargeForMailedPayment, ShowAccountAfterRegistration, ResultsPageShowTimeline, ShowWaiverLink, ProcessPayment, AutoSettleTransaction, ShowBillingPolicyLink, SendPaymentFollowUpEmail, WarningText, WarningTextEvaluationMethod, FeaturedText, FeaturedTextEvaluationMethod, ResultsDescriptionColumnHeader, ResultsDescriptionColumnHeaderEvaluationMethod, ResultsFeeColumnHeader, ResultsFeeColumnHeaderEvaluationMethod, ResultsQuantityColumnHeader, ResultsQuantityColumnHeaderEvaluationMethod, RegisterButtonText, RegisterButtonTextEvaluationMethod, PostSubmitRegisterButtonText, PostSubmitRegisterButtonTextEvaluationMethod, RegistrantEmail, RegistrantEmailEvaluationMethod, RegistrantNameColumns, RegistrantNameColumnsEvaluationMethod, RegistrantAddressColumns, RegistrantAddressColumnsEvaluationMethod, BillingID, BillingPolicyID, ExcessSelectionsErrorMessageID, NoSelectionErrorMessageID, Active, PaymentechDivision, PaymentechSubmitterID, PaypalVendor, ShowInContactForm, InvoiceWaitlistText, InvoiceWaitlistTextEvaluationMethod, PickListMessageText, PickListMessageTextEvaluationMethod, StandardRegistrationFee, StandardRegistrationPercentage, PaymentechMerchantDescriptor, RegistrationOrganizationColumnName, RegistrationOrganizationColumnNameEvaluationMethod, ResultsDateColumnHeader, ResultsDateColumnHeaderEvaluationMethod, PaymentechEntryDescription, FiscalYearEndDate, PayGovAgencyID, WebServiceCompletePageID, AllowResumeRegistration, TimeZoneOffset, TimeZoneLabel, RegistrationTimeout, CanSaveRegistration, SaveRegistrationFirstPage, SaveRegistrationTimeoutSeconds, AllowNavigation, RegistrationTimeoutWarning, Audit_ContactID, OverrideEmailAddresses, AllowHTML)
VALUES ('Recreation Reservations', 3711, 403, 'Description here', 'Yosemite National Park', 0, 0.00, 0.00, 0, 0.00000, 0.00, 0.00, 'NONE', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', 'Campground', '', 'Cost', '', 'Days', '', 'Reserve Now!', '', 'Processing...please wait', '', 'Email', '', '', '', '', '', 1911, 703, 5, 4, 1, 0, 1047, 'KINSAIL', 0, '', '', '', '', 2.00, 3.50000, 'Kinsail*YOSE', '', '', '', '', 'Permits', 'Dec 31 2009 12:00:00:000AM', '', 5401, 0, NULL, NULL, 10, 0, 0, 864000, 0, 5, NULL, '', 1)

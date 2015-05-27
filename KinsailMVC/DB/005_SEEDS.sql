--------------------------------------------------------------------------------
-- IDENTITY SEEDS script
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


-- Update IDENITY seeds on each server
-- Change the below @ServerNumber for each server during deployment
EXEC dbo.UpdateIdentities
	@ServerNumber=15, 
	@TableNameList = 'ItemsXItems,FeatureTypes,Features,FeatureTypeValues,ItemsXFeatures,ImageTypes,Images,ItemsXImages,Maps,ItemsXMaps,MapsXFeatures,ItemsXLocations,Organizations,ItemsXOrganizations,Availability,Rates,ItemsXAvailRates'
GO

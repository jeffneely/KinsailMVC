--------------------------------------------------------------------------------
-- CONSTRAINTS script
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
-- Unique Constraints
--

-- Items CAN be linked to the same Availability info more than once, but each must have a unique DisplayOrder
ALTER TABLE ItemsXAvailability
ADD CONSTRAINT UK_ItemsXAvailability_ItemID_DisplayOrder UNIQUE (ItemID, DisplayOrder)

-- Items cannot be linked to the same Feature more than once and each must have a unique DisplayOrder
ALTER TABLE ItemsXFeatures
ADD CONSTRAINT UK_ItemsXFeatures_ItemID_DisplayOrder UNIQUE (ItemID, DisplayOrder)
ALTER TABLE ItemsXFeatures
ADD CONSTRAINT UK_ItemsXFeatures_ItemID_FeatureID UNIQUE (ItemID, FeatureID)

-- Items cannot be linked to the same Image more than once and each must have a unique DisplayOrder
ALTER TABLE ItemsXImages
ADD CONSTRAINT UK_ItemsXImages_ItemID_DisplayOrder UNIQUE (ItemID, DisplayOrder)
ALTER TABLE ItemsXImages
ADD CONSTRAINT UK_ItemsXImages_ItemID_ImageID UNIQUE (ItemID, ImageID)

-- Items CAN be linked to the same Location (Address) more than once, but each must have a unique DisplayOrder
-- Description field would then help convey the reason for the association
ALTER TABLE ItemsXLocations
ADD CONSTRAINT UK_ItemsXLocations_ItemID_DisplayOrder UNIQUE (ItemID, DisplayOrder)

-- Items cannot be linked to the same Map more than once and each must have a unique DisplayOrder
ALTER TABLE ItemsXMaps
ADD CONSTRAINT UK_ItemsXMaps_ItemID_DisplayOrder UNIQUE (ItemID, DisplayOrder)
ALTER TABLE ItemsXMaps
ADD CONSTRAINT UK_ItemsXMaps_ItemID_MapID UNIQUE (ItemID, MapID)

-- Items CAN be linked to the same Organization more than once, but each must have a unique DisplayOrder
-- Description field would then help convey the reason for the association
ALTER TABLE ItemsXOrganizations
ADD CONSTRAINT UK_ItemsXOrganizations_ItemID_DisplayOrder UNIQUE (ItemID, DisplayOrder)

-- Items cannot be linked to the same Availability/Rate info more than once and each must have a unique DisplayOrder
ALTER TABLE ItemsXAvailRates
ADD CONSTRAINT UK_ItemsXAvailRates_ItemID_DisplayOrder UNIQUE (ItemID, DisplayOrder)
ALTER TABLE ItemsXAvailRates
ADD CONSTRAINT UK_ItemsXAvailRates_ItemID_AvailID_RateID UNIQUE (ItemID, AvailID, RateID)

-- Maps cannot be linked to the same Feature more than once and each must have a unique DisplayOrder
ALTER TABLE MapsXFeatures
ADD CONSTRAINT UK_MapsXFeatures_MapID_DisplayOrder UNIQUE (MapID, DisplayOrder)
ALTER TABLE MapsXFeatures
ADD CONSTRAINT UK_MapsXFeatures_MapID_FeatureID UNIQUE (MapID, FeatureID)
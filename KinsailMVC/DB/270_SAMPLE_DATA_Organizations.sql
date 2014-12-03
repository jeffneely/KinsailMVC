--------------------------------------------------------------------------------
-- SAMPLE DATA script
-- Organizations
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


-- Organizations
INSERT INTO [dbo].[Organizations]
           ([Name]
           ,[Abbreviation]
           ,[Description]
           ,[Phone]
           ,[PhoneLabel]
           ,[Phone2]
           ,[Phone2Label]
           ,[Email]
           ,[EmailLabel]
           ,[URL]
           ,[URLLabel]
           ,[Active])
     VALUES
           ('California Department of Parks and Recreation' --Name
           ,'CA State Parks' --Abbreviation
           ,'DESCRIPTION: Lorem ipsum dolor sit amet...' --Description
           ,'800-777-0369' --Phone
           ,'800 Phone' --PhoneLabel
           ,'916-653-6995' --Phone2
           ,'Phone' --Phone2Label
           ,'info@parks.ca.gov' --Email
           ,'Email' --EmailLabel
           ,'http://www.parks.ca.gov/' --URL
           ,'Website' --URLLabel
           ,1 --Active
           )
GO

INSERT INTO [dbo].[Organizations]
           ([Name]
           ,[Abbreviation]
           ,[Description]
           ,[Phone]
           ,[PhoneLabel]
           ,[Phone2]
           ,[Phone2Label]
           ,[Email]
           ,[EmailLabel]
           ,[URL]
           ,[URLLabel]
           ,[Active])
     VALUES
           ('New York State Office of Parks, Recreation & Historic Preservation' --Name
           ,'NY State Parks' --Abbreviation
           ,'DESCRIPTION: Lorem ipsum dolor sit amet...' --Description
           ,'518-474-0456' --Phone
           ,'Phone' --PhoneLabel
           ,'800-456-2267' --Phone2
           ,'Reservations' --Phone2Label
           ,'' --Email
           ,'' --EmailLabel
           ,'http://nysparks.com/' --URL
           ,'Website' --URLLabel
           ,1 --Active
           )
GO

-- ItemsXOrganizations
INSERT INTO [dbo].[ItemsXOrganizations]
           ([ItemID]
           ,[OrgID]
           ,[DisplayOrder]
           ,[Description])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Beach Park') --ItemID
           ,(SELECT OrgID FROM Organizations WHERE Abbreviation = 'CA State Parks') --OrgID
           ,0 --DisplayOrder
           ,'Operator' --Description
           )
GO

INSERT INTO [dbo].[ItemsXOrganizations]
           ([ItemID]
           ,[OrgID]
           ,[DisplayOrder]
           ,[Description])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Sleepy Hollow') --ItemID
           ,(SELECT OrgID FROM Organizations WHERE Abbreviation = 'NY State Parks') --OrgID
           ,0 --DisplayOrder
           ,'Operator' --Description
           )
GO
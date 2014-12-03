

-- Images
INSERT INTO [dbo].[Images]
           ([ImageTypeID]
           ,[IconURL]
           ,[FullURL]
           ,[Caption]
           ,[Source]
           ,[Active])
     VALUES
           ((SELECT ImageTypeID FROM ImageTypes WHERE Name = 'Gallery Image')
           ,'thumbnail/gallery1.png'
           ,'gallery1.png'
           ,'Photo 1'
           ,''
           ,1)
GO

INSERT INTO [dbo].[Images]
           ([ImageTypeID]
           ,[IconURL]
           ,[FullURL]
           ,[Caption]
           ,[Source]
           ,[Active])
     VALUES
           ((SELECT ImageTypeID FROM ImageTypes WHERE Name = 'Gallery Image')
           ,'thumbnail/gallery2.png'
           ,'gallery2.png'
           ,'Photo 2'
           ,''
           ,1)
GO
INSERT INTO [dbo].[Images]
           ([ImageTypeID]
           ,[IconURL]
           ,[FullURL]
           ,[Caption]
           ,[Source]
           ,[Active])
     VALUES
           ((SELECT ImageTypeID FROM ImageTypes WHERE Name = 'Gallery Image')
           ,'thumbnail/gallery3.png'
           ,'gallery3.png'
           ,'Photo 3'
           ,''
           ,1)
GO
INSERT INTO [dbo].[Images]
           ([ImageTypeID]
           ,[IconURL]
           ,[FullURL]
           ,[Caption]
           ,[Source]
           ,[Active])
     VALUES
           ((SELECT ImageTypeID FROM ImageTypes WHERE Name = 'Gallery Image')
           ,'thumbnail/gallery4.png'
           ,'gallery4.png'
           ,'Photo 4'
           ,''
           ,1)
GO

INSERT INTO [dbo].[Images]
           ([ImageTypeID]
           ,[IconURL]
           ,[FullURL]
           ,[Caption]
           ,[Source]
           ,[Active])
     VALUES
           ((SELECT ImageTypeID FROM ImageTypes WHERE Name = 'Gallery Image')
           ,'thumbnail/gallery5.png'
           ,'gallery5.png'
           ,'Photo 5'
           ,''
           ,1)
GO

INSERT INTO [dbo].[Images]
           ([ImageTypeID]
           ,[IconURL]
           ,[FullURL]
           ,[Caption]
           ,[Source]
           ,[Active])
     VALUES
           ((SELECT ImageTypeID FROM ImageTypes WHERE Name = 'Gallery Image')
           ,'thumbnail/gallery6.png'
           ,'gallery6.png'
           ,'Photo 6'
           ,''
           ,1)
GO

INSERT INTO [dbo].[Images]
           ([ImageTypeID]
           ,[IconURL]
           ,[FullURL]
           ,[Caption]
           ,[Source]
           ,[Active])
     VALUES
           ((SELECT ImageTypeID FROM ImageTypes WHERE Name = 'Gallery Image')
           ,'thumbnail/gallery7.png'
           ,'gallery7.png'
           ,'Photo 7'
           ,''
           ,1)
GO

INSERT INTO [dbo].[Images]
           ([ImageTypeID]
           ,[IconURL]
           ,[FullURL]
           ,[Caption]
           ,[Source]
           ,[Active])
     VALUES
           ((SELECT ImageTypeID FROM ImageTypes WHERE Name = 'Gallery Image')
           ,'thumbnail/gallery8.png'
           ,'gallery8.png'
           ,'Photo 8'
           ,''
           ,1)
GO

INSERT INTO [dbo].[Images]
           ([ImageTypeID]
           ,[IconURL]
           ,[FullURL]
           ,[Caption]
           ,[Source]
           ,[Active])
     VALUES
           ((SELECT ImageTypeID FROM ImageTypes WHERE Name = 'Gallery Image')
           ,'thumbnail/gallery9.png'
           ,'gallery9.png'
           ,'Photo 9'
           ,''
           ,1)
GO

INSERT INTO [dbo].[Images]
           ([ImageTypeID]
           ,[IconURL]
           ,[FullURL]
           ,[Caption]
           ,[Source]
           ,[Active])
     VALUES
           ((SELECT ImageTypeID FROM ImageTypes WHERE Name = 'Banner Image')
           ,'thumbnail/banner1.png'
           ,'banner1.png'
           ,'Banner 1'
           ,''
           ,1)
GO

INSERT INTO [dbo].[Images]
           ([ImageTypeID]
           ,[IconURL]
           ,[FullURL]
           ,[Caption]
           ,[Source]
           ,[Active])
     VALUES
           ((SELECT ImageTypeID FROM ImageTypes WHERE Name = 'Banner Image')
           ,'thumbnail/banner2.png'
           ,'banner2.png'
           ,'Banner 2'
           ,''
           ,1)
GO

-- ItemsXImages
INSERT INTO [dbo].[ItemsXImages]
           ([ItemID]
           ,[ImageID]
           ,[DisplayOrder])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Gastonia Cabin')
           ,(SELECT ImageID FROM Images WHERE Caption = 'Photo 1')
           ,0)
GO

INSERT INTO [dbo].[ItemsXImages]
           ([ItemID]
           ,[ImageID]
           ,[DisplayOrder])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Salisbury Cabin')
           ,(SELECT ImageID FROM Images WHERE Caption = 'Photo 2')
           ,0)
GO

INSERT INTO [dbo].[ItemsXImages]
           ([ItemID]
           ,[ImageID]
           ,[DisplayOrder])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Ichabod Campsite')
           ,(SELECT ImageID FROM Images WHERE Caption = 'Photo 3')
           ,0)
GO

INSERT INTO [dbo].[ItemsXImages]
           ([ItemID]
           ,[ImageID]
           ,[DisplayOrder])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Gastonia Cabin')
           ,(SELECT ImageID FROM Images WHERE Caption = 'Photo 4')
           ,1)
GO

INSERT INTO [dbo].[ItemsXImages]
           ([ItemID]
           ,[ImageID]
           ,[DisplayOrder])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Gastonia Cabin')
           ,(SELECT ImageID FROM Images WHERE Caption = 'Photo 5')
           ,2)
GO

INSERT INTO [dbo].[ItemsXImages]
           ([ItemID]
           ,[ImageID]
           ,[DisplayOrder])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Beach Park')
           ,(SELECT ImageID FROM Images WHERE Caption = 'Photo 8')
           ,1)
GO

INSERT INTO [dbo].[ItemsXImages]
           ([ItemID]
           ,[ImageID]
           ,[DisplayOrder])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Sleepy Hollow')
           ,(SELECT ImageID FROM Images WHERE Caption = 'Photo 9')
           ,1)
GO

INSERT INTO [dbo].[ItemsXImages]
           ([ItemID]
           ,[ImageID]
           ,[DisplayOrder])
     VALUES
           ((SELECT ItemID FROM Items WHERE Name = 'Sleepy Hollow')
           ,(SELECT ImageID FROM Images WHERE Caption = 'Banner 1')
           ,2)
GO
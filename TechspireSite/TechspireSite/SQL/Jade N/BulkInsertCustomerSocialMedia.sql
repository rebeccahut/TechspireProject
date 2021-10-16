BULK INSERT CustomerSocialMedia
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\CustomerSocialMediaList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO
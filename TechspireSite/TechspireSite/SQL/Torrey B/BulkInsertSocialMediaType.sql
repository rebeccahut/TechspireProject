BULK INSERT SocialMediaType
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\SocialMediaTypeList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO
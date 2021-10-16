BULK INSERT BanType
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\BanTypeList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO
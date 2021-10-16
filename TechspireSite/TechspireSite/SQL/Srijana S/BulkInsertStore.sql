BULK INSERT Store
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\StoreList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO
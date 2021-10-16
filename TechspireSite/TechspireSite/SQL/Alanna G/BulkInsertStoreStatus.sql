BULK INSERT StoreStatus
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\StoreStatusList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO
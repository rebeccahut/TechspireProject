BULK INSERT ProductStatus
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\ProductStatusList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO
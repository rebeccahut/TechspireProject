BULK INSERT StoreProduct
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\StoreProductList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO
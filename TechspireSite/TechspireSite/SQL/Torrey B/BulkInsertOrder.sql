BULK INSERT Order
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\OrderList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO
BULK INSERT "Order"
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\OrderList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO
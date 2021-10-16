BULK INSERT CustomerCustomerCategory
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\CustomerCustomerCategoryList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO
BULK INSERT StateProvince
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\StateProvinceList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO
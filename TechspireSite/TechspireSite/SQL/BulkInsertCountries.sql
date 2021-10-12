BULK INSERT Country
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\CountryList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY
	)
GO
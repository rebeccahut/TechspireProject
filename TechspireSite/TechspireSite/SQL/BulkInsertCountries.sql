BULK INSERT Country
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\CountryList.csv"
WITH
	(
	FIELDTERMINATOR = '~',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY
	)
GO
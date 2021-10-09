BULK INSERT techspire_country
FROM "D:\CountryList.txt"
WITH
	(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
	)
GO
BULK INSERT "Location"
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\LocationList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY
	)
GO
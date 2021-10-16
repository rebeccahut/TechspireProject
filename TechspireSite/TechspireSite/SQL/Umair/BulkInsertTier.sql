BULK INSERT Tier
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\TierList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO
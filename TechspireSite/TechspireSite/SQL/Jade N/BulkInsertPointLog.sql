BULK INSERT PointLog
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\PointLogList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO
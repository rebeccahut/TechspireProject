BULK INSERT PointReasonType
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\PointReasonTypeList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO
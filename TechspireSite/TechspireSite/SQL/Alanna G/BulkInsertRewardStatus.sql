BULK INSERT RewardStatus
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\RewardStatusList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO
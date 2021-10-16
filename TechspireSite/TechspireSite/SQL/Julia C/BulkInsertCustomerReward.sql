BULK INSERT CustomerReward
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\CustomerRewardList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO
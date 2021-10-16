BULK INSERT StoreReward
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\StoreRewardList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO
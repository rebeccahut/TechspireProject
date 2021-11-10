BULK INSERT BanType
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\BanTypeList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO
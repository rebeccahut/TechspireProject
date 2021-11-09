BULK INSERT PaymentType
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\PaymentTypeList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO
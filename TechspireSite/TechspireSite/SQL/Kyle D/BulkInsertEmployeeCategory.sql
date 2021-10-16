BULK INSERT EmployeeCategory
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\EmployeeCategoryList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO
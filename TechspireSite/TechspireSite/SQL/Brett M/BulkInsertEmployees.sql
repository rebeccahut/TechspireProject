BULK INSERT Employee
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\EmployeeList.csv"
WITH
	(
	FIELDTERMINATOR = '~',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY 
	)
GO;
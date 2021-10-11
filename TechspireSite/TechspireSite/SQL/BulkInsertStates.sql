BULK INSERT EmployeeJob
FROM "D:\Dev\Python\TechspireProject\TechspireSite\SQL\Data\EmployeeJobList.csv"
WITH
	(
	FIELDTERMINATOR = '~',
	ROWTERMINATOR = '\n'
	)
GO;
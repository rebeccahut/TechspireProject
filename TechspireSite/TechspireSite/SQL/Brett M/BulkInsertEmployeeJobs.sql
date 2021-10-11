BULK INSERT EmployeeJob
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\EmployeeJobList.csv"
WITH
	(
	FIELDTERMINATOR = '~',
	ROWTERMINATOR = '\n'
	)
GO;
BULK INSERT EmployeeJob
FROM "D:\Scripts\Data\EmployeeJobList.csv"
WITH
	(
	FIELDTERMINATOR = '~',
	ROWTERMINATOR = '\n'
	)
GO
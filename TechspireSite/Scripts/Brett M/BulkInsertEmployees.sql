BULK INSERT Employee
FROM "D:\Scripts\Data\EmployeeList.csv"
WITH
	(
	FIELDTERMINATOR = '~',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY 
	)
GO
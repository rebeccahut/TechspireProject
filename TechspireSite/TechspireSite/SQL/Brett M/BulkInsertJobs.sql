BULK INSERT Job
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\JobList.csv"
WITH
	(
	FIELDTERMINATOR = '~',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY 
	)
GO;
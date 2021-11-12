-- Kyle Dela Pena
-- Categorized Average Employee Duration
-- Selects all the different employee classifications such as job role, category, and type and finds the average employment length of each.
-- The client can use this report to see which employee classification has the highest and lowest employee retention rate and determine the average length of employment, which can be helpful information that can be used to set the length of time before any employee receives a raise. The report could also be used to determine which job role, category, and type allows for the greatest employee retention rate. It is then up to the client to modify each job association to either increase or decrease the employee retention. This can be done by lowering or increases wages, adding or removing bonuses, and increasing or decreasing paid time off hours.
-- Employee Classifcation, Total Employee Days, Total Employee Count, Average Employment Length in Days, Average Employment Length in Months
-- ,right,right,right,right


SELECT  'All' AS 'Employee Classifcation',
		SUM(DATEDIFF(day, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() ))) AS 'Total Employee Days',
		COUNT(Employee.id) AS 'Total Employee Count',
        SUM(DATEDIFF(day, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() ))) / COUNT(Employee.id) AS 'Average Employment Length in Days',
		SUM(DATEDIFF(month, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() ))) / COUNT(Employee.id) AS 'Average Employment Length in Months'

FROM Employee
INNER JOIN EmployeeEmployeeCategory ON EmployeeEmployeeCategory.employee_id = Employee.id
INNER JOIN EmployeeCategory ON EmployeeEmployeeCategory.employee_category_id = EmployeeCategory.id

UNION

SELECT  'Salary' AS 'Employee Classifcation',
		SUM(DATEDIFF(day, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() ))) AS 'Total Employee Days',
		COUNT(Employee.id) AS 'Total Employee Count',
        SUM(DATEDIFF(day, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() ))) / COUNT(Employee.id) AS 'Average Employment Length in Days',
		SUM(DATEDIFF(month, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() ))) / COUNT(Employee.id) AS 'Average Employment Length in Months'

FROM Employee
INNER JOIN EmployeeEmployeeCategory ON EmployeeEmployeeCategory.employee_id = Employee.id
INNER JOIN EmployeeCategory ON EmployeeEmployeeCategory.employee_category_id = EmployeeCategory.id
WHERE EmployeeCategory.id = 1

UNION

SELECT  'Contractor' AS 'Employee Classifcation',
		SUM(DATEDIFF(day, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() ))) AS 'Total Employee Days',
		COUNT(Employee.id) AS 'Total Employee Count',
        SUM(DATEDIFF(day, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() ))) / COUNT(Employee.id) AS 'Average Employment Length in Days',
		SUM(DATEDIFF(month, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() ))) / COUNT(Employee.id) AS 'Average Employment Length in Months'

FROM Employee
INNER JOIN EmployeeEmployeeCategory ON EmployeeEmployeeCategory.employee_id = Employee.id
INNER JOIN EmployeeCategory ON EmployeeEmployeeCategory.employee_category_id = EmployeeCategory.id
WHERE EmployeeCategory.id = 2

UNION

SELECT  'Baker' AS 'Employee Classifcation',
		SUM(DATEDIFF(day, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() ))) AS 'Total Employee Days',
		COUNT(Employee.id) AS 'Total Employee Count',
        SUM(DATEDIFF(day, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() ))) / COUNT(Employee.id) AS 'Average Employment Length in Days',
		SUM(DATEDIFF(month, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() ))) / COUNT(Employee.id) AS 'Average Employment Length in Months'

FROM Employee
INNER JOIN EmployeeEmployeeCategory ON EmployeeEmployeeCategory.employee_id = Employee.id
INNER JOIN EmployeeCategory ON EmployeeEmployeeCategory.employee_category_id = EmployeeCategory.id
INNER JOIN EmployeeJob ON EmployeeJob.employee_id = Employee.id
INNER JOIN Job ON EmployeeJob.job_id = Job.id
WHERE Job.id = 1

UNION

SELECT  'Cashier' AS 'Employee Classifcation',
		SUM(DATEDIFF(day, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() ))) AS 'Total Employee Days',
		COUNT(Employee.id) AS 'Total Employee Count',
        SUM(DATEDIFF(day, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() ))) / COUNT(Employee.id) AS 'Average Employment Length in Days',
		SUM(DATEDIFF(month, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() ))) / COUNT(Employee.id) AS 'Average Employment Length in Months'

FROM Employee
INNER JOIN EmployeeEmployeeCategory ON EmployeeEmployeeCategory.employee_id = Employee.id
INNER JOIN EmployeeCategory ON EmployeeEmployeeCategory.employee_category_id = EmployeeCategory.id
INNER JOIN EmployeeJob ON EmployeeJob.employee_id = Employee.id
INNER JOIN Job ON EmployeeJob.job_id = Job.id
WHERE Job.id = 2

UNION

SELECT  'Full Time' AS 'Employee Classifcation',
		SUM(DATEDIFF(day, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() ))) AS 'Total Employee Days',
		COUNT(Employee.id) AS 'Total Employee Count',
        SUM(DATEDIFF(day, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() ))) / COUNT(Employee.id) AS 'Average Employment Length in Days',
		SUM(DATEDIFF(month, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() ))) / COUNT(Employee.id) AS 'Average Employment Length in Months'


FROM Employee
INNER JOIN EmployeeEmployeeCategory ON EmployeeEmployeeCategory.employee_id = Employee.id
INNER JOIN EmployeeCategory ON EmployeeEmployeeCategory.employee_category_id = EmployeeCategory.id
INNER JOIN EmployeeJob ON EmployeeJob.employee_id = Employee.id
INNER JOIN Job ON EmployeeJob.job_id = Job.id
INNER JOIN EmployeeType ON Employee.employee_type_id = EmployeeType.id
WHERE EmployeeType.id = 1

UNION

SELECT  'Part Time' AS 'Employee Classifcation',
		SUM(DATEDIFF(day, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() ))) AS 'Total Employee Days',
		COUNT(Employee.id) AS 'Total Employee Count',
        SUM(DATEDIFF(day, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() ))) / COUNT(Employee.id) AS 'Average Employment Length in Days',
		SUM(DATEDIFF(month, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() ))) / COUNT(Employee.id) AS 'Average Employment Length in Months'


FROM Employee
INNER JOIN EmployeeEmployeeCategory ON EmployeeEmployeeCategory.employee_id = Employee.id
INNER JOIN EmployeeCategory ON EmployeeEmployeeCategory.employee_category_id = EmployeeCategory.id
INNER JOIN EmployeeJob ON EmployeeJob.employee_id = Employee.id
INNER JOIN Job ON EmployeeJob.job_id = Job.id
INNER JOIN EmployeeType ON Employee.employee_type_id = EmployeeType.id
WHERE EmployeeType.id = 2

UNION 

SELECT  'Store 1' AS 'Employee Classifcation',
		SUM(DATEDIFF(day, Employee.begin_date, IIF(Employee.end_date IS NOT NULL , Employee.end_date, getdate() ))) AS 'Total Employee Days',
		COUNT(Employee.id) AS 'Total Employee Count',
        SUM(DATEDIFF(day, Employee.begin_date, IIF(Employee.end_date IS NOT NULL , Employee.end_date, getdate() ))) / COUNT(Employee.id) AS 'Average Employment Length in Days',
		SUM(DATEDIFF(month, Employee.begin_date, IIF(Employee.end_date IS NOT NULL , Employee.end_date, getdate() ))) / COUNT(Employee.id) AS 'Average Employment Length in Months'


FROM Employee
INNER JOIN EmployeeEmployeeCategory ON EmployeeEmployeeCategory.employee_id = Employee.id
INNER JOIN EmployeeCategory ON EmployeeEmployeeCategory.employee_category_id = EmployeeCategory.id
INNER JOIN EmployeeJob ON EmployeeJob.employee_id = Employee.id
INNER JOIN Job ON EmployeeJob.job_id = Job.id
INNER JOIN EmployeeType ON Employee.employee_type_id = EmployeeType.id
INNER JOIN Store ON EmployeeJob.store_id = Store.id

WHERE EmployeeJob.store_id = 1

UNION 

SELECT  'Store 2' AS 'Employee Classifcation',
		SUM(DATEDIFF(day, Employee.begin_date, IIF(Employee.end_date IS NOT NULL , Employee.end_date, getdate() ))) AS 'Total Employee Days',
		COUNT(Employee.id) AS 'Total Employee Count',
        SUM(DATEDIFF(day, Employee.begin_date, IIF(Employee.end_date IS NOT NULL , Employee.end_date, getdate() ))) / COUNT(Employee.id) AS 'Average Employment Length in Days',
		SUM(DATEDIFF(month, Employee.begin_date, IIF(Employee.end_date IS NOT NULL , Employee.end_date, getdate() ))) / COUNT(Employee.id) AS 'Average Employment Length in Months'


FROM Employee
INNER JOIN EmployeeEmployeeCategory ON EmployeeEmployeeCategory.employee_id = Employee.id
INNER JOIN EmployeeCategory ON EmployeeEmployeeCategory.employee_category_id = EmployeeCategory.id
INNER JOIN EmployeeJob ON EmployeeJob.employee_id = Employee.id
INNER JOIN Job ON EmployeeJob.job_id = Job.id
INNER JOIN EmployeeType ON Employee.employee_type_id = EmployeeType.id
INNER JOIN Store ON EmployeeJob.store_id = Store.id

WHERE EmployeeJob.store_id = 2



/*
SELECT  COUNT(Employee.id) AS 'NumEmployeeStart',
	   (SELECT COUNT(Employee.id) AS 'Num of Employees'
		FROM Employee
		INNER JOIN EmployeeJob ON EmployeeJob.employee_id = Employee.id
		INNER JOIN Job ON EmployeeJob.job_id = Job.id
		INNER JOIN EmployeeType ON Employee.employee_type_id = EmployeeType.id
		INNER JOIN EmployeeStatus ON Employee.employee_status_id = EmployeeStatus.id
		INNER JOIN EmployeeEmployeeCategory ON EmployeeEmployeeCategory.employee_id = Employee.id
		INNER JOIN EmployeeCategory ON EmployeeEmployeeCategory.employee_category_id = EmployeeCategory.id
		INNER JOIN Store ON EmployeeJob.store_id = Store.id
		WHERE Employee.begin_date >= '1/1/2015'
		AND EmployeeStatus.is_active = 1) AS 'NumEmployeeEnd'
		--('NumEmployeeEnd' - 'NumEmployeeEnd') / 'NumEmployeeEnd' AS 'Retention Rate'
		--SET @RetentionRate = (@NumStart -@NumEnd) / @NumStart AS 'Retention Rate'
		
FROM Employee  
WHERE Employee.begin_date <= '1/1/2012'
*/




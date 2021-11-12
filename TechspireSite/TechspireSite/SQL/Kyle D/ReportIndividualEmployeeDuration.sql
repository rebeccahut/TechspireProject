-- Kyle Dela Pena
-- Individual Employee Duration  
-- Selects all employees and their duration of employment with other employee information.
-- At the top of the report, the most senior employees are listed, helpful when client wants to reward the workers who are most loyal to her in terms of length of time worked. 
-- Row Number, First Name, Last name, Duration in Days, Job Name, Type Name, Category Name, Status Name, End Date
-- ,,,right,,,,,

SELECT ROW_NUMBER() 
OVER(ORDER BY Employee.last_name) AS 'Row Num', 
Employee.first_name AS 'First Name', 
Employee.last_name AS 'Last Name', 
DATEDIFF(day, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() )) AS 'Duration in days', 
Job.job_name AS 'Job Name', 
EmployeeType.type_name AS 'Type Name', 
EmployeeCategory.category_name AS 'Category Name', 
EmployeeStatus.status_name AS 'Status Name', 
Employee.end_date AS 'End Date'

FROM Employee
INNER JOIN EmployeeJob ON EmployeeJob.employee_id = Employee.id
INNER JOIN Job ON EmployeeJob.job_id = Job.id
INNER JOIN EmployeeType ON Employee.employee_type_id = EmployeeType.id
INNER JOIN EmployeeStatus ON Employee.employee_status_id = EmployeeStatus.id
INNER JOIN EmployeeEmployeeCategory ON EmployeeEmployeeCategory.employee_id = Employee.id
INNER JOIN EmployeeCategory ON EmployeeEmployeeCategory.employee_category_id = EmployeeCategory.id

GROUP BY Employee.first_name, Employee.last_name, Job.job_name, EmployeeType.type_name, EmployeeCategory.category_name, EmployeeStatus.status_name, Employee.end_date, Employee.begin_date
ORDER BY 'Duration in days' DESC

/*
SELECT  SUM(DATEDIFF(day, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() ))) as total_employee_days,
        COUNT(id) as total_employee_count,
        SUM(DATEDIFF(day, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() ))) / COUNT(id) as avg_employment_length
FROM Employee
*/

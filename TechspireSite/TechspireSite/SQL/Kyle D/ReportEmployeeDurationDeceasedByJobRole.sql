-- Kyle Dela Pena
-- Employment Duration of deceased employees based on job role
-- Report can be used to find the most dangerous job for an employee
-- Displays decased bakers with their associations along with the date they stopped being an employee
-- row num, first name, last name, duration, type name, category name, end date -ordered by duration, last name

SELECT ROW_NUMBER() 
OVER(ORDER BY Employee.last_name) AS 'Row Num', 
Employee.first_name AS 'First Name', 
Employee.last_name AS 'Last Name', 
DATEDIFF(day, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() )) AS 'Duration in days',
Job.job_name AS 'Job Name', 
Employee.end_date AS 'End Date'

FROM Employee
INNER JOIN EmployeeJob ON EmployeeJob.employee_id = Employee.id
INNER JOIN Job ON EmployeeJob.job_id = Job.id
INNER JOIN EmployeeType ON Employee.employee_type_id = EmployeeType.id
INNER JOIN EmployeeStatus ON Employee.employee_status_id = EmployeeStatus.id
INNER JOIN EmployeeEmployeeCategory ON EmployeeEmployeeCategory.employee_id = Employee.id
INNER JOIN EmployeeCategory ON EmployeeEmployeeCategory.employee_category_id = EmployeeCategory.id

WHERE EmployeeStatus.id = 4
ORDER BY EmployeeJob.id
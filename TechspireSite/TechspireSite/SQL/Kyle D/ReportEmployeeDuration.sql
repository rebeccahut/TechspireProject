-- Kyle Dela Pena
-- Employment duration of all employees
-- Report can be used for finding the correlation between the most senior employees and their different job associations (e.g. role, category, and type).
-- Displays all employees with their associations along with the date they stopped being an employee
-- row num, first name, last name, duration, job name, type name, category name, status name, end date -ordered by duration, last name

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

ORDER BY 'Duration in days' DESC
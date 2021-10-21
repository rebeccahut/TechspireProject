-- Kyle Dela Pena
-- Newest employees based on job role
-- Report can be used to see all the new hires so that the client can assign training with ease
-- Displays new hires with all the different employee associations along with contact information (new hire <= 20 days)
-- row num, first name, last name, duration, job name, type name, category name, status name, end date -ordered by duration, last name

SELECT ROW_NUMBER() 
OVER(ORDER BY Job.job_name) AS num_row, Employee.first_name, Employee.last_name, Employee.email_address, DATEDIFF(day, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() )) AS duration_days, Job.job_name, EmployeeStatus.status_name, EmployeeType.type_name, EmployeeCategory.category_name, Employee.end_date 
from Employee
INNER JOIN EmployeeJob ON EmployeeJob.employee_id = Employee.id
INNER JOIN Job ON EmployeeJob.job_id = Job.id
INNER JOIN EmployeeType ON Employee.employee_type_id = EmployeeType.id
INNER JOIN EmployeeStatus ON Employee.employee_status_id = EmployeeStatus.id
INNER JOIN EmployeeEmployeeCategory ON EmployeeEmployeeCategory.employee_id = Employee.id
INNER JOIN EmployeeCategory ON EmployeeEmployeeCategory.employee_category_id = EmployeeCategory.id
WHERE (DATEDIFF(day, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() ))) <= 20
ORDER BY duration_days

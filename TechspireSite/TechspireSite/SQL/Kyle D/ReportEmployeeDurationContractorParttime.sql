-- Kyle Dela Pena
-- Duration of employment of contract employees who are also part time
-- Report can be used for finding the correlation between part time-contract employees and their job role
-- Displays contract employees, who are also part time, with their associations along with the date they stopped being an employee
-- row num, first name, last name, duration, job name, status name, end date -ordered by duration, last name

SELECT ROW_NUMBER() 
OVER(ORDER BY Employee.last_name) AS num_row, Employee.first_name, Employee.last_name, DATEDIFF(day, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() )) AS duration_days, Job.job_name, EmployeeStatus.status_name, Employee.end_date 
from Employee
INNER JOIN EmployeeJob ON EmployeeJob.employee_id = Employee.id
INNER JOIN Job ON EmployeeJob.job_id = Job.id
INNER JOIN EmployeeType ON Employee.employee_type_id = EmployeeType.id
INNER JOIN EmployeeStatus ON Employee.employee_status_id = EmployeeStatus.id
INNER JOIN EmployeeEmployeeCategory ON EmployeeEmployeeCategory.employee_id = Employee.id
INNER JOIN EmployeeCategory ON EmployeeEmployeeCategory.employee_category_id = EmployeeCategory.id
WHERE EmployeeCategory.id = 2
AND EmployeeType.id = 2
ORDER BY duration_days DESC
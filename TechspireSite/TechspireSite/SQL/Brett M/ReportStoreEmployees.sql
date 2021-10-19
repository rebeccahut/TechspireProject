--Row Number,Type,First Name,Last Name,

SELECT ROW_NUMBER() 
OVER(ORDER BY EmployeeType.id,Employee.first_name) AS num_row, EmployeeType.type_name, Employee.first_name, Employee.last_name
FROM "EmployeeJob"
INNER JOIN Employee ON Employee.id = EmployeeJob.employee_id
INNER JOIN EmployeeType ON Employee.employee_type_id = EmployeeType.id
INNER JOIN Job ON EmployeeJob.job_id = Job.id
INNER JOIN EmployeeStatus ON Employee.employee_status_id = EmployeeStatus.id
WHERE EmployeeJob.store_id = 1 
AND EmployeeJob.job_id = 1 
AND EmployeeStatus.is_active = 1
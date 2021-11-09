--Brett Meirhofer
--Active Cashiers At Store One
--The client can use this report to contact employees that perform a specific job at a specific location.
--Displays only active employees at a location that preform a specific job along with their contact details.
--Row Number,Type,First Name,Last Name,Phone Number,Email Address

SELECT ROW_NUMBER() 
OVER(ORDER BY EmployeeType.id,Employee.first_name) AS num_row, EmployeeType.type_name, 
Employee.first_name, Employee.last_name, 
CONCAT(SUBSTRING(Employee.phone_number,1,2),'-',SUBSTRING(Employee.phone_number,3,3),
'-',SUBSTRING(Employee.phone_number,6, 3), '-',SUBSTRING(Employee.phone_number,9, 12))
AS PhoneNumber,
Employee.email_address
FROM EmployeeJob
INNER JOIN Employee ON Employee.id = EmployeeJob.employee_id
INNER JOIN EmployeeType ON Employee.employee_type_id = EmployeeType.id
INNER JOIN Job ON EmployeeJob.job_id = Job.id
INNER JOIN EmployeeStatus ON Employee.employee_status_id = EmployeeStatus.id
WHERE EmployeeJob.store_id = 1 
AND EmployeeJob.job_id = 2 
AND EmployeeStatus.is_active = 1




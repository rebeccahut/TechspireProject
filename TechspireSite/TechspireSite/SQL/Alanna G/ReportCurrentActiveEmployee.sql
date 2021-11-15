--Alanna Gilcrease
--Current Active Employees
--The client could use this report to view a list of current active employees. For example, the client could use this report to call employees in the event of an emergency or to call someone in to work if shorthanded.
--This report displays all active employees, phone number, their job title, and store location.  
--Row Number,First Name,Last Name,Phone Number,Job Title
--,,,phone,

SELECT ROW_NUMBER () OVER(ORDER BY Job.job_name, Employee.last_name) AS 'Row Number',
Employee.first_name AS 'First Name',
Employee.last_name AS 'Last Name',
Employee.phone_number AS 'Phone Number',
Job.job_name AS 'Job Title'

FROM Employee

INNER JOIN EmployeeJob 
ON EmployeeJob.employee_id = Employee.id

INNER JOIN Job 
ON EmployeeJob.job_id = Job.id

INNER JOIN EmployeeType
ON Employee.employee_type_id = EmployeeType.id

INNER JOIN EmployeeStatus
ON Employee.employee_status_id = EmployeeStatus.id

INNER JOIN EmployeeEmployeeCategory 
ON EmployeeEmployeeCategory.employee_id = Employee.id

INNER JOIN EmployeeCategory 
ON EmployeeEmployeeCategory.employee_category_id = EmployeeCategory.id

WHERE EmployeeStatus.id = 1 AND EmployeeJob.store_id = 1


--Start Date, First Name, Last Name

SELECT EmployeeJob.assign_date, Employee.first_name, Employee.last_name
FROM EmployeeJob
INNER JOIN Job ON Job.id = EmployeeJob.job_id
INNER JOIN Employee ON Employee.id = EmployeeJob.employee_id
WHERE Job.id = 1;
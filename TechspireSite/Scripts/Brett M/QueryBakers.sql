SELECT EmployeeJob.assign_date, EmployeeJob.Employee, Employee.first_name, Employee.last_name
FROM EmployeeJob
INNER JOIN Job ON Job.id = EmployeeJob.Job
INNER JOIN Employee ON Employee.id = EmployeeJob.Employee
WHERE Job.id = 1;
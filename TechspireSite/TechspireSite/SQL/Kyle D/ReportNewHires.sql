-- Kyle Dela Pena
-- New Hires
-- Displays all new employees within a given time along with contact information and job associations such as job role, type, and category.
-- The client can use this report to contact new hires and assign them training based on their job role, type, and category. One association might have more priority than the other, for example, the first store could need a full-time Baker immediately. The second store could also need a part-time cashier contractor role, but that is a lower priority because it is not an immediate necessity as that is a future requirement.
-- Row Num, First Name, Last Name, Duration in Days, Job Name, Store Name, Type Name, Category Name, Email Address, Start Date
-- ,,,right,,,,,

SELECT ROW_NUMBER() 
OVER(ORDER BY EmployeeType.id, Employee.last_name) AS 'Row Num', 
Employee.first_name AS 'First Name', 
Employee.last_name AS 'Last Name', 
DATEDIFF(day, Employee.begin_date, IIF(Employee.end_date IS NOT NULL , Employee.end_date, getdate() )) AS 'Duration in days', 
Job.job_name AS 'Job Name', 
Store.store_name AS 'Store Name',
EmployeeType.type_name AS 'Type Name', 
EmployeeCategory.category_name AS 'Category Name', 
Employee.email_address AS 'Email Address',
Employee.begin_date AS 'Start Date'

FROM Employee
INNER JOIN EmployeeJob ON EmployeeJob.employee_id = Employee.id
INNER JOIN Job ON EmployeeJob.job_id = Job.id
INNER JOIN EmployeeType ON Employee.employee_type_id = EmployeeType.id
INNER JOIN EmployeeStatus ON Employee.employee_status_id = EmployeeStatus.id
INNER JOIN EmployeeEmployeeCategory ON EmployeeEmployeeCategory.employee_id = Employee.id
INNER JOIN EmployeeCategory ON EmployeeEmployeeCategory.employee_category_id = EmployeeCategory.id
INNER JOIN Store ON EmployeeJob.store_id = Store.id

WHERE (DATEDIFF(day, Employee.begin_date, IIF(Employee.end_date IS NOT NULL , Employee.end_date, getdate() ))) <= 2000
AND EmployeeStatus.is_active = 1
--GROUP BY Employee.first_name, Employee.last_name, Job.job_name, EmployeeType.type_name, EmployeeCategory.category_name, EmployeeStatus.status_name, Employee.end_date, Employee.begin_date, EmployeeType.id, Employee.email_address, Employee.id, EmployeeJob.store_id, Store.store_name
ORDER BY [Duration in days] DESC

-- created a new column that states the date at which the employee is assigned a category
UPDATE EmployeeEmployeeCategory
SET EmployeeEmployeeCategory.assign_date = Employee.begin_date
FROM Employee
INNER JOIN EmployeeEmployeeCategory ON EmployeeEmployeeCategory.employee_id = Employee.id
INNER JOIN EmployeeCategory ON EmployeeEmployeeCategory.employee_category_id = EmployeeCategory.id

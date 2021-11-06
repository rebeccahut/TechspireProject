--Umair Shamsuddin
--Employee Amount of Loyalty Sign-ins
--The client can use this report as a way to keep track of the number of customers signed up for loyalty membership per employee.
--Displays employees, the store they work at, and the cusotmers information.
--Row number, employee first name, employee last name, store id, customer first name, customer last name, begin date, and employee status id.

SELECT ROW_NUMBER() 

OVER(ORDER BY Employee.first_name ASC) AS Row_Num, 
Employee.first_name AS "Employee First Name", 
Employee.last_name AS "Employee Last Name",
EmployeeStatus.id AS "Employee Status",
Store.id AS "Store", 
Customer.first_name AS "Customer First Name",
Customer.last_name AS "Customer Last Name",
Customer.begin_date AS "Loyalty Membership Beginning"

FROM Employee
INNER JOIN Store ON Store.id = Employee.id
INNER JOIN Customer ON Customer.id = Store.id
INNER JOIN EmployeeStatus ON EmployeeStatus.id = Employee.id


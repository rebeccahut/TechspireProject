--Umair Shamsuddin
--Employee Amount of Manual Points
--The client can use this report as a way to keep track of the amount of points that are added to a customer manually.
--Displays employee first and last name, the amount of points, the reason name, and the id, first and last name of the customer.
--Row number,first_name,last_name,points_amount,reason_name,reason_desc,id,first_name,last_name

Select ROW_NUMBER()

OVER(ORDER BY Employee.first_name) AS num_row,
Employee.first_name AS "Employee First Name",
Employee.last_name AS "Employee Last Name",
PointLog.points_amount AS "Number of Points",
PointReasonType.reason_name AS "Reason",
PointReasonType.reason_desc AS "Description",
Customer.id AS "Customer ID",
Customer.first_name AS "Customer First Name",
Customer.last_name AS "Customer Last Name",

FROM Employee
INNER JOIN PointLog ON Employee.employee_id = Employee.id
INNER JOIN PointReasonType ON PointReasonType.id = PointLog.reason_id
INNER JOIN Customer ON Customer.id = Customer.create_employee_id
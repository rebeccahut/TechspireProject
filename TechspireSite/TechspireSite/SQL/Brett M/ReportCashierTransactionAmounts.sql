--Brett Meirhofer
--Cashier Transaction Performance Historical
--The client can use this report in order to compare the performance of their current cashiers agaisnt historical cashier performance.
--Displays all the cashiers and the total amount of customer spending with them acting as the cashier.
--Row Number,Employee Name,Email,Status,Type,Transaction Count,Total Spending,Avg Spending
--,,,,,,right,right

SELECT ROW_NUMBER() OVER(ORDER BY EmployeeStatus.id, EmployeeType.id, Totals.total) AS "Row",
CONCAT(Employee.first_name, ' ', Employee.last_name)AS "Employee Name", 
Employee.email_address AS Email,
EmployeeStatus.status_name AS "Status", 
EmployeeType.type_name AS "Type", 
Actions.total AS Orders, 
CONCAT('$', CAST(Totals.total as decimal(18,2)))AS "Total Sales", 
CONCAT('$', CAST(Totals.total/Actions.total as decimal(18,2))) AS "Avg Sales Per Order"
FROM
(SELECT
SUM ("ORDER".final_total) AS total, "Order".employee_id
FROM "ORDER"
GROUP BY "Order".employee_id)
AS Totals
INNER JOIN Employee ON Employee.id = Totals.employee_id
INNER JOIN EmployeeType ON Employee.employee_type_id = EmployeeType.id
INNER JOIN EmployeeStatus ON Employee.employee_status_id = EmployeeStatus.id
INNER JOIN (SELECT
COUNT (*) AS total, "Order".employee_id
FROM "ORDER"
GROUP BY "Order".employee_id)
AS Actions ON Employee.id = Actions.employee_id




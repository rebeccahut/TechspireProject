--Brett Meirhofer
--Cashier Customer Performance Historical
--The client can use this report in order to compare the performance of their current cashiers agaisnt historical cashier performance.
--Displays all the cashiers and the total amount of customer spending with them acting as the cashier.
--Row Number,First Name,Last Name,Status,Type,Transaction Count,Total Spending,Avg Spending


SELECT ROW_NUMBER() OVER(ORDER BY EmployeeStatus.id, EmployeeType.id, Totals.total) AS num_row,
Employee.first_name, Employee.last_name, EmployeeStatus.status_name, EmployeeType.type_name, Actions.total, 
CONCAT('$', CAST(Totals.total as decimal(18,2))), CONCAT('$', CAST(Totals.total/Actions.total as decimal(18,2)))
FROM
(SELECT
SUM ("ORDER".final_total) AS total, "Order".employee_id
FROM "ORDER"
GROUP BY "Order".employee_id)
AS Totals
INNER JOIN Employee on Employee.id = Totals.employee_id
INNER JOIN EmployeeType on Employee.employee_type_id = EmployeeType.id
INNER JOIN EmployeeStatus on Employee.employee_status_id = EmployeeStatus.id
INNER JOIN (SELECT
COUNT (*) AS total, "Order".employee_id
FROM "ORDER"
GROUP BY "Order".employee_id)
as Actions ON Employee.id = Actions.employee_id




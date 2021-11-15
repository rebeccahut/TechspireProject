--Jade Nguyen
--Employee Log for Manually Inputted Points
--The client can use this report to determine which employees have manually inputted points the most, as well as the reasons why for their actions. This is important to know for the client because it gives the client perspective in understanding if points were allocated correctly, incorrectly, due to issues with the store, or due to issues with the customers. 
--Displays only the employees who have manually inputted points, not manually subtracted points, as well as the customer details and order numbers that are associated with the manual input of points, specifically if it is not because of an order.
--Row Number, Employee First Name, Employee Last Name, Customer First Name, Customer Last Name, Order Number, Order Date, Reason
--,,,,,,,,

SELECT ROW_NUMBER() 

OVER(ORDER BY Employee.id, "Order".order_date) AS num_row, 
Employee.first_name AS "Employee First Name", 
Employee.last_name AS "Employee Last Name", 
Customer.first_name AS "Customer First Name", 
Customer.last_name AS "Customer Last Name", 
"Order".id AS "Order Number", 
"Order".order_date AS "Order Date",
PointLog.points_amount AS "Points Inputted",
PointReasonType.reason_name AS "Reason"

FROM PointLog
INNER JOIN Employee ON Employee.id = PointLog.employee_id
INNER JOIN Customer ON PointLog.customer_id = Customer.id
INNER JOIN "Order" ON PointLog.order_id = "Order".id
INNER JOIN PointReasonType ON PointLog.reason_id = PointReasonType.id
WHERE PointReasonType.id <> 4

--Jade Nguyen
--Points Spent Per Customer
--The client can use this report to analyze which customers have spent points in association with which order on specific dates. This will help the client determine which customer is shown to regularly use their points, as well as around what period points are being used more often. 
--Displays only the customers that have used points and the orders in conjunction with the point usage. In addition, the order number and date are detailed to serve as a guide in case the client would like to investigate a particular order more. 
--Row Number, First Name, Last Name, Order Number, Order Date, Points Used
--,,,,,,

SELECT ROW_NUMBER() 
OVER(ORDER BY "Order".order_date) AS num_row, 
Customer.first_name AS "First Name", 
Customer.last_name AS "Last Name", 
"Order".id AS "Order Number", 
"Order".order_date AS "Order Date",
ABS(PointLog.points_amount) AS "Points Used",
PointReasonType.reason_name AS "Reason Name"

FROM PointLog
INNER JOIN Customer ON Customer.id = PointLog.customer_id
INNER JOIN CustomerStatus ON CustomerStatus.id = Customer.customer_status_id
INNER JOIN "Order" ON "Order".id = PointLog.order_id
INNER JOIN PointReasonType ON PointReasonType.id = PointLog.reason_id
WHERE PointLog.points_amount < 0

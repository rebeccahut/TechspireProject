--Jade Nguyen
--Total Points Accumulated Per Customer
--The client can use this report to analyze which customers have accumulated the most points based on their entire order history. This will help the client easily view her most-valuable customers as well as understand the retention rate she has of her customers. 
--Displays only the customers that have accumulated points in an order of who has accumulated the most to the least. 
--Row Number, First Name, Last Name, Order Number, Order Date, Point Reason Name, Reward Name

SELECT ROW_NUMBER() 
OVER(ORDER BY Customer.first_name) AS num_row, 
Customer.first_name AS "Customer First Name", 
Customer.last_name AS "Customer Last Name", 
"Order".id AS "Order #", 
"Order".order_date AS "Order Date",
PointReasonType.reason_name AS "Reason"

FROM PointLog
INNER JOIN Customer ON PointLog.customer_id = Customer.id
INNER JOIN "Order" ON PointLog.order_id = "Order".id
INNER JOIN PointReasonType ON PointLog.reason_id = PointReasonType.id
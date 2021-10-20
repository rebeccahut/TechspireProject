--Jade Nguyen
--Points Spent Per Customer
--The client can use this report to analyze which customers have spent the most points and which reward was typically associated with the point usage. This will help the client determine which rewards are popular amongst her customers, as well as the frequency of point usage amongst her customers. 
--Displays only the customers that have used points and the rewards that they have used in conjunction with the point usage. In addition, the order is detailed to serve as a guide in case the client would like to look into a particular order more. 
--Row Number, First Name, Last Name, Order Number, Order Date, Point Reason Name, Reward Name

SELECT ROW_NUMBER() 
OVER(ORDER BY Customer.first_name) AS num_row, 
Customer.first_name AS "Customer First Name", 
Customer.last_name AS "Customer Last Name", 
"Order".id AS "Order #", 
"Order".order_date AS "Order Date"
PointReasonType.reason_name AS "Reason", 
Reward.reward_name AS "Reward Used"

FROM PointLog
INNER JOIN Customer ON PointLog.customer_id = Customer.id
INNER JOIN "Order" ON PointLog.order_id = "Order".id
INNER JOIN PointReasonType ON PointLog.reason_id = PointReasonType.id
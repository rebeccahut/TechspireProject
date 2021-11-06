--Jade Nguyen
--Total Points Accumulated Per Customer
--The client can use this report to analyze which customers have accumulated the most points based on their entire order history. This will help the client easily view her most-valuable customers as well as understand the retention rate she has of her customers. 
--Displays only the customers that have accumulated points in an order of who has accumulated the most to the least. 
--Row Number, First Name, Last Name, Points Accumulated, Category Name

SELECT ROW_NUMBER() 
OVER(ORDER BY Points."Points Accumulated" DESC) AS num_row, 
Customer.first_name AS "Customer First Name", 
Customer.last_name AS "Customer Last Name", 
Points."Points Accumulated",
CustomerCategory.category_name AS "Category Name"

FROM Customer
INNER JOIN CustomerStatus ON CustomerStatus.id = Customer.customer_status_id
INNER JOIN "Order" ON Customer.id = "Order".customer_id
INNER JOIN (SELECT SUM(PointLog.points_amount) AS "Points Accumulated", PointLog.order_id
			FROM PointLog
			WHERE PointLog.points_amount > 0
			GROUP BY PointLog.order_id) 
			AS Points ON "Order".id = Points.order_id
INNER JOIN CustomerCustomerCategory ON CustomerCustomerCategory.customer_id = Customer.id
INNER JOIN CustomerCategory ON CustomerCustomerCategory.customer_category_id = CustomerCategory.id
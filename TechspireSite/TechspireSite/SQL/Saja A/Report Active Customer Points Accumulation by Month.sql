-- Saja Alyasin
-- Points accumulated by an active customer by month
-- Client can use this report to determine an active customer's accumulation of points in a given month
-- Displays the points accumulated by an active customer in a given month 
-- Row Number, First name, Last name, Points Accumulated, Category name
--,,,,,


SELECT ROW_NUMBER() 
OVER(ORDER BY Points."Points Accumulated" DESC) AS Row_Num, 
Customer.first_name AS "Customer First Name", 
Customer.last_name AS "Customer Last Name",
Points."Points Accumulated",
CustomerCategory.category_name AS "Category"


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

WHERE DATEPART(m FROM Customer.begin_date) = '6' 
AND DATEPART(yyyy FROM Customer.begin_date) = '2010'
AND CustomerStatus.id = '1'

GROUP BY Customer.begin_date, Customer.first_name, Customer.last_name, Points.order_id, Points."Points Accumulated", CustomerCategory.category_name
ORDER BY MIN(Customer.begin_date);

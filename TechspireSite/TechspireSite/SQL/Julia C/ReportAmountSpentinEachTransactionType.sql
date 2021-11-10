-- Julia Chen
-- Lifetime Amount Spent In Each Payment Type
-- report displays a customer's used payments and historical info attached to each type
-- client can use this report for business decisions and analyze a customer's preferred method of purchasing
--ROW_NUM,First Name,Last Name,Transaction Type,Number of Transactions,Lifetime Spent

SELECT ROW_NUMBER()
OVER(ORDER BY PaymentType.type_name) AS ROW_NUM,
Customer.first_name AS 'First Name',
Customer.last_name AS 'Last Name',
PaymentType.type_name AS 'Transaction Type',
COUNT(PaymentType.type_name) AS '# Transactions',
CONCAT('$', CAST(SUM("Order".final_total) as decimal(18,2))) AS 'Lifetime Spent'

FROM PaymentType
INNER JOIN "Order" on PaymentType.id = "Order".payment_type_id
INNER JOIN Customer on "Order".customer_id = Customer.id
INNER JOIN PointLog on Customer.id = PointLog.customer_id

WHERE Customer.customer_status_id = 1
GROUP BY Customer.first_name, Customer.last_name, PaymentType.type_name
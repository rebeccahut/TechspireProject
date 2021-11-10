-- Julia Chen
-- Lifetime Amount Spent In Each Payment Type
-- The client may have a business need where she would like to encourage customers to use a specific payment type. The client may also have a need to view which payment methods are popularly used amongst her customer base; this data could be used to inform the client the viability of adding in or removing payment methods. Consider in the future, she added another payment method and wished to see if that payment option is popular with her customer base. If customers do not seem use the payment option, then the vendor fees associated with offering that payment type may be too costly to justify to continue to offer to her customers. 
-- Displays the Lifetime amount of dollars spent under each customer loyalty account via a specific payment type. 
--ROW_NUM,First Name,Last Name,Transaction Type,# Transactions,Lifetime Spent
-- ,,,,,right

SELECT ROW_NUMBER()
OVER(ORDER BY PaymentType.type_name) AS ROW_NUM,
Customer.first_name AS 'First Name',
Customer.last_name AS 'Last Name',
PaymentType.type_name AS 'Transaction Type',
COUNT(PaymentType.type_name) AS '# Transactions',
CONCAT('$', CAST(SUM("Order".final_total)AS DECIMAL(18,2))) AS 'Lifetime Spent'

FROM PaymentType
INNER JOIN "Order" on PaymentType.id = "Order".payment_type_id
INNER JOIN Customer on "Order".customer_id = Customer.id
INNER JOIN PointLog on Customer.id = PointLog.customer_id

WHERE Customer.customer_status_id = 1
GROUP BY Customer.first_name, Customer.last_name, PaymentType.type_name
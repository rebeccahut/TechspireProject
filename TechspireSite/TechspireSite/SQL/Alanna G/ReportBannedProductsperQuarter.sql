--Alanna Gilcrease
--Banned Products per Quarter
--This report will allow the client to view all products that are banned from the loyalty reward program for the quarter.These are either too expensive or for a custom order. The client may choose to use this report to add or remove products from the list of banned products on a quarterly basis. For example, the client may allow a product that is normally banned to apply for loyalty points as an incentive for the quarter.
--No Description
--Row,Ban Reason,Product,Product,Price,Date
--,,,,,



SELECT ROW_NUMBER () OVER(ORDER BY Product.product_name, Product.product_price) AS 'Row Num',
BanType.ban_name AS 'Ban Reason',
Product.id AS 'Product ID',
Product.product_name AS 'Product Name',
CONCAT('$', CAST (Product.product_price as decimal(18,2))) AS 'Product Price',
"Order".order_date AS 'Per Quarter'

FROM Product

INNER JOIN BanType 
ON BanType.id = Product.ban_reason_id

INNER JOIN OrderLine
ON product_id = OrderLine.product_id

INNER JOIN "Order"
ON order_date = "Order".order_date

WHERE order_date BETWEEN '2015-03-01' AND '2015-06-01'

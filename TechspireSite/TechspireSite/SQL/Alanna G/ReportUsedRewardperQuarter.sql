--Alanna Gilcrease
--Customer Used Reward per Quarter
--The client could use this report to view a list of rewards that have been redeemed 
--per quarter. The client can view which quarter had been historically favorable and 
--utilize the same incentives to entice customer purchases when numbers are low. For
--example, if redeemed points for the quarter are low, the client can give customers 
--more incentives to entice more purchases. Once the incentive period is over, the 
--client can view the redeemed points for that period and see if the numbers improved.  

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
ON Product.id = OrderLine.product_id

INNER JOIN "Order" 
ON Orderline.order_id = "Order".id

WHERE  "Order".order_date BETWEEN '2020-09-01' AND '2020-10-01'
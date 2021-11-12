--Alanna Gilcrease
--Products Sold at Specific Store
--The client could use this report to list and compare what product each store sells, the quantity of each product sold, and the amount of each product sold. The client can utilize this to discontinue low selling products or have more high selling products in stock. 
--NO DESCRIPTION
--Row,Product ID,Product,Store,Quantity,Price
--,,,,,

SELECT ROW_NUMBER () OVER(ORDER BY product.id) AS 'Row Num',
Product.id AS 'Product ID',
Product.product_name AS 'Product',
Store.store_name AS 'Store',
OrderLine.quantity AS 'Quantity',
CONCAT('$', CAST (OrderLine.ind_price as decimal(18,2))) AS 'Price'

FROM Product

INNER JOIN OrderLine
ON OrderLine.product_id = Product_id

INNER JOIN "Order"
ON OrderLine.order_id = "Order".id

INNER JOIN Store 
ON Store.store_name = store_name

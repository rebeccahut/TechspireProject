--Alanna Gilcrease
--Products Sold at Specific Store
--The client could use this report to list and compare what product each store sells,
--the quantity of each product sold, and the amount of each product sold.
--Displays all products sold at each store
--Row Number, Product Name, Status, Store Name

SELECT ROW_NUMBER () OVER(ORDER BY ProductType.id) AS 'Row Num',
Store.store_name AS 'Store',
Product.id AS 'ID',
Product.product_name AS 'Product',
ProductType.product_type_desc AS 'Description',
OrderLine.quantity AS 'Quantity',
OrderLine.total_price AS 'Price'

FROM Product
INNER JOIN OrderLine ON OrderLine.order_id = "Order".id
INNER JOIN BanType ON BanType.id = Product.ban_reason_id
INNER JOIN ProductType ON ProductType.id = Product.id
INNER JOIN StoreProduct ON StoreProduct.product_id = Product.id
INNER JOIN Store ON StoreProduct.store_id = Store.id
INNER JOIN ProductStatus ON ProductStatus.id = Product.id
INNER JOIN "Order" ON "Order".store_id = OrderLine.id

WHERE Store.id = 2
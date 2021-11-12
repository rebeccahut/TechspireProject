--Alanna Gilcrease
--Banned Products
--This report allows the client to view all banned products. These products are either too expensive or for a custom order.
--The client may choose to use this report to add or remove products from the list of banned products. The client can verify if the item is active or inactive.
--Row Num, Product ID, Product Type, Product Name, Ban Reason, Product Status, Product Price
--,,,,,,right

SELECT ROW_NUMBER () OVER(ORDER BY Product.product_name, Product.product_price) AS 'Row Num',
Product.id AS 'Product ID',
ProductType.product_type_name AS 'Product Type',
Product.product_name AS 'Product Name',
BanType.ban_name AS 'Ban Reason',
ProductStatus.status_name AS 'Product Status',
CONCAT('$', CAST (Product.product_price as decimal(18,2))) AS 'Product Price'
FROM Product
INNER JOIN BanType ON BanType.id = Product.ban_reason_id
INNER JOIN ProductStatus ON ProductStatus.id = Product.product_status_id
INNER JOIN ProductType ON ProductType.id = Product.product_type_id
WHERE BanType.id = 1



--Alanna Gilcrease
--Banned Products per Quarter
--This report will allow the client to view all products that are banned from the loyalty reward program for the quarter.
--These are product items that the client does not give additional discounts on.
--Displays all banned products.
--Row Number, Ban id, Product Name, Status, Store Name

SELECT ROW_NUMBER () OVER(ORDER BY Product.product_name) AS 'Row Num',
BanType.id AS 'ID',
ProductType.product_type_name AS 'Product',
ProductStatus.status_name AS 'Status',
Store.store_name AS 'Store'
FROM Product
INNER JOIN BanType ON BanType.id = Product.ban_reason_id
INNER JOIN ProductType ON ProductType.id = Product.id
INNER JOIN StoreProduct ON StoreProduct.product_id = Product.id
INNER JOIN Store ON StoreProduct.store_id = Store.id
INNER JOIN ProductStatus ON ProductStatus.id = Product.id
WHERE ProductStatus.is_active = 1

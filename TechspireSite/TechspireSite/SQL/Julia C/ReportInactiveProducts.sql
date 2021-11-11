-- Julia Chen
-- Inactive Products
-- Client can use reports to view inactive products and make biz decisions
-- Report that displays
-- ROW_NUM,Product Name,Product Type,Product Status,Inactivity Reason
SELECT ROW_NUMBER()
OVER(ORDER BY Product.product_name) AS ROW_NUM,
Product.product_name AS 'Product Name',
Product.product_type_id AS 'Product Type',
ProductStatus.status_name AS 'Product Status',
ProductStatus.status_desc AS 'Inactivity Reason',

Store.store_name AS 'From Store'

FROM Product
INNER JOIN ProductStatus ON Product.product_status_id = ProductStatus.id
--INNER JOIN BanType ON Product.ban_reason_id = BanType.id
INNER JOIN StoreProduct ON Product.id = StoreProduct.product_id
INNER JOIN Store ON StoreProduct.store_id = Store.id

-- all products in list are currently active so nothing will show up at the moment
WHERE ProductStatus.id <> 1;


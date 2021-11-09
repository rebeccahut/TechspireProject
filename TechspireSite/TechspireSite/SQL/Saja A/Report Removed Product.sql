-- Saja Alyasin
-- Removed Products
-- The client can use this report to determine the what products were removed in order to get a better idea of what product types to make less of.
-- Displays the removed products by ascending product name
-- Row Number, Product Name, Product Type, Product Status, Inactivity Reason, Store 
--,,,,,

SELECT ROW_NUMBER()
OVER(ORDER BY Product.product_name DESC) AS Row_Num,
Product.product_name AS 'Product Name',
Product.product_type_id AS 'Product Type',
Product.product_status_id AS 'Product Status',
Product.ban_reason_id AS 'Inactivity Reason',
Store.store_name AS 'From Store'

FROM Product
INNER JOIN ProductStatus ON Product.product_status_id = ProductStatus.id
INNER JOIN BanType ON Product.ban_reason_id = BanType.id
INNER JOIN StoreProduct ON Product.id = StoreProduct.product_id
INNER JOIN Store ON StoreProduct.store_id = Store.id

--no inactive products at the moment, so there is no output

-- Saja Alyasin
-- Removed Products
-- The client can utilize this report to determine what products were removed in order to get a better idea of what product types to make less of. For an example since all products are divided into categories such as savory, sweet, etc., this report displays the product and the product type that were removed due to inactivity in regard to sales, if most of the product types that were removed are savory products then the individual viewing this report will be able to which product type is least popular and take further action. This report will serve a greater purpose and be more beneficial in the future when products become inactive, discontinued or removed.
-- This report displays the removed products by ascending product name.
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



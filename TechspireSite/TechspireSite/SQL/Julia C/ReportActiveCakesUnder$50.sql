-- Julia Chen
-- Active Products By Specific Type and Price at Hot Breads Location
-- The client can use this report to view a specific active product that are under a specific price. This report would be useful for budget-conscious customers that want to buy, for example, a cake but are open to suggestions. With this report, the client can quickly filter out her products, look up cakes that are under the desired price and offered at the Hot Breads location, and direct the customer’s attention to products that they would be interested in purchasing in an efficient manner. 
-- This report displays products based on a specific product type and a given maximum price.
-- ROW_NUM,From Store,Product Name,Product Type,Price
--,,,,right

DECLARE @product_price INT = 50
DECLARE @product_type_names VARCHAR(200) = 'Cakes'

SELECT ROW_NUMBER()
OVER(ORDER BY Product.product_price desc) AS ROW_NUM,
Store.store_name AS 'From Store',
Product.product_name AS 'Product Name',
ProductType.product_type_name AS 'Product Type',
CONCAT('$', CAST((Product.product_price) AS DECIMAL(18,2))) AS 'Price'

FROM Product
INNER JOIN ProductStatus ON Product.product_status_id = ProductStatus.id
--INNER JOIN BanType ON Product.ban_reason_id = BanType.id
INNER JOIN StoreProduct ON Product.id = StoreProduct.product_id
INNER JOIN Store ON StoreProduct.store_id = Store.id
INNER JOIN ProductType ON  Product.product_type_id = ProductType.id

WHERE ProductStatus.id = 1 AND product_type_name = @product_type_names AND product_price < @product_price AND store_id = 1;


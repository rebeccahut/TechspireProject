--Umair Shamsuddin
--Products added to rewards
--Client can keep track of the number or type of products that are added for loyalty redemption.
--Displays added products starting by name.
--Row number, product name, product type, product status name, reward data added, reward status name

SELECT ROW_NUMBER()
OVER(ORDER BY Product.product_name ASC) AS Row_Num,
Product.product_name AS "Product Name",
ProductType.product_type_name AS "Product Type",
ProductStatus.status_name AS "Product Status",
Reward.date_added AS "Reward Addition",
Store.id AS "Store"

FROM Product
INNER JOIN ProductType ON ProductType.id = Product.id
INNER JOIN ProductStatus ON ProductStatus.id = Product.id
INNER JOIN Reward ON Reward.id = Store.id
INNER JOIN Store ON Store.id = Product.id

--Umair Shamsuddin
--Products Added to Rewards
--This report keeps track of what products have been added as possible rewards for loyalty customers. This will be helpful in knowing what product was added, when it was added, and whether or not it is still a product that is being offered. The client will also be able to identify which product is offered at what store so that, if a product no longer exists or is out of stock, they can know to make note of it.
--The report keeps a record of what product is going to be added, the type of product it is, when it was added, if it is still an existing product, and which store it is offered at.
--Row Number,Product Name,Product Type,Product Status Name,Reward Date Added,Store ID
--,,,,,,


SELECT ROW_NUMBER()
OVER(ORDER BY Product.product_name ASC) AS Row_Num,
Product.product_name AS "Product Name",
ProductType.product_type_name AS "Product Type",
ProductStatus.status_name AS "Product Status",
Reward.date_added AS "Reward Added Date",
Store.id AS "Store"

FROM Product
INNER JOIN ProductType ON ProductType.id = Product.product_type_id
INNER JOIN ProductStatus ON ProductStatus.id = Product.product_status_id
INNER JOIN Reward ON Reward.free_product_id = Product.id
INNER JOIN StoreProduct ON StoreProduct.product_id = Product.id
INNER JOIN Store ON StoreProduct.store_id = Store.id
--Deletes any data in the store product table that has an assigned date prior to the opening of the bakery
DELETE FROM StoreProduct
WHERE product_assigned < '2017-01-01' 

--Deletes any data in the Order table that has an order date prior to the opening of the bakery
DELETE FROM "Order"
WHERE order_date < '2017-01-01' 

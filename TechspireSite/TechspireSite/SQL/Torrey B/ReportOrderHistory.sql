--purpose of this query to provide a order history of customer
--NOTE: Could add a top 10 
Select * --Customer.first_name, Customer.last_name, "Order".id, "Order".order_date, Product.product_name, Product_desc, CustomerStatus.status_name
From Customer
INNER JOIN "Order"
ON Customer.id = "Order".customer_id
INNER JOIN OrderLine
ON "Order".id = OrderLine.order_id
INNER JOIN Product
ON OrderLine.product_id = Product.id
INNER JOIN CustomerStatus
ON Customer.customer_Status_id = CustomerStatus.id;
------------------------------------------------------------
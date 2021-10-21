--Torrey Brett
--Order History
--The client can use this report to view the order history of clients.
--Displays the customer information and their associated order information
--Row Number, First Name, Last Name, Order ID, Order Date, Product Name, Product Description, Status Name

SELECT ROW_NUMBER() OVER(ORDER BY Customer.id) AS num_row,
Customer.first_name, Customer.last_name, "Order".id, "Order".order_date, Product.product_name, Product_desc, CustomerStatus.status_name
From Customer
INNER JOIN "Order"
ON Customer.id = "Order".customer_id
INNER JOIN OrderLine
ON "Order".id = OrderLine.order_id
INNER JOIN Product
ON OrderLine.product_id = Product.id
INNER JOIN CustomerStatus
ON Customer.customer_Status_id = CustomerStatus.id;

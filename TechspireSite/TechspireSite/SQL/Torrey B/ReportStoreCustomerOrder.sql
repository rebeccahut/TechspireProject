--Torrey Brett
--Customer Order and Store Report
--The client can use this query to understand the customer information, what they ordered, at which store, and if the store is active or closed.
--Displays the Customer and Order information, where they made their order and if the order was placed at a closed store.
--Row Number,First Name, Last Name, Order ID, Order Date, Store Name, Store Phone Number, Store Status


SELECT ROW_NUMBER() OVER(ORDER BY Customer.id) AS num_row,
Customer.first_name, Customer.last_name, "Order".id, "Order".order_date, Store.store_name, Store.phone_number, StoreStatus.status_name
FROM Customer
INNER JOIN "Order"
ON Customer.id = "Order".customer_id
INNER JOIN Store
ON "Order".store_id = Store.id
INNER JOIN StoreStatus
ON Store.store_status_id = StoreStatus.id
;



--Torrey Brett
--Customer Visit History and Visit Total Report
--This report will allow the client to view the customers in alphabetical order by first name and their visit history.  It is good business practice for the client to keep track of the customers and their visits to any of her stores. This can help provide evidence of customer visits in case there is a business need for this information. Also, this report can help our client know who to send thank you emails to or Its been a while. emails to specific customers. 
--Included in this report is the customer’s first and last name, their visit date, the store they visited with the store information, and the total spent during that visit.
--Row Number,First Name, Last Name, Customer Email, Visit Date, Store Name, Store Phone Number, Store Status, Visit Total
--,,,,,,phone,,right

SELECT ROW_NUMBER() OVER(ORDER BY Customer.first_name) AS num_row,
Customer.first_name, Customer.last_name,  Customer.email_address AS Customer_Email, "Order".order_date AS Visit_Date, Store.store_name AS Store_Name, Store.phone_number AS Store_Phone, StoreStatus.status_name AS Store_Status, "Order".final_total AS Visit_Total 
FROM Customer
INNER JOIN "Order"
ON Customer.id = "Order".customer_id
INNER JOIN Store
ON "Order".store_id = Store.id
INNER JOIN StoreStatus
ON Store.store_status_id = StoreStatus.id
ORDER BY Customer.first_name
;

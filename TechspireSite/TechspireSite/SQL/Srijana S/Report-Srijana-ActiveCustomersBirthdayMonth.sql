--Srijana Shrestha
--Active Customers with a Specific Birth Month
--The client can use this report to view customers that all have the same birth month depending on a the client's selected month. This report is beneficial for the client because the client is able to view customers who were born in the current month or next month, and from there, be able to anticipate a rise of reward usages. Furthermore, the client will be able to view all the customer emails in order to send them marketing emails for their birthday. 
--Displays only the customers that were born in the month of March and active. It is ordered by the customer's birthdate. Information about the customer's address is included(if avaliable) along with how many orders the customer has historically.
--Full Name,Email Address,Birth Date,Address,Zip_code,City Name,Total Transactions

Declare @customer_birthmonth INT = 3
select "Customer".first_name + ' ' + "Customer".last_name AS "Customer_full_name",
"Customer".email_address,
"Customer".birthdate
,"Location"."address"
,"Location".zip_code
,"Location".city
,Transactions.total
from "Customer" 
INNER JOIN CustomerStatus ON Customer.customer_status_id = CustomerStatus.id
LEFT JOIN "Location" ON Customer.location_id = "Location".id
INNER JOIN (SELECT Count(*) AS total, "Order".customer_id
FROM "Order"
GROUP BY "Order".customer_id
)AS Transactions ON Transactions.customer_id = Customer.id
WHERE month("Customer".birthdate) = @customer_birthmonth AND
CustomerStatus.is_active = 1

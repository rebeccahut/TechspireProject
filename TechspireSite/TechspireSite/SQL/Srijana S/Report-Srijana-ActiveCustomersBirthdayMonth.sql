--Srijana Shrestha
--Active Customers with a Specific Birth Month
--The client can use this report to view customers that all have the same birth month depending on a the client's selected month. This report is beneficial for the client because the client is able to view customers who were born in the current month or next month, and from there, be able to anticipate a rise of reward usages. Furthermore, the client will be able to view all the customer emails in order to send them marketing emails for their birthday. 
--Displays only the customers that were born in the month of May. It is ordered by the customer's birthdate. 
--Customer Full Name, Email Address, Birthdate, Store Name, Status Name
/* All Active customers details by bakeries based on customer's birth month*/

Declare
@customer_birthmonth INT
Select @customer_birthmonth = 5

select "Customer".first_name + ' ' + "Customer".last_name AS "Customer_full_name",
"Customer".email_address,
"Customer".birthdate,
"Store".store_name,
"CustomerStatus".status_name
from "Store" inner join "Location" on "Store".location_id = "Location".id
inner join "Customer" on "Location".id = "Customer".location_id
inner join "CustomerStatus" on  "Customer".customer_status_id = "CustomerStatus".id
where "CustomerStatus".id =1 and
month("Customer".birthdate) = @customer_birthmonth
order by "Customer".birthdate
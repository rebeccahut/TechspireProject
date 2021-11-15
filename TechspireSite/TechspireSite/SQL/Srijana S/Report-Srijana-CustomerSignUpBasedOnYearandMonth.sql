--Srijana Shrestha
--Customer Sign Up Based on Year and Month
--The client can use this report to generate the customer information based on their signup date (year and month). From this report, the client can view her oldest customers list the newest customers list as well. The client can also view which customer has joined their loyalty system in which store. This report can be helpful for the client to motivate her new customer to revisit by sending promotional coupons or offer through the email address or phone number. The client can also determine the number of new customers enrolled in a specific year and a month.
--Displays Customer sign up details based on selected month and year with contact information. This report is ordered by begin date (Sign Up date).
--Full Name,SignUp Date,Email,Phone Number,Store Name
--,,,,phone
DECLARE @year INT = 2021
DECLARE @month INT = 8
DECLARE @Store_id INT = 1

SELECT
Cust."Full_Name", SignUp_Date, Email, Phone, Store_Name

FROM
(SELECT DISTINCT Customer.id AS Customer_Id,
Customer.first_name + ' ' + "Customer".last_name AS "Full_Name",
Customer.begin_date AS SignUp_Date,
Customer.email_address AS Email,
Customer.phone_number AS Phone,
Store.store_name AS Store_Name
FROM "Store" INNER JOIN "Order" ON "Store".id = "Order".store_id
INNER JOIN "Customer" ON "Order".customer_id = "Customer".id
INNER JOIN "Location" ON "Customer".location_id = "Location".id
WHERE year(Customer.begin_date) = @year AND
month(Customer.begin_date) = @month AND
Store.id = @Store_id
) AS Cust
ORDER BY Cust.SignUp_Date
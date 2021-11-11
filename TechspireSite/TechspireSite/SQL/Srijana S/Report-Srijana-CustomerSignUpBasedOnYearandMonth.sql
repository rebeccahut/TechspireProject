--Srijana Shrestha
--Customer Sign Up Based on Year and Month
--The client can use this report to generate the customer information based on their signup date (year and month). This report can be helpful for the client to motivate her new customer to revisit by sending promotional coupons or offer.
--Displays Customer sign-up details based on selected month and year with contact information.
--Customer Id,Customer Full Name,Sign Up Date,Email Address,Phone Number,Store Name
--,,,,,phone,
DECLARE @year INT = 2018
DECLARE @month INT = 8

SELECT DISTINCT Customer.id AS Customer_Id,
Customer.first_name + ' ' + "Customer".last_name AS "Customer_Full_Name",
Customer.begin_date AS Sign_Up_Date,
Customer.email_address AS Email_Address,
Customer.phone_number AS Phone_Number,
Store.store_name AS Store_Name
FROM "Store" INNER JOIN "Order" ON "Store".id = "Order".store_id
INNER JOIN "Customer" ON "Order".customer_id = "Customer".id
INNER JOIN "Location" ON "Customer".location_id = "Location".id
WHERE year(Customer.begin_date) = @year AND
month(Customer.begin_date) = @month
ORDER BY begin_date;




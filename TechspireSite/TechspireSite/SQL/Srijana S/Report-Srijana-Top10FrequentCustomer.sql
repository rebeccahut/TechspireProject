--Srijana Shrestha
--Top 10 Frequent Customer
--The client can use this report to view the most frequent customers from her specific store. This report can help her to identify her most frequent customer who visits her specific store. The client can analyze which tier customers are frequent customers from this report. The client can use the information from this report for advertisements, encourage those customers to visit more by sending gratitude, and providing more discounts and offers.
--Displays top 10 customers information from her particular store
--Full Name,Email Address,Phone,Store Name,Tier,Last Visit,No of Visit
--,,,phone,,,
DECLARE @store_id INT = 1

SELECT TOP 10 first_name + ' ' + last_name AS Full_Name, 
"Customer".email_address AS Email,
Customer.phone_number AS Phone,
Store.store_name AS Store_Name,
Tier.tier_name AS Tier,
MAX ("Order".order_date) AS Last_Visit,
COUNT("Order".customer_id) AS "No_of_Visit" FROM Store 
INNER JOIN "Order" ON "Order".store_id = Store.id
INNER JOIN Customer ON "Order".customer_id = Customer.id
INNER JOIN Tier ON Customer.tier_id = Tier.id
WHERE Store.id = @store_id
GROUP BY first_name, last_name, "Customer".email_address, Customer.phone_number, Store.store_name, Tier.tier_name
ORDER BY No_of_Visit DESC











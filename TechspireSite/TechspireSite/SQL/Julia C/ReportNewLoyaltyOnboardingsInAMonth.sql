-- Julia Chen
--  Loyalty Members Based on Specific Customer Tier and Their Active Status
-- The client can use this report to view members that belong to a specific tier and their activity status. In the screenshot the report displays customers that belong to the Bronze tier and are currently active customers, as well as their basic personal information. These reports can let her quickly view a list of customers that belong to a particular tier and allows her to target her promotions to customers that fit a specific criteria. For example, she may decide to target her promotions towards active Bronze Tier customers by offering them limited-time offers such as discounts or coupons in an effort to incentivize them into increasing their spending.
-- This report displays loyalty members of a specified tier and active status, and displays their member information such as their full name, birthday, email phone number, current status and the loyalty tier they belong to.
-- ROW_NUM,Full Name,Birthday,Email,Phone #,Current Status,Current Tier
-- ,,,,phone,,

DECLARE @tier_name VARCHAR(200) = 'Silver'
DECLARE @current_status_id VARCHAR(200) = '1'

SELECT ROW_NUMBER() 
OVER(ORDER BY Customer.first_name) AS ROW_NUM,
Customer.first_name + ' ' + Customer.last_name AS 'Full Name',
Customer.birthdate AS ' Birthday',
Customer.email_address AS 'Email',
Customer.phone_number AS 'Phone #',
CustomerStatus.status_name AS 'Current Status',
Tier.tier_name AS 'Current Tier'


FROM Customer
JOIN CustomerStatus ON Customer.customer_status_id = CustomerStatus.id
JOIN Tier ON Customer.tier_id = Tier.id
JOIN "Order" ON Customer.id = "Order".customer_id
WHERE CustomerStatus.id = @current_status_id
AND Tier.tier_name = @tier_name

GROUP BY Customer.begin_date, Customer.first_name, Customer.last_name, Customer.birthdate, Customer.email_address, Customer.phone_number, CustomerStatus.status_name, Customer.point_total, Tier.tier_name
ORDER BY Customer.last_name, Customer.first_name;

--Umair Shamsuddin
--Customer Tier
--Client can keep track of a customers tier level.
--Displays the customer with their tier level at whatever store they go to.
--Row number, customer first name, customer last name, tier id, tier name, store id, customer status id.

SELECT ROW_NUMBER()

OVER(ORDER BY Customer.first_name ASC) AS Row_Num,
Customer.first_name AS "First Name",
Customer.last_name AS "Last Name",
CustomerStatus.id AS "Customer Status",
Tier.id AS "Tier ID",
Tier.tier_name AS "Tier Name",
Store.id AS "Store"


From Customer
INNER JOIN CustomerStatus ON CustomerStatus.id = Customer.customer_status_id
INNER JOIN Tier ON Tier.id = Customer.id
INNER JOIN Store ON Store.id = Tier.id
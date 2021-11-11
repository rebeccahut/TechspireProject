--Umair Shamsuddin
--Customer Tier
--This report will allow the client to keep track of a customers tier level. This report is necessary because a customer can fluctuate from one tier to another without knowing it unless you deliberately seeked it out. It will also serve to show the frequency of tier change, indicating points progression.
--The report displays the customer's name, their tier level, tier name and which store they first became associated with.
--Row Number,Customer First Name,Customer Last Name,Customer Status Name,Tier Name,Store Name
--,,,,,,

SELECT ROW_NUMBER()

OVER(ORDER BY Customer.first_name ASC) AS Row_Num,
Customer.first_name AS "First Name",
Customer.last_name AS "Last Name",
CustomerStatus.status_name AS "Customer Status",
Tier.tier_name AS "Tier Name",
Store.store_name AS "Store"


From Customer
INNER JOIN CustomerStatus ON CustomerStatus.id = Customer.customer_status_id
INNER JOIN Tier ON Tier.id = CustomerStatus.id
INNER JOIN Store ON Store.id = Tier.id

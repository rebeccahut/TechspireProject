--Umair Shamsuddin
--Customer Sign-ups
--This report is used as a way for the client to keep track of any loyalty customer signups that occur. Loyalty members are the core of the loyalty system so having a record of when they became a loyalty member, including the beginning date, will let the client know the number of loyalty members and it's frequency. Also, knowing what type of customer they are can benefit the client in knowing how to make her system more appealing to the customers.
--This report displays a customers first and last name as well as what sort of customer they are, when they joined the membership, where they joined, and if they are still active members.
--Row Number,Customer First Name,Customer Last Name ,Customer Category Name,Begin Date,Customer Status,Store Name
--,,,,,,,

SELECT ROW_NUMBER() 

OVER(ORDER BY Customer.first_name ASC) AS Row_Num,
Customer.first_name AS "Customer First Name",
Customer.last_name AS "Customer Last Name",
CustomerCategory.category_name AS "Customer Type",
Customer.begin_date AS "Loyalty Customer Start Date",
CustomerStatus.status_name AS "Customer Status"

 

From Customer
INNER JOIN CustomerCustomerCategory ON CustomerCustomerCategory.customer_id = Customer.id
INNER JOIN CustomerCategory ON CustomerCategory.id = CustomerCustomerCategory.customer_category_id
INNER JOIN CustomerStatus ON CustomerStatus.id = Customer.customer_status_id

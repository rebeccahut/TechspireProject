--Umair Shamsuddin
--Customer Sign-ups
--Client can use this report to keep track of customers signing up for their loyalty membership.
--Displays customer general info, when they started, and the store they signed up at.
--Row number, customer first name, customer last name , begin date, customer status, store id, employee first name, employee id.

SELECT ROW_NUMBER() 

OVER(ORDER BY Customer.first_name ASC) AS Row_Num,
Customer.first_name AS "Customer First Name",
Customer.last_name AS "Customer Last Name",
Customer.begin_date AS "Loyalty Membership Beginning",
CustomerStatus.id AS "Customer Status",
Store.id AS "Store",
Employee.first_name AS "Employee First Name", 
EmployeeStatus.id AS "Employee Status"
 

FROM Customer
INNER JOIN Store ON Store.id = Customer.id
INNER JOIN CustomerStatus ON CustomerStatus.id = Customer.id
INNER JOIN EmployeeStatus ON EmployeeStatus.id = Store.id
INNER JOIN Employee ON Employee.id = Customer.id
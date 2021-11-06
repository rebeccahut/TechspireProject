-- Julia Chen
-- Loyalty Members Joined in a given month, by day
-- client can use report to view the specific members that joined in a month
-- displays new members joined in a month, by day
-- ROW_NUM,First Name,Last Name,Points Earned,Employee First Name,Employee Last Name

SELECT ROW_NUMBER() 
OVER(ORDER BY Customer.begin_date) AS ROW_NUM,
Customer.begin_date AS 'Date',
Customer.first_name AS 'First Name',
Customer.last_name AS 'Last Name',
PointLog.points_amount AS 'Points Earned',
Employee.first_name AS 'Employee First Name',
Employee.last_name AS 'Employee Last Name'


FROM Customer
JOIN PointLog ON Customer.id = PointLog.customer_id
JOIN Employee ON Customer.create_employee_id = Employee.id
JOIN CustomerStatus ON Customer.customer_status_id = CustomerStatus.id

WHERE DATEPART(m FROM Customer.begin_date) = '10' 
AND DATEPART(yyyy FROM Customer.begin_date) = '2017'
AND CustomerStatus.id = '1'

GROUP BY Customer.begin_date, Customer.first_name, Customer.last_name, points_amount,Employee.first_name,Employee.last_name
ORDER BY MIN(Customer.begin_date);

-- created a new column that states the date at which the employee is assigned a category
UPDATE CustomerCustomerCategory
SET CustomerCustomerCategory.created_date = Customer.begin_date
FROM Customer
INNER JOIN CustomerCustomerCategory ON CustomerCustomerCategory.customer_id = Customer.id
INNER JOIN CustomerCategory ON CustomerCustomerCategory.customer_category_id = CustomerCategory.id

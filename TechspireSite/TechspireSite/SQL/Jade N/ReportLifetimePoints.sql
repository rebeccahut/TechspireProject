--Jade Nguyen
--Total Points Accumulated Per Customer
--The client can use this report to analyze which customers have accumulated the most points based on their entire order history. This will help the client easily view her most-valuable customers as well as assist in understanding the retention rate she has of her customers. For instance, customers that have accumulated a large amount of life time points usually are recurring customers that have placed several orders to reach that amount. Furthermore, the inclusion of the category name allows the client to have more insight into the general description of some of her clients. For instance, the client can expect "rude" customers to have less points than "honest" customers. However, if a "rude" customer has a lot of points, then these are customers that generally have a rude personality, but still respect her business and products. Or, the client can view this as a potential error on her side, in which she may have accidentally labeled one of her customers "rude" when they should be "loyal". 
--Displays all the customers and their accumulated points while sorting by who has accumulated the most to the least. The customer's category name is also displayed.
--Row Number, First Name, Last Name, Points Accumulated, Category Name
--,,,,,

SELECT ROW_NUMBER() 
OVER(ORDER BY Customer.point_total DESC) AS num_row, 
Customer.first_name AS "Customer First Name", 
Customer.last_name AS "Customer Last Name", 
Customer.point_total AS "Lifetime Points Accumulated",
CustomerCategory.category_name AS "Category Name"

FROM Customer
INNER JOIN CustomerStatus ON CustomerStatus.id = Customer.customer_status_id
LEFT JOIN CustomerCustomerCategory ON CustomerCustomerCategory.customer_id = Customer.id
LEFT JOIN CustomerCategory ON CustomerCustomerCategory.customer_category_id = CustomerCategory.id
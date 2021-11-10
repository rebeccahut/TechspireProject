--Rebecca Hutchinson
--Total active customers by customer category
--This report will allow for the client to access their current loyalty members and what categories they belong too. The client can create her own categories for her customers. Based on this report, the client can easily see how many of her customers fit into which of her created categories. This report would assist in developing customer insights for potentially creating specialized discounts. For instance, if there are many “unhappy customers” then this would create aware for her and her business operations.
--Display active customers by the customer category they have been assigned ordered by amount in each category
--Customer Category, Total Customers
--,,


SELECT cc.category_name, COUNT(DISTINCT c.id) AS totalcustomers
FROM Customer AS c
INNER JOIN CustomerStatus AS cs ON c.customer_status_id=cs.id and cs.is_active=1
LEFT JOIN CustomerCustomerCategory AS ccc ON ccc.customer_id=c.id
LEFT JOIN CustomerCategory AS cc ON cc.id=ccc.customer_category_id
GROUP BY cc.category_name
ORDER BY COUNT(DISTINCT c.id) DESC
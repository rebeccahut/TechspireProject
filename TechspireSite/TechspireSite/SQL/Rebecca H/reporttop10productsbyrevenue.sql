--Rebecca Hutchinson
--Top 10 products by revenue this month
--This report is for the client to show the top 10 products by revenue. The client can understand popular individual items amongst customers and use that knowledge to add additional rewards. The client can also use this report to find potential differences from Top 10 Product Categories by Revenue to see if there are any outliers from category to individual products.
--Display the product name ordered by the total revenue to understand the spread of products on orders. This can help determine which products are popular to purchase.
--Product name, Total Revenue 
--,right


SELECT TOP 10 p.product_name, (CONCAT('$', CAST(SUM(ol.total_price) AS DECIMAL(18,2)))) AS TotalRevenue
FROM orderline AS ol
LEFT JOIN "Order" AS o ON ol.order_id=o.id
LEFT JOIN product AS p ON ol.product_id=p.id
INNER JOIN productstatus AS ps ON p.product_status_id=ps.id and ps.is_active=1
GROUP BY p.product_name
ORDER BY SUM(ol.total_price) DESC
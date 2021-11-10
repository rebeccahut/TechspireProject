--Rebecca Hutchinson
--Top 10 product categories by revenue this month
--This report is for the client to show the top 10 products categories by revenue. The client can use this to understand how her store is bringing in revenue in a way that allows her to put effort into the areas that are high ranking. 
--Display the product category name ordered by the total revenue.
--Product Category name, Total Revenue
--,right


SELECT TOP 10  pt.product_type_name,(CONCAT('$', CAST(SUM(ol.total_price) AS DECIMAL(18,2)))) AS TotalRevenue
FROM OrderLine AS ol
LEFT JOIN "Order" AS o ON ol.order_id=o.id
LEFT JOIN product AS p ON ol.product_id=p.id
INNER JOIN productstatus AS ps ON p.product_status_id=ps.id and ps.is_active=1
LEFT JOIN producttype AS pt ON pt.id=p.product_type_id
GROUP BY pt.product_type_name
ORDER BY SUM(ol.total_price) DESC
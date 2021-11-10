--Rebecca Hutchinson
--Top 10 product categories by quantity sold historically
--This report is to show the top ten types of items sold throughout all history. The client can use this to understand which types of products are popular if they want to create additional rewards. They can also use this to better understand their customers wants and make inventory decisions with this knowledge.
--Display top 10 product categories by quantity, order most to least.
--Product Type, Quantity Sold
--,,


SELECT TOP 10 pt.product_type_name, SUM(ol.quantity) AS QuantitySold
FROM orderline AS ol
LEFT JOIN "Order" AS o ON ol.order_id=o.id
LEFT JOIN product AS p ON ol.product_id=p.id 
LEFT JOIN productstatus AS ps ON p.product_status_id = ps.id and ps.is_active=1
LEFT JOIN producttype AS pt ON pt.id=p.product_type_id
GROUP BY pt.product_type_name
ORDER BY SUM(ol.quantity) DESC
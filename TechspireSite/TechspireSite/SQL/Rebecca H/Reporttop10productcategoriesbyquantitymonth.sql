--Rebecca Hutchinson
--Top 10 product categories by quantity sold historically
--This report is to show the top ten types of items are sold over all history. The client can use this to understand which types of products are popular if they want to create additional rewards. They can also use this to better understand their customers wants and make inventory decisions with this knowledge.
--Display top 10 product categories by quantity, order most to least.
--Product Type, Quantity Sold
--,right


Select TOP 10 pt.product_type_name, sum(ol.quantity) as QuantitySold
From orderline as ol
Left join "Order" as o on ol.order_id=o.id
Left join product as p on ol.product_id=p.id 
Left join productstatus as ps on p.product_status_id = ps.id and ps.is_active=1
Left join producttype as pt on pt.id=p.product_type_id
Group by pt.product_type_name
Order by sum(ol.quantity) desc

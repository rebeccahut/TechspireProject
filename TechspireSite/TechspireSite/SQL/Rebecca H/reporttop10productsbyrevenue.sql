--Rebecca Hutchinson
--Top 10 products by revenue this month
--This report is for the manager to show the top 10 products by revenue. The client can use this to understand how her store is bringing in revenue in a way that allows her to put effort into the areas that are high ranking. 
--Display the product name ordered by the total revenue to understand the spread of products on orders.
--Total Revenue, Product name 
--right,


Select Top 10 (concat('$', cast(sum(ol.total_price) AS decimal(18,2)))) as TotalRevenue, p.product_name
From orderline as ol
Left join "Order" as o on ol.order_id=o.id
Left join product as p on ol.product_id=p.id
inner join productstatus as ps on p.product_status_id=ps.id and ps.is_active=1
Group by p.product_name
Order by sum(ol.total_price) desc


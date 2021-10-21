--Rebecca Hutchinson
--Top 10 product categories by revenue this month
--This report is for the manager to show the top 10 products categories by revenue.
--Display the product category name ordered by the total revenue.
--Product Category name, Total Revenue 


Select Top 10 p.product_name, sum(ol.total_price) as TotalRevenue
From orderline as ol
Left join "Order" as o on ol.order_id=o.id
Left join product as p on ol.product_id=p.id
inner join productstatus as ps on p.product_status_id=ps.id and ps.is_active=1
Group by p.product_name
Order by sum(ol.total_price) desc

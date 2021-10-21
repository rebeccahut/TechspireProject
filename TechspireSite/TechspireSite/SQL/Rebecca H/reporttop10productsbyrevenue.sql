--Rebecca Hutchinson
--Top 10 products by revenue this month
--This report is for the manager to show the top 10 products by revenue.
--Display the product name ordered by the total revenue.
--Product name, Total Revenue 


Select Top 10 (concat('$', cast(sum(ol.total_price) AS decimal(18,2)))) as TotalRevenue, p.product_name
From OrderLine as ol
Left join "Order" as o on ol.order_id=o.id
Left join product as p on ol.product_id=p.id
inner join productstatus as ps on p.product_status_id=ps.id and ps.is_active=1
Group by p.product_name
Order by sum(ol.total_price) desc


--Rebecca Hutchinson
--Total active customers by customer category
--This report will allow for the manager to access their current loyalty members and what categories they belong too.
--Customer Category, Total Customers


SELECT cc.category_name, count(distinct c.id) AS totalcustomers
from Customer AS c
inner join CustomerStatus AS cs on c.customer_status_id=cs.id and cs.is_active=1
left join CustomerCustomerCategory AS ccc on ccc.customer_id=c.id
left join CustomerCategory AS cc on cc.id=ccc.customer_category_id
group by cc.category_name
order by count(distinct c.id) desc

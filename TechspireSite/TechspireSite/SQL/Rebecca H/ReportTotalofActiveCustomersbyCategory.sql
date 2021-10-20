--Rebecca Hutchinson
--Total active customers by customer category
--This report will allow for the manager to access their current loyalty members and what categories they belong too.
--Customer Category, Total Customers


SELECT cc.category_name, count(distinct((c.id)) as totalcustomers
from Customer c
inner join CustomerStatus cs on c.customer_status_id=cs.id and cs.is_active=1
left join CustomerCustomerCategory ccc on ccc.customer_id=c.id
left join CustomerCategory cc on cc.id=ccc.customer_category_id
group by cc.category_name
order by count(distinct((c.id)) desc

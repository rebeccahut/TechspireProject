--Rebecca Hutchinson
--Total active customers by customer category
--This report will allow for the manager to access their current loyalty members and what categories they belong too. The client can create her own categories for her customers. Based on this report, the client can easily see how many of her customers fit into which of her created categories. This report would assist in developing customer insights for potentially creating specialized discounts. For instance, if there are many “unhappy customers” then this would create aware for her and her business operations. 
--Display active customers by the customer category they have been assigned ordered by amount in each category
--Customer Category, Total Customers
--,right


SELECT cc.category_name, count(distinct c.id) AS totalcustomers
from Customer AS c
inner join CustomerStatus AS cs on c.customer_status_id=cs.id and cs.is_active=1
left join CustomerCustomerCategory AS ccc on ccc.customer_id=c.id
left join CustomerCategory AS cc on cc.id=ccc.customer_category_id
group by cc.category_name
order by count(distinct c.id) desc

--Torrey Brett
--Product Name and Total Sales
--The client can use this query to provide the products name and the sum of it's total sales
--Displays the product and the sum of the total sales
--Product Name, Sum


Select Product.Product_name, Sum(OrderLine.total_price) AS Sum_Total_Sales 
From OrderLine
INNER JOIN "Order"
ON OrderLine.order_id = "Order".ID
INNER JOIN Product
ON OrderLine.product_id = Product.id
INNER JOIN ProductStatus
ON Product.product_status_id = productStatus.id
Group By Product.product_name
;



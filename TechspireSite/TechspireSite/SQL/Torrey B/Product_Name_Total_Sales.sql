--Purpose of this query to provide the products name and the sum of it's total sales
--NOTE: Check to see if you can add a top 10 or top 10 percent

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

-----------------------------------------------------------------------------------
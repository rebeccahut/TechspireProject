--Torrey Brett
--Active Loyalty Customer Order History Report
--The client will utilize this report to show active loyalty customers information and the orders they placed beginning with the most recent order. This information is useful for the client to ensure there is a record of active loyalty customer orders in case there is a dispute, issue, or need for proof in the future. This report can also be utilized to gather active loyalty customer’s order and point information to track points and potentially contact the customer and thank them for their business or inform them of their point total and the points produced from their recent orders. 
--The Active Customer Order History report displays the Active Loyalty Customer's personal and social media information, the active customer's total points they have, their order information, and the points earned from their order. Along with the store information, the report contains the product description of items within an order, with the order date and individual product price that was purchased in an order.
--Row Number, First Name, Last Name, Customer Phone Number, Customer Email, Social Media Handle, Social Media Platform, Current Point Total, Customer Status, Order Date, Product Name, Product Description, Quantity, Product Price, Order Line Total, Order Total, Points Produced, Store Name, Store Phone 
--,,,,phone,,,,right,,,,,right,right,right,right,right,,phone

SELECT ROW_NUMBER() OVER(ORDER BY ("Order".order_date) desc) AS Num_Row,
Customer.first_name AS First_Name, Customer.last_name AS Last_Name, Customer.phone_number AS Customer_Phone_Number,
Customer.email_address AS Customer_Email, CustomerSocialMedia.social_media_code AS Social_Media_Handle, SocialMediaType.social_media_name AS Socail_Media_Platform, STR(Customer.point_total,25,0) AS Current_Point_Total, CustomerStatus.status_name AS Customer_Status,
"Order".order_date AS Order_Date, Product.product_name AS Product_Name, Product.Product_desc AS Product_Description, Orderline.quantity AS Quantity, STR(Product.product_price,20,2) AS Product_Price, Orderline.total_price AS Order_Line_Total ,STR("Order".final_total,20,2) AS Order_Total, "Order".points_produced AS Points_Produced, Store.store_name AS Store_Name, STR(Store.phone_number,40,0) AS Store_Phone
From Customer
INNER JOIN CustomerSocialMedia
ON Customer.id = CustomerSocialMedia.customer_id
INNER JOIN SocialMediaType
ON CustomerSocialMedia.social_media_type_id = SocialMediaType.id
INNER JOIN "Order"
ON Customer.id = "Order".customer_id
INNER JOIN OrderLine
ON "Order".id = OrderLine.order_id
INNER JOIN Product
ON OrderLine.product_id = Product.id
INNER JOIN CustomerStatus
ON Customer.customer_Status_id = CustomerStatus.id
INNER JOIN Store
ON Store.id = "Order".store_id
WHERE CustomerStatus.status_name = 'Active'

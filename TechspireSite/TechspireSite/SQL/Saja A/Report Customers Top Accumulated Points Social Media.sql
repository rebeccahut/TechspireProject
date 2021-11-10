-- Saja Alyasin
-- Customers with Most Points Social Media
-- The client can use this report determine the association between accumulated customer points and the customer's social media information in order to give an incentive to the customers with the most points via social media or create a sponsership with them to exchange advertisements for points.
-- Displays a the customers with the most accumulated points and their social media handle. 
-- Row Number, Customer First Name, Customer Last Name, Points Accumulated, Social Media Type, Customer Social Media Name
-- ,,,,,

SELECT ROW_NUMBER() 
OVER(ORDER BY Points."Points Accumulated" ASC) AS Row_Num, 
Customer.first_name AS "First Name",
Customer.last_name AS "Last Name",
Points."Points Accumulated",
SocialMediaType.social_media_name AS "Social Media Type", 
CustomerSocialMedia.social_media_code AS "Customer Social Media Handle"


FROM Customer
INNER JOIN CustomerStatus ON CustomerStatus.id = Customer.customer_status_id
INNER JOIN "Order" ON Customer.id = "Order".customer_id
INNER JOIN (SELECT SUM(PointLog.points_amount) AS "Points Accumulated", PointLog.order_id
			FROM PointLog
			WHERE PointLog.points_amount > 0
			GROUP BY PointLog.order_id) 
			AS Points ON "Order".id = Points.order_id
INNER JOIN CustomerSocialMedia ON Customer.id = CustomerSocialMedia.customer_id
INNER JOIN SocialMediaType ON CustomerSocialMedia.social_media_type_id = SocialMediaType.id;

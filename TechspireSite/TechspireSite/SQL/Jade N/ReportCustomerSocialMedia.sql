--Jade Nguyen
--Category Customers with Social Media
--The client can use this report to view specifically customers that have been categorized that have social media. It is very important for businesses to keep track of their customers, especially those that typically use social media. This report is meant for the client to distinguish those who use social media and for what potential reasons, such as offering discounts to "foodies" or paying particular attention tho "unhappy" customers that might react on social media platforms. 
--Displays only the customers that not only have social media, but have specifically categorized by the client. The list is sorted by which customer has been with the client the longest. 
--Row Number, First Name, Last Name, Social Media Type, User Handle, Category Type

SELECT ROW_NUMBER() 

OVER(ORDER BY Customer.begin_date) AS num_row, 
Customer.first_name AS "First Name", 
Customer.last_name AS "Last Name", 
SocialMediaType.social_media_name AS "Social Media Type", 
CustomerSocialMedia.social_media_code AS "User Handle", 
CustomerCategory.category_name AS "Category Type"

FROM CustomerSocialMedia
INNER JOIN Customer ON CustomerSocialMedia.customer_id = Customer.id
INNER JOIN SocialMediaType ON SocialMediaType.id = CustomerSocialMedia.social_media_type_id
INNER JOIN CustomerCustomerCategory ON CustomerCustomerCategory.customer_id = Customer.id
INNER JOIN CustomerCategory ON CustomerCustomerCategory.customer_category_id = CustomerCategory.id

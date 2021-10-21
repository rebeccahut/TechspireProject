--Torrey Brett
--Customer Status and Social Media
--The client can use this query to understand a customer Status, what social media platform they use and the date it was added.
--Displays the status of the customer and what their social media platform they are using and when it was added
--Row Number,First Name, Last Name, Status, Social Media Name, Date

SELECT ROW_NUMBER() OVER(ORDER BY Customer.id) AS num_row,
Customer.first_name, Customer.last_name, CustomerStatus.status_name, SocialMediaType.Social_media_name, CustomerSocialMedia.date_added
FROM Customer
INNER JOIN CustomerReward
ON Customer.id = CustomerReward.customer_id
INNER JOIN CustomerStatus
ON Customer.customer_Status_id = CustomerStatus.id
INNER JOIN CustomerSocialMedia
ON Customer.id = CustomerSocialMedia.customer_id
INNER JOIN SocialMediaType
ON CustomerSocialMedia.social_media_type_id = SocialMediaType.social_media_name
;

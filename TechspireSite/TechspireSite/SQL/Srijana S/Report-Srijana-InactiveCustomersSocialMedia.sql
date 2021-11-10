--Srijana Shrestha
--Inactive-Cancel Customer with Social media details
--The client can use this report to view customers that have declared themselves "inactive" within the loyalty system, specifically customers that have social media. This report is beneficial for the client because the client may want to reach out to her inactive customers to resume business relations. Particularly for those that use social media, it is a priority to reach out to those customers first because they might leave negative reviews.
--Displays only the customers that have been categorized as "inactive-cancel" with social media
--Customer Full Name, Customer Social Media Id, Social Media Name, City, Customer Status, Customer Status Desc
--,,,,,

SELECT Customer_Full_Name, Customer_Social_Media_Id, Social_Media_Name, City, 
status_name AS "Customer_Status", status_desc AS "Customer_Status_Desc" FROM (

SELECT Customer.customer_status_id AS id,
"Customer".first_name + ' ' + "Customer".last_name AS "Customer_Full_Name",
CustomerSocialMedia.social_media_code AS "Customer_Social_Media_Id",
SocialMediaType.social_media_name AS "Social_Media_Name",
city AS "City"
FROM "SocialMediaType" 
INNER JOIN"CustomerSocialMedia"ON"SocialMediaType".id = "CustomerSocialMedia".social_media_type_id
INNER JOIN"Customer"ON"CustomerSocialMedia".customer_id = "Customer".id
INNER JOIN"location"ON"Customer".location_id = "location".id
INNER JOIN"StateProvince"ON"StateProvince".id = "Location".state_id
WHERE "StateProvince".state_name = 'Texas'
and "SocialMediaType".id IN (1,3)) A

INNER JOIN"CustomerStatus" ON A.id = "CustomerStatus".id
where "CustomerStatus".id = 3
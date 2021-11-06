--Srijana Shrestha
--Inactive Customers with Social Media
--The client can use this report to view customers that have declared themselves "inactive" within the loyalty system, specifically customers that have social media. This report is beneficial for the client because the client may want to reach out to her inactive customers to resume business relations. Particularly those that use social media, it is a priority to reach out to those customers first because they might leave negative reviews. 
--Displays only the customers that have been categorized as "inactive" with social media
--Customer First Name, Customer Last Name, Social Media Code, Social Media Type Name, City

select 
A.firstname,
A.lastname,
A.socialmediaid,
A.socialmedianame,
A.city
from (
select Customer.customer_status_id as id,
Customer.first_name as firstname,
Customer.last_name as lastname,
CustomerSocialMedia.social_media_code as socialmediaid,
SocialMediaType.social_media_name as socialmedianame,
city as city
from "SocialMediaType" inner join "CustomerSocialMedia" on "SocialMediaType".id = "CustomerSocialMedia".social_media_type_id
inner join "Customer" on "CustomerSocialMedia".customer_id = "Customer".id
inner join "location" on "Customer".location_id = "location".id
inner join "StateProvince" on "StateProvince".id = "Location".state_id
where "StateProvince".state_name = 'Texas'
and "SocialMediaType".id IN (1,3)) AS A
inner join "CustomerStatus" on A.id = "CustomerStatus".id
where "CustomerStatus".is_active = 0
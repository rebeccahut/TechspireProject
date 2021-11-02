--adding potential point reason types that the client might consider if she expands her point reasons
INSERT INTO PointReasonType (reason_name, reason_desc) 
VALUES 
('Valued Customer', 'providing a complimentary point for a customer''s patronage and loyalty'), 
('Signed Up', 'points earned for signing up for the loyalty program'), 
('Feedback Points - Yelp', 'points earned for leaving a review on Yelp'), 
('Social Media Shoutout', 'points earned for posting about business products - MUST TAG STORE SOCIAL MEDIA'), 
('Birthday' , 'points for customer''s birthday - eligible for free pastry')

--adding a customer's social media handle
INSERT INTO CustomerSocialMedia(social_media_code, social_media_type_id, customer_id, date_added)
VALUES ('JohnMccabe', 1, 1, '2021-10-25')

ALTER TABLE CustomerSocialMedia ADD
    customer_id int FOREIGN KEY REFERENCES Customer(id),
    social_media_type int FOREIGN KEY REFERENCES SocialMediaType(id);
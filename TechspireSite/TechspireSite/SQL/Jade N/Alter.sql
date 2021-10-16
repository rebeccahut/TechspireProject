ALTER TABLE CustomerSocialMedia ADD
    customer_id int FOREIGN KEY REFERENCES Customer(id),
    social_media_type int FOREIGN KEY REFERENCES SocialMediaType(id);

ALTER TABLE PointLog ADD
    customer_id int FOREIGN KEY REFERENCES Customer(id),
    employee_id int FOREIGN KEY REFERENCES SocialMediaType(id),
    reason_id int FOREIGN KEY REFERENCES PointReasonType(id),
    order_id int FOREIGN KEY REFERENCES "Order"(id),
    customer_reward_id int FOREIGN KEY REFERENCES CustomerReward(id);
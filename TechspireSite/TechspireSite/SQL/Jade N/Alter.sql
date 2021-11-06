ALTER TABLE CustomerSocialMedia ADD
    customer_id int NOT NULL FOREIGN KEY REFERENCES Customer(id),
    social_media_type_id int NOT NULL FOREIGN KEY REFERENCES SocialMediaType(id);

ALTER TABLE PointLog ADD
    customer_id int NOT NULL FOREIGN KEY REFERENCES Customer(id),
    employee_id int NOT NULL FOREIGN KEY REFERENCES Employee(id),
    reason_id int NOT NULL FOREIGN KEY REFERENCES PointReasonType(id),
    order_id int FOREIGN KEY REFERENCES "Order"(id);
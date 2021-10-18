ALTER TABLE EmployeeSocialMedia ADD
    employee_id int NOT NULL FOREIGN KEY REFERENCES Employee(id),
    social_media_type_id int NOT NULL FOREIGN KEY REFERENCES SocialMediaType(id);

ALTER TABLE StoreSocialMedia ADD
    store_id int NOT NULL FOREIGN KEY REFERENCES Store(id),
    social_media_type_id int NOT NULL FOREIGN KEY REFERENCES SocialMediaType(id);

ALTER TABLE StoreReward ADD
    store_id int NOT NULL FOREIGN KEY REFERENCES Store(id),
    reward_id int NOT NULL FOREIGN KEY REFERENCES Reward(id);
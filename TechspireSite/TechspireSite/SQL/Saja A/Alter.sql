ALTER TABLE EmployeeSocialMedia ADD
    employee_id int FOREIGN KEY REFERENCES Employee(id),
    social_media_type int FOREIGN KEY REFERENCES SocialMediaType(id);

ALTER TABLE StoreSocialMedia ADD
    store_id int FOREIGN KEY REFERENCES Store(id),
    social_media_type int FOREIGN KEY REFERENCES SocialMediaType(id);

ALTER TABLE StoreReward ADD
    store_id int FOREIGN KEY REFERENCES Store(id),
    reward_id int FOREIGN KEY REFERENCES Reward(id);
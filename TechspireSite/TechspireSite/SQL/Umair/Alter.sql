ALTER TABLE Reward ADD
    reward_status_id int FOREIGN KEY REFERENCES RewardStatus(id),
    free_product_id int FOREIGN KEY REFERENCES Product(id),
    tier_id int FOREIGN KEY REFERENCES Tier(id);
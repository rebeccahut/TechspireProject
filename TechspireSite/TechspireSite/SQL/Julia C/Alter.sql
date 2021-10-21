ALTER TABLE OrderLine ADD
    product_id int NOT NULL FOREIGN KEY REFERENCES Product(id),
    order_id int NOT NULL FOREIGN KEY REFERENCES "Order"(id);

ALTER TABLE CustomerReward ADD
    order_id int NOT NULL UNIQUE FOREIGN KEY REFERENCES "Order"(id),
    reward_id int NOT NULL FOREIGN KEY REFERENCES Reward(id);

ALTER TABLE Customer ADD
    create_employee_id int FOREIGN KEY REFERENCES Employee(id),
    customer_status_id int NOT NULL FOREIGN KEY REFERENCES CustomerStatus(id),
    tier_id int FOREIGN KEY REFERENCES Tier(id),
    location_id int FOREIGN KEY REFERENCES Location(id);


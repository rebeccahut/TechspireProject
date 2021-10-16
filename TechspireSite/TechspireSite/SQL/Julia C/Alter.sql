ALTER TABLE OrderLine ADD
    product_id int FOREIGN KEY REFERENCES Product(id),
    order_id int FOREIGN KEY REFERENCES "Order"(id);

ALTER TABLE CustomerReward ADD
    customer_id int FOREIGN KEY REFERENCES Customer(id),
    reward_id int FOREIGN KEY REFERENCES Reward(id);

ALTER TABLE Customer ADD
    create_employee_id int FOREIGN KEY REFERENCES Employee(id),
    customer_status_id int FOREIGN KEY REFERENCES CustomerStatus(id),
    tier_id int FOREIGN KEY REFERENCES Tier(id),
    location_id int FOREIGN KEY REFERENCES Location(id);


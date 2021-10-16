--Brett M
ALTER TABLE EmployeeJob ADD
    employee_id int FOREIGN KEY REFERENCES Employee(id),
    job_id int FOREIGN KEY REFERENCES Job(id),
    store_id int FOREIGN KEY REFERENCES Store(id);

ALTER TABLE Employee ADD
    location_id int FOREIGN KEY REFERENCES Location(id),
    employee_status_id int FOREIGN KEY REFERENCES EmployeeStatus(id),
    employee_type_id int FOREIGN KEY REFERENCES EmployeeType(id);

ALTER TABLE Location ADD
     state_id int FOREIGN KEY REFERENCES StateProvince(id) DEFAULT 1407;


--Jade N
ALTER TABLE CustomerSocialMedia ADD
    customer_id int FOREIGN KEY REFERENCES Customer(id),
    social_media_type int FOREIGN KEY REFERENCES SocialMediaType(id);

ALTER TABLE PointLog ADD
    customer_id int FOREIGN KEY REFERENCES Customer(id),
    employee_id int FOREIGN KEY REFERENCES SocialMediaType(id),
    reason_id int FOREIGN KEY REFERENCES PointReasonType(id),
    order_id int FOREIGN KEY REFERENCES "Order"(id),
    customer_reward_id int FOREIGN KEY REFERENCES CustomerReward(id);

--Julia C
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



--Kyle D
ALTER TABLE EmployeeEmployeeCategory ADD
    employee_id int FOREIGN KEY REFERENCES Employee(id),
    employee_category_id int FOREIGN KEY REFERENCES EmployeeCategory(id);


--Rebecca H
ALTER TABLE StateProvince 
    ADD country_id int FOREIGN KEY REFERENCES Country(id);

ALTER TABLE CustomerCustomerCategory 
    ADD customer_id int FOREIGN KEY REFERENCES Customer(id);

ALTER TABLE CustomerCustomerCategory 
    ADD customer_category_id int FOREIGN KEY REFERENCES CustomerCategory(id);

--Saja A
ALTER TABLE EmployeeSocialMedia ADD
    employee_id int FOREIGN KEY REFERENCES Employee(id),
    social_media_type int FOREIGN KEY REFERENCES SocialMediaType(id);

ALTER TABLE StoreSocialMedia ADD
    store_id int FOREIGN KEY REFERENCES Store(id),
    social_media_type int FOREIGN KEY REFERENCES SocialMediaType(id);

ALTER TABLE StoreReward ADD
    store_id int FOREIGN KEY REFERENCES Store(id),
    reward_id int FOREIGN KEY REFERENCES Reward(id);

--Srijana S
ALTER TABLE Product ADD
	product_type_id int FOREIGN KEY REFERENCES ProductType(id),
	product_status_id int FOREIGN KEY REFERENCES ProductStatus(id),
	ban_reason_id int FOREIGN KEY REFERENCES BanType(id);

ALTER TABLE Store ADD
	location_id int FOREIGN KEY REFERENCES Location(id),
	store_status_id int FOREIGN KEY REFERENCES StoreStatus(id);


--Torrey B
ALTER TABLE "Order" ADD
	customer_id int FOREIGN KEY REFERENCES Customer(id),
	payment_type_id int FOREIGN KEY REFERENCES PaymentType(id),
	store_id int FOREIGN KEY REFERENCES Store(id);

ALTER TABLE StoreProduct ADD
	product_id int FOREIGN KEY REFERENCES Product(id),
	store_id int FOREIGN KEY REFERENCES Store(id);


--Umair
ALTER TABLE Reward ADD
    reward_status_id int FOREIGN KEY REFERENCES RewardStatus(id),
    free_product_id int FOREIGN KEY REFERENCES Product(id),
    tier_id int FOREIGN KEY REFERENCES Tier(id);


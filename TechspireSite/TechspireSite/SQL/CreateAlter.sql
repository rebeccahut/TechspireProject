--Alanna G
CREATE TABLE EmployeeStatus(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    status_name varchar(40) NOT NULL,
    status_desc varchar(200),
    is_active bit NOT NULL DEFAULT 1
);

CREATE TABLE RewardStatus(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    status_name varchar(40) NOT NULL,
    status_desc varchar(200),
    is_active bit NOT NULL DEFAULT 1,
);

CREATE TABLE StoreStatus(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    status_name varchar(40) NOT NULL,
    status_desc varchar(200),
    is_active bit NOT NULL DEFAULT 1,
);

CREATE TABLE BanType(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    ban_name varchar(40) NOT NULL,
    ban_desc varchar(200),
);


--Brett M
CREATE TABLE Employee(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    first_name nvarchar(40) NOT NULL,
    last_name nvarchar(40) NOT NULL,
    email_address nvarchar(254) NOT NULL,
    phone_number nvarchar(14) NOT NULL,
    comments nvarchar(max),
    birthdate date NOT NULL,
    begin_date date NOT NULL,
    end_date date,
);

CREATE TABLE EmployeeJob(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    assign_date date NOT NULL,
);

CREATE TABLE Job(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    job_name nvarchar(40) NOT NULL,
    job_desc nvarchar(200),
);

CREATE TABLE Location(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    zip_code nvarchar(10) NOT NULL DEFAULT 77339,
    city nvarchar(35) NOT NULL DEFAULT 'Houston',
    address nvarchar(100) NOT NULL DEFAULT '3242 StreetName',
);


--Jade N
CREATE TABLE PointReasonType(
	id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	reason_name nvarchar(40) NOT NULL,
	reason_desc nvarchar(200) 
);

CREATE TABLE PointLog(
	id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	points_amount int NOT NULL DEFAULT 0,
	created_date date NOT NULL
);

CREATE TABLE CustomerSocialMedia(
	id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	social_media_code nvarchar(60) NOT NULL, 
	date_added date NOT NULL
);


--Julia C
CREATE TABLE Customer(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    first_name nvarchar(40) NOT NULL,
    last_name nvarchar(40) NOT NULL,
    email_address nvarchar(254) NOT NULL,
    phone_number nvarchar(15) NOT NULL,
    comments nvarchar(max),
    birthdate date NOT NULL,
    begin_date date NOT NULL,
);

CREATE TABLE OrderLine(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    quantity int NOT NULL DEFAULT 0,
    ind_price numeric(19,4) NOT NULL DEFAULT 0,
    total_price numeric(19,4) NOT NULL DEFAULT 0,
);

CREATE TABLE CustomerReward(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    point_cost int NOT NULL DEFAULT 0,
    discount_amount numeric(19,4) NOT NULL DEFAULT 0,
);

--Kyle D
CREATE TABLE EmployeeCategory(
    id int PRIMARY KEY IDENTITY(1,1), 
    category_name nvarchar (40) NOT NULL,
    category_desc nvarchar (200),
);

CREATE TABLE EmployeeEmployeeCategory(
    id int PRIMARY KEY IDENTITY(1,1),
);

CREATE TABLE EmployeeType(
    id int PRIMARY KEY IDENTITY(1,1),
    type_name nvarchar(40) NOT NULL,
    type_desc nvarchar(200),
);


--Rebecca H
CREATE TABLE CustomerCategory(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    category_name nvarchar(40) NOT NULL,
    category_desc nvarchar(200),
);

CREATE TABLE CustomerCustomerCategory(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
);

CREATE TABLE StateProvince(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    state_name nvarchar(60) NOT NULL,
);

CREATE TABLE Country(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    country_name nvarchar(60) NOT NULL,
);


--Saja A
CREATE TABLE StoreReward(
	id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	reward_assigned date NOT NULL
);

CREATE TABLE StoreSocialMedia(
	id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	social_media_code nvarchar(60) NOT NULL,
	date_added date NOT NULL
);

CREATE TABLE EmployeeSocialMedia(
	id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	social_media_code nvarchar(60) NOT NULL,
	date_added date NOT NULL
);


--Srijana S
CREATE TABLE Product ( 
    id int PRIMARY KEY IDENTITY(1,1), 
    product_name nvarchar (80) NOT NULL,
    product_desc nvarchar (200) NOT NULL, 
    product_price numeric(19,4) CHECK (product_price >= 0) NOT NULL
); 

CREATE TABLE ProductType(
    id int PRIMARY KEY IDENTITY(1,1),
    product_type_name varchar (40) NOT NULL,
    product_type_desc varchar (200)
);

CREATE TABLE ProductStatus (
    id int PRIMARY KEY IDENTITY(1,1),
    status_name nvarchar (50) NOT NULL,
    status_desc nvarchar (200),
    is_active bit NOT NULL DEFAULT 1
);

CREATE TABLE Store(
    id INT PRIMARY KEY IDENTITY(1,1),
    store_name nvarchar(40),
    phone_number nvarchar(15),
    email_address nvarchar(254),
    website_address nvarchar(300),
    start_date date NOT NULL,
    end_date date
);


--Torrey B
CREATE TABLE "Order" (
    id int NOT NULL PRIMARY KEY IDENTITY (1,1),
    order_date date NOT NULL,
    original_total numeric(19,4) NOT NULL DEFAULT 0,
    final_total numeric(19,4) NOT NULL DEFAULT 0,
    discount_amount numeric(19,4) NOT NULL DEFAULT 0,
);

CREATE TABLE StoreProduct(
    id int NOT NULL PRIMARY KEY IDENTITY (1,1),
    product_assigned date NOT NULL,
);

CREATE TABLE SocialMediaType(
	id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	social_media_name nvarchar(40) NOT NULL,
	social_media_desc nvarchar(200)
);


--Umair
CREATE TABLE CustomerStatus(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    status_name varchar(40) NOT NULL,
    status_desc varchar(200) NOT NULL,
    is_active bit NOT NULL DEFAULT 1,
);

CREATE TABLE PaymentType(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    type_name varchar(40) NOT NULL,
    type_desc varchar(200) NOT NULL,
);

CREATE TABLE Reward(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    reward_name varchar(80) NOT NULL,
    reward_desc varchar(200) NOT NULL,
    point_cost int NOT NULL DEFAULT 0,
    reset_period int DEFAULT 0,
    discount_amount numeric(19,4) NOT NULL DEFAULT 0,
    date_added date NOT NULL,
    date_disabled date,
);

CREATE TABLE Tier(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    tier_name varchar(40) NOT NULL,
    tier_desc varchar(200) NOT NULL,
    min_points int NOT NULL DEFAULT 0,
);

--Brett M
ALTER TABLE EmployeeJob ADD
    employee_id int NOT NULL FOREIGN KEY REFERENCES Employee(id),
    job_id int NOT NULL FOREIGN KEY REFERENCES Job(id),
    store_id int NOT NULL FOREIGN KEY REFERENCES Store(id);

ALTER TABLE Employee ADD
    location_id int NOT NULL FOREIGN KEY REFERENCES Location(id),
    employee_status_id int NOT NULL FOREIGN KEY REFERENCES EmployeeStatus(id),
    employee_type_id int NOT NULL FOREIGN KEY REFERENCES EmployeeType(id);

ALTER TABLE Location ADD
     state_id int NOT NULL FOREIGN KEY REFERENCES StateProvince(id) DEFAULT 1407;


--Jade N
ALTER TABLE CustomerSocialMedia ADD
    customer_id int NOT NULL FOREIGN KEY REFERENCES Customer(id),
    social_media_type_id int NOT NULL FOREIGN KEY REFERENCES SocialMediaType(id);

ALTER TABLE PointLog ADD
    customer_id int NOT NULL FOREIGN KEY REFERENCES Customer(id),
    employee_id int NOT NULL FOREIGN KEY REFERENCES Employee(id),
    reason_id int NOT NULL FOREIGN KEY REFERENCES PointReasonType(id),
    order_id int FOREIGN KEY REFERENCES "Order"(id);

--Julia C
ALTER TABLE OrderLine ADD
    product_id int NOT NULL FOREIGN KEY REFERENCES Product(id),
    order_id int NOT NULL FOREIGN KEY REFERENCES "Order"(id);

ALTER TABLE CustomerReward ADD
    order_id int NOT NULL UNIQUE FOREIGN KEY REFERENCES "Order"(id),
    reward_id int NOT NULL FOREIGN KEY REFERENCES Reward(id),
    free_product_id int FOREIGN KEY REFERENCES Product(id);

ALTER TABLE Customer ADD
    create_employee_id int FOREIGN KEY REFERENCES Employee(id),
    customer_status_id int NOT NULL FOREIGN KEY REFERENCES CustomerStatus(id),
    tier_id int FOREIGN KEY REFERENCES Tier(id),
    location_id int FOREIGN KEY REFERENCES Location(id);



--Kyle D
ALTER TABLE EmployeeEmployeeCategory ADD
    employee_id int NOT NULL FOREIGN KEY REFERENCES Employee(id),
    employee_category_id int NOT NULL FOREIGN KEY REFERENCES EmployeeCategory(id);


--Rebecca H
ALTER TABLE StateProvince 
    ADD country_id int NOT NULL FOREIGN KEY REFERENCES Country(id);

ALTER TABLE CustomerCustomerCategory 
    ADD customer_id int NOT NULL FOREIGN KEY REFERENCES Customer(id);

ALTER TABLE CustomerCustomerCategory 
    ADD customer_category_id int NOT NULL FOREIGN KEY REFERENCES CustomerCategory(id);

--Saja A
ALTER TABLE EmployeeSocialMedia ADD
    employee_id int NOT NULL FOREIGN KEY REFERENCES Employee(id),
    social_media_type_id int NOT NULL FOREIGN KEY REFERENCES SocialMediaType(id);

ALTER TABLE StoreSocialMedia ADD
    store_id int NOT NULL FOREIGN KEY REFERENCES Store(id),
    social_media_type_id int NOT NULL FOREIGN KEY REFERENCES SocialMediaType(id);

ALTER TABLE StoreReward ADD
    store_id int NOT NULL FOREIGN KEY REFERENCES Store(id),
    reward_id int NOT NULL FOREIGN KEY REFERENCES Reward(id);

--Srijana S
ALTER TABLE Product ADD
	product_type_id int NOT NULL FOREIGN KEY REFERENCES ProductType(id),
	product_status_id int NOT NULL FOREIGN KEY REFERENCES ProductStatus(id),
	ban_reason_id int FOREIGN KEY REFERENCES BanType(id);

ALTER TABLE Store ADD
	location_id int NOT NULL FOREIGN KEY REFERENCES Location(id),
	store_status_id int NOT NULL FOREIGN KEY REFERENCES StoreStatus(id);


--Torrey B
ALTER TABLE "Order" ADD
	customer_id int NOT NULL FOREIGN KEY REFERENCES Customer(id),
	payment_type_id int NOT NULL FOREIGN KEY REFERENCES PaymentType(id),
	store_id int NOT NULL FOREIGN KEY REFERENCES Store(id),
	employee_id int NOT NULL FOREIGN KEY REFERENCES Employee(id);

ALTER TABLE StoreProduct ADD
	product_id int NOT NULL FOREIGN KEY REFERENCES Product(id),
	store_id int NOT NULL FOREIGN KEY REFERENCES Store(id);


--Umair
ALTER TABLE Reward ADD
    reward_status_id int NOT NULL FOREIGN KEY REFERENCES RewardStatus(id),
    free_product_id int FOREIGN KEY REFERENCES Product(id),
    tier_id int FOREIGN KEY REFERENCES Tier(id);


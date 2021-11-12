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
    label_name varchar(40) NOT NULL,
    label_desc varchar(200),
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
	points_consumed int NOT NULL DEFAULT 0,
	points_produced int NOT NULL DEFAULT 0,
	date date NOT NULL
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
    created_date date NOT NULL,
);

CREATE TABLE OrderLine(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    quantity int NOT NULL DEFAULT 0,
    ind_price numeric(19,4) NOT NULL DEFAULT 0,
    total_price numeric(19,4) NOT NULL DEFAULT 0,
);

CREATE TABLE OrderReward(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    date_applied date NOT NULL,
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
    product_name nvarchar (40) NOT NULL,
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
    store_name nvarchar(40) NOT NULL,
    phone_number nvarchar(15) NOT NULL,
    email_address nvarchar(254) NOT NULL,
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
    reward_name varchar(40) NOT NULL,
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


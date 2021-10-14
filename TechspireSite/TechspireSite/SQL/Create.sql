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
reason_name varchar(40) NOT NULL,
reason_desc varchar(200) NOT NULL
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



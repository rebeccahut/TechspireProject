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
    zip_code nvarchar(10) NOT NULL,
    city nvarchar(35) NOT NULL,
    address nvarchar(100) NOT NULL,
);


--Jade N
CREATE TABLE PointReasonType(
id int NOT NULL PRIMARY KEY IDENTITY(1,1),
reason_name varchar(40) NOT NULL,
reason_desc varchar(200) NOT NULL
);

--Srijana S
CREATE TABLE Product ( 
    id int PRIMARY KEY IDENTITY(1,1), 
    product_name nvarchar (40) NOT NULL,
    product_desc nvarchar (200) NOT NULL, 
    product_price numeric(19,4) CHECK (product_price >= 0) NOT NULL, 
    ban_reason_id int
); 

CREATE TABLE ProductType(
    id int PRIMARY KEY IDENTITY(1,1),
    product_type_name varchar (40) NOT NULL,
    product_type_desc varchar (200)
);

CREATE TABLE ProductStatus (
    id int PRIMARY KEY IDENTITY(1,1),
    product_status_name nvarchar (50) NOT NULL,
    product_status_desc nvarchar (200)
);

CREATE TABLE Store(
    id INT PRIMARY KEY IDENTITY(1,1),
    store_name nvarchar(40) NOT NULL,
    store_phone nvarchar(15) NOT NULL,
    store_email_address nvarchar(254) NOT NULL,
    store_launch_date date,
    store_close_date date
);



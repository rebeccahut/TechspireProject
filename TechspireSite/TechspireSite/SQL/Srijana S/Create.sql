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

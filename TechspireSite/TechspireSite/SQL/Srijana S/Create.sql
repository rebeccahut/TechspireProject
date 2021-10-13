CREATE TABLE product ( --Product
    id INT PRIMARY KEY IDENTITY(1,1), --id
    product_name VARCHAR(40) NOT NULL,
    product_description VARCHAR (200) NOT NULL, --product_desc
    product_price DECIMAL (10,2) CHECK (product_price >= 0) NOT NULL, --numeric(19,4)
    product_status_id INT NOT NULL, --Alter Script
    ban_reason_id INT
); --Alter

CREATE TABLE product_type(
    id int PRIMARY KEY IDENTITY(1,1),--id
    product_type_name VARCHAR(40) NOT NULL,
    product_type_description VARCHAR(200)
);

CREATE TABLE product_status (
    id int PRIMARY KEY IDENTITY(1,1), --id IDENTITY(1,1)
    product_status_name nvarchar (50) NOT NULL,
    product_status_desc nvarchar (200) --200
);

CREATE TABLE store(
    id INT PRIMARY KEY IDENTITY(1,1),--id
    store_name nvarchar(50) NOT NULL,
    store_phone nvarchar(14) NOT NULL,
    store_email_address nvarchar(100) NOT NULL,
    store_launch_date date,
    store_close_date date
);

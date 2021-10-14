CREATE TABLE CustomerCategory(
id int NOT NULL PRIMARY KEY IDENTITY(1,1),
cust_category_name varchar(40) NOT NULL, 
cust_category_desc varchar(200)
);

CREATE TABLE CustomerCustomerCategory(
id int NOT NULL PRIMARY KEY IDENTITY(1,1)
);

CREATE TABLE StateProvince(
id int NOT NULL PRIMARY KEY IDENTITY(1,1),
state_province_name varchar(60) NOT NULL
);

CREATE TABLE Country(
id int NOT NULL PRIMARY KEY IDENTITY(1,1)
country_iso number NOT NULL,
country_name varchar(60) NOT NULL
);
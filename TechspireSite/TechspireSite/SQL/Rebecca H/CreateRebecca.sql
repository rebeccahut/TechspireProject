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

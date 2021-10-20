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
);
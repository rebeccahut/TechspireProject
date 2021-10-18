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

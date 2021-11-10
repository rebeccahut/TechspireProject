CREATE TABLE CustomerStatus(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    status_name varchar(40) NOT NULL,
    status_desc varchar(200) NOT NULL,
    is_active bit NOT NULL DEFAULT 1,
);

CREATE TABLE PaymentType(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    type_name varchar(40) NOT NULL,
    type_desc varchar(200) NULL,
);

CREATE TABLE Reward(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    reward_name varchar(80) NOT NULL,
    reward_desc varchar(200) NULL,
    point_cost int NOT NULL DEFAULT 0,
    reset_period int DEFAULT 0,
    discount_amount numeric(19,4) NOT NULL DEFAULT 0,
    date_added date NOT NULL DEFAULT GETDATE(),
    date_disabled date,
);

CREATE TABLE Tier(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    tier_name varchar(40) NOT NULL,
    tier_desc varchar(200) NULL,
    min_points int NOT NULL DEFAULT 0,
);
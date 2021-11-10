CREATE TABLE Customer(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    first_name nvarchar(40) NOT NULL,
    last_name nvarchar(40) NOT NULL,
    email_address nvarchar(254) NOT NULL,
    phone_number nvarchar(15) NOT NULL DEFAULT '+19043335252',
    comments nvarchar(max),
    birthdate date NOT NULL,
    begin_date date NOT NULL DEFAULT GETDATE(),
    points_earned int NOT NULL DEFAULT 0 CHECK (points_earned>=0),
    points_spent int NOT NULL DEFAULT 0 CHECK (points_spent>=0),
    point_total int NOT NULL DEFAULT 0,
);

CREATE TABLE OrderLine(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    quantity int NOT NULL DEFAULT 0,
    ind_price numeric(19,4) NOT NULL DEFAULT 0,
    total_price numeric(19,4) NOT NULL DEFAULT 0,
    points_eligible bit NOT NULL DEFAULT 1
);

CREATE TABLE CustomerReward(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    point_cost int NOT NULL DEFAULT 0,
    discount_amount numeric(19,4) NOT NULL DEFAULT 0,
);
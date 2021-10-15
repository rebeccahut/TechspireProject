CREATE TABLE Customer(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    first_name nvarchar(40) NOT NULL,
    last_name nvarchar(40) NOT NULL,
    email_address nvarchar(254) NOT NULL,
    phone_number nvarchar(15) NOT NULL,
    comments nvarchar(max),
    birthdate date NOT NULL,
    created_date date NOT NULL,
    create_employee_id int(8) NOT NULL, --Should be a foreign key in an alter script see other teammembers alter scripts in their folders
    customer_status_id int(8) NOT NULL, --Alter
    tier_id int(3) NOT NULL, --Alter
    location_id int(8) NOT NULL, --Alter
);

CREATE TABLE OrderLine(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    quantity int(4)  NOT NULL DEFAULT 0,
    ind_price numeric(19) NOT NULL DEFAULT 0, --Should be numeric(19,4) since the data dictionary lists a 4 decimal place constraint
    total_price numeric(19) NOT NULL DEFAULT 0, --Should be numeric(19,4)
    product_id int(8) NOT NULL, --Alter
    order_id int(8), --Alter
);

CREATE TABLE CustomerReward(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    date_applied date NOT NULL,
    customer_id int(8) NOT NULL, --Alter
    reward_id int(8) NOT NULL, --Alter
);
CREATE TABLE EmployeeCategory(
    id int PRIMARY KEY IDENTITY(1,1), 
    category_name nvarchar (40) NOT NULL,
    category_desc nvarchar (200)
);

CREATE TABLE EmployeeEmployeeCategory(
    id int PRIMARY KEY IDENTITY(1,1),
    created_date date NOT NULL DEFAULT GETDATE()
);

CREATE TABLE EmployeeType(
    id int PRIMARY KEY IDENTITY(1,1),
    type_name nvarchar(40) NOT NULL,
    type_desc nvarchar(200),
);

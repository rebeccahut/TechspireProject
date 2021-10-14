CREATE TABLE EmployeeCategory(
    id int PRIMARY KEY IDENTITY(1,1), 
    category_name nvarchar (40) NOT NULL,
    category_desc nvarchar (200) NOT NULL,
)

CREATE TABLE EmployeeEmployeeCategory (
    id int PRIMARY KEY IDENTITY(1,1),
)

CREATE TABLE EmployeeType (
    id int PRIMARY KEY IDENTITY(1,1),
    emp_type_name nvarchar(40) NOT NULL,
    emp_type_desc nvarchar(200) NOT NULL,
)

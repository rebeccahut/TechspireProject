CREATE TABLE EmployeeCategory (
    id int PRIMARY KEY IDENTITY(1,1), 
    emp_category_name nvarchar (40) NOT NULL,
    emp_category_desc nvarchar (200) NOT NULL,
)

CREATE TABLE EmployeeEmployeeCategory (
    id int PRIMARY KEY IDENTITY(1,1),
    employee_employee_name nvarchar(40) NOT NULL,
    employee_employee_desc nvarchar(200) NOT NULL,
)

CREATE TABLE EmployeeType (
    id int PRIMARY KEY IDENTITY(1,1),
    emp_type_name nvarchar(40) NOT NULL,
    emp_type_desc nvarchar(200) NOT NULL,
)
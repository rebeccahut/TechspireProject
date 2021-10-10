CREATE TABLE Employee(
id int NOT NULL PRIMARY KEY IDENTITY(1,1),
begin_date date NOT NULL, 
end_date date, 
first_name varchar(40) NOT NULL, 
last_name varchar(40) NOT NULL, 
email_address varchar(254) NOT NULL, 
phone_number varchar(14) NOT NULL, 
comments text, 
birthdate date NOT NULL
);

CREATE TABLE EmployeeJob(
id int NOT NULL PRIMARY KEY IDENTITY(1,1),
assign_date date NOT NULL
);

CREATE TABLE Job(
id int NOT NULL PRIMARY KEY IDENTITY(1,1),
job_name varchar(40) NOT NULL, 
job_desc varchar(200), 
);
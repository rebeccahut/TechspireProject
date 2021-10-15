CREATE TABLE CustomerStatus(
id int NOT NULL PRIMARY KEY IDENTITY(1,1),
status_name varchar(40) NOT NULL,
status_desc varchar(200) NOT NULL,
is_active bit NOT NULL,
);
CREATE TABLE PaymentType(
id int NOT NULL PRIMARY KEY IDENTITY(1,1),
label_name varchar(40) NOT NULL,
label_desc varchar(200) NOT NULL,
);
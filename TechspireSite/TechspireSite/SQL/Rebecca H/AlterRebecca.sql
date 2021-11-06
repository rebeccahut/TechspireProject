ALTER TABLE StateProvince 
    ADD country_id int NOT NULL FOREIGN KEY REFERENCES Country(id);

ALTER TABLE CustomerCustomerCategory 
    ADD customer_id int NOT NULL FOREIGN KEY REFERENCES Customer(id);

ALTER TABLE CustomerCustomerCategory 
    ADD customer_category_id int NOT NULL FOREIGN KEY REFERENCES CustomerCategory(id);
ALTER TABLE StateProvince 
    ADD country_id int FOREIGN KEY REFERENCES Country(id);

ALTER TABLE CustomerCustomerCategory 
    ADD customer_id int FOREIGN KEY REFERENCES Customer(id);

ALTER TABLE CustomerCustomerCategory 
    ADD customer_category_id int FOREIGN KEY REFERENCES CustomerCategory(id);
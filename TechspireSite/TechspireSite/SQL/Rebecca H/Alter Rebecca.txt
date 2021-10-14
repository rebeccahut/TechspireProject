ALTER TABLE StateProvince 
ADD FOREIGN KEY(country_id) REFERENCES Country(id);

ALTER TABLE CustomerCustomerCategory 
ADD FOREIGN KEY(customer_id) REFERENCES Customer(id);

ALTER TABLE CustomerCustomerCategory 
ADD FOREIGN KEY(customer_category_id) REFERENCES CustomerCategory(id);
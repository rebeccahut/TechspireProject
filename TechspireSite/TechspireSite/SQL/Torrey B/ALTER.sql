ALTER TABLE "Order" ADD
	customer_id int NOT NULL FOREIGN KEY REFERENCES Customer(id),
	payment_type_id int NOT NULL FOREIGN KEY REFERENCES PaymentType(id),
	store_id int NOT NULL FOREIGN KEY REFERENCES Store(id),
	employee_id int NOT NULL FOREIGN KEY REFERENCES Employee(id);

ALTER TABLE StoreProduct ADD
	product_id int NOT NULL FOREIGN KEY REFERENCES Product(id),
	store_id int NOT NULL FOREIGN KEY REFERENCES Store(id);

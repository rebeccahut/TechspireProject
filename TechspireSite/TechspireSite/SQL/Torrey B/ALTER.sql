ALTER TABLE "Order" ADD
	customer_id int FOREIGN KEY REFERENCES CustomerType(id),
	payment_type_id int FOREIGN KEY REFERENCES PaymentType(id),
	store_id int FOREIGN KEY REFERENCES Store(id);

ALTER TABLE StoreProduct ADD
	product_id int FOREIGN KEY REFERENCES Product(id),
	store_id int FOREIGN KEY REFERENCES Store(id);

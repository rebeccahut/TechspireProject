ALTER TABLE Product ADD
	product_type_id int NOT NULL FOREIGN KEY REFERENCES ProductType(id),
	product_status_id int NOT NULL FOREIGN KEY REFERENCES ProductStatus(id),
	ban_reason_id int NOT NULL FOREIGN KEY REFERENCES BanType(id);

ALTER TABLE Store ADD
	location_id int NOT NULL FOREIGN KEY REFERENCES Location(id),
	store_status_id int NOT NULL FOREIGN KEY REFERENCES StoreStatus(id);

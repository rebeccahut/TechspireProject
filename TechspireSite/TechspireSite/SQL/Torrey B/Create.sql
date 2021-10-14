CREATE TABLE "Order" (
id int NOT NULL PRIMARY KEY IDENTITY (1,1),
order_date date NOT NULL,
original_total DECIMAL(10,2) NOT NULL,
final_total DECIMAL(10,2) NOT NULL,
discount_amount DECIMAL(10,2) NOT NULL,

);



CREATE TABLE StoreProduct(
id int NOT NULL PRIMARY KEY IDENTITY (1,1),
product_assigned date NOT NULL,

)


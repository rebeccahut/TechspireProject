CREATE TABLE "Order" (
    id int NOT NULL PRIMARY KEY IDENTITY (1,1),
    order_date date NOT NULL,
    original_total numeric(19,4) NOT NULL DEFAULT 0,
    final_total numeric(19,4) NOT NULL DEFAULT 0,
    discount_amount numeric(19,4) NOT NULL DEFAULT 0,
);

CREATE TABLE StoreProduct(
    id int NOT NULL PRIMARY KEY IDENTITY (1,1),
    product_assigned date NOT NULL,
);

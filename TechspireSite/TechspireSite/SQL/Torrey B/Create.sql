CREATE TABLE "Order" (
    id int NOT NULL PRIMARY KEY IDENTITY (1,1),
    order_date date NOT NULL DEFAULT GETDATE(),
    original_total numeric(19,4) NOT NULL DEFAULT 0 CHECK (original_total>=0),
    final_total numeric(19,4) NOT NULL DEFAULT 0 CHECK (final_total>=0),
    discount_amount numeric(19,4) NOT NULL DEFAULT 0 CHECK (discount_amount>=0),
    eligible_for_points numeric(19,4) NOT NULL DEFAULT 0 CHECK (eligible_for_points>=0),
    points_consumed int NOT NULL DEFAULT 0 CHECK (points_consumed>=0),
    points_produced int NOT NULL DEFAULT 0 CHECK (points_produced>=0),
    points_total int NOT NULL DEFAULT 0,
);

CREATE TABLE StoreProduct(
    id int NOT NULL PRIMARY KEY IDENTITY (1,1),
    product_assigned date NOT NULL DEFAULT GETDATE(),
);

CREATE TABLE SocialMediaType(
	id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	social_media_name nvarchar(40) NOT NULL,
	social_media_desc nvarchar(200)
);

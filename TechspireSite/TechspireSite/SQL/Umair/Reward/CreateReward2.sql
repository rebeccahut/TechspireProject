CREATE TABLE Reward(
id bigint NOT NULL PRIMARY KEY IDENTITY(1,1),
reward_name varchar(40) NOT NULL,
reward_desc varchar(200) NOT NULL,
reward_status_id bigint NOT NULL,
point_cost int DEFAULT 0 NOT NULL,
rest_period int DEFAULT 0 NULL,
discount_amount numeric DEFAULT 0 NOT NULL,
free_product_id bigint NULL,
tier_id bigint NULL,
date_added date NOT NULL,
);
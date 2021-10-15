CREATE TABLE Reward(
id bigint NOT NULL PRIMARY KEY IDENTITY(1,1),
reward_name varchar(40) NOT NULL,
reward_desc varchar(200) NOT NULL,
point_cost int DEFAULT 0 NOT NULL,
rest_period int DEFAULT 0 NULL,
discount_amount numeric DEFAULT 0 NOT NULL,
date_added date NOT NULL,
);
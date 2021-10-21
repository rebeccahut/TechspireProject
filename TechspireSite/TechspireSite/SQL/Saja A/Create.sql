CREATE TABLE StoreSocialMedia(
id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
instagram_id VARCHAR(30) NOT NULL,
facebook_id VARCHAR(50) NOT NULL,
linkedin_id VARCHAR(100) NOT NULL,
twitter_id VARCHAR(50) NOT NULL,
napchat_id VARCHAR (30) NOT NULL,
pinterest_id VARCHAR(30) NOT NULL
);

CREATE TABLE EmployeeSocialMedia(
id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
instagram_id VARCHAR(30) NOT NULL,
facebook_id VARCHAR(50) NOT NULL,
linkedin_id VARCHAR(100) NOT NULL,
twitter_id VARCHAR(50) NOT NULL,
napchat_id VARCHAR (30) NOT NULL,
pinterest_id VARCHAR(30) NOT NULL
);

CREATE TABLE StoreReward (
store_reward_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
store_id INT NOT NULL,
customer_reward_id INT NOT NULL
);

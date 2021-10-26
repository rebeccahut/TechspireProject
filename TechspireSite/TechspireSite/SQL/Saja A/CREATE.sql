CREATE TABLE StoreReward(
	id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	reward_assigned date NOT NULL
);

CREATE TABLE StoreSocialMedia(
	id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	social_media_code nvarchar(60) NOT NULL,
	date_added date NOT NULL
);

CREATE TABLE EmployeeSocialMedia(
	id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	social_media_code nvarchar(60) NOT NULL,
	date_added date NOT NULL
);

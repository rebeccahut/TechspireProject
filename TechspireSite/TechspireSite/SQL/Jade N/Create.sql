CREATE TABLE PointReasonType(
	id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	reason_name nvarchar(40) NOT NULL,
	reason_desc nvarchar(200) 
);

CREATE TABLE PointLog(
	id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	points_amount int NOT NULL DEFAULT 0,
	date date NOT NULL
);

CREATE TABLE CustomerSocialMedia(
	id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	social_media_code nvarchar(60) NOT NULL, 
	date_added date NOT NULL
);

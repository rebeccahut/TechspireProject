CREATE TABLE EmployeeStatus
(EmployeeID int,
Status_Name varchar(40),
Status_Desc varchar(200),
Is_Active bit,
Status_Assigned date
)

CREATE TABLE RewardStatus
(Reward_ID int,
Status_Name varchar(40),
Status_Desc varchar(200),
Is_Active bit,
Status_Assigned date
)

CREATE TABLE StoreStatus
(Store_ID int,
Status_Name varchar(40),
Status_Desc varchar(200),
Is_Active bit,
Status_Assigned date
)

CREATE TABLE BanType 
(Ban_ID int,
Label_Name varchar(40),
Label_Desc varchar(200)
)
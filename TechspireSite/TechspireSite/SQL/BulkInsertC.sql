--Rebecca Hutchinson
BULK INSERT CustomerCategory
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\CustomerCategoryList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Kyle Dela Pena
BULK INSERT EmployeeCategory
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\EmployeeCategoryList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Alanna Gilcrease
BULK INSERT EmployeeStatus
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\EmployeeStatusList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Umair Shamsuddin
BULK INSERT CustomerStatus
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\CustomerStatusList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Srijana Shrestha
BULK INSERT ProductStatus
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\ProductStatusList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Alanna Gilcrease
BULK INSERT StoreStatus
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\StoreStatusList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Alanna Gilcrease
BULK INSERT RewardStatus
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\RewardStatusList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Alanna Gilcrease
BULK INSERT BanType
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\BanTypeList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Jade Nguyen
BULK INSERT PointReasonType
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\PointReasonTypeList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Rebecca Hutchinson
BULK INSERT Country
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\CountryList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Umair Shamsuddin
BULK INSERT Tier
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\TierList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Kyle Dela Pena
BULK INSERT EmployeeType
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\EmployeeTypeList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Brett Meirhofer
BULK INSERT Job
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\JobList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY 
	)
GO

--Umair Shamsuddin
BULK INSERT PaymentType
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\PaymentTypeList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Srijana Shrestha
BULK INSERT ProductType
from 'C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\ProductTypeList.tsv'
with
    (
	CHECK_CONSTRAINTS,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    KEEPIDENTITY
    )
GO

--Torrey Brett
BULK INSERT SocialMediaType
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\SocialMediaTypeList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Rebecca Hutchinson
BULK INSERT StateProvince
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\StateProvinceList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Srijana Shrestha
BULK INSERT Product
from 'C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\ProductList.tsv'
with
    (
	CHECK_CONSTRAINTS,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    KEEPIDENTITY,
    FIELDQUOTE = '~',
    FIRSTROW = 2
    )
GO

--Brett Meirhofer
BULK INSERT "Location"
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\LocationList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY
	)
GO

--Umair Shamsuddin
BULK INSERT Reward
from 'C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\RewardList.tsv'
with
    (
	CHECK_CONSTRAINTS,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    KEEPIDENTITY
    )
GO

--Brett Meirhofer
BULK INSERT Employee
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\EmployeeList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY 
	)
GO

--Srijana Shrestha
BULK INSERT Store
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\StoreList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Julia Chen
BULK INSERT Customer
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\CustomerList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Kyle Dela Pena
BULK INSERT "EmployeeEmployeeCategory"
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\EmployeeEmployeeCategoryList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Brett Meirhofer
BULK INSERT EmployeeJob
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\EmployeeJobList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a'
	)
GO

--Saja Alyasin
BULK INSERT StoreSocialMedia
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\StoreSocialMediaList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Saja Alyasin
BULK INSERT EmployeeSocialMedia
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\EmployeeSocialMediaList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Torrey Brett
BULK INSERT StoreProduct
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\StoreProductList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Saja Alyasin
BULK INSERT StoreReward
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\StoreRewardList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Rebecca Hutchinson
BULK INSERT CustomerCustomerCategory
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\CustomerCustomerCategoryList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Torrey Brett
BULK INSERT "Order"
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\OrderList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Jade Nguyen
BULK INSERT CustomerSocialMedia
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\CustomerSocialMediaList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Julia Chen
BULK INSERT OrderLine
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\OrderLineList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Julia Chen
BULK INSERT CustomerReward
FROM "C:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\CustomerRewardList.tsv"
WITH
	(
	CHECK_CONSTRAINTS,
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '0x0a',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO


UPDATE "Order"
SET original_total = Totals.Total,
final_total = Totals.Total
FROM "Order"
INNER JOIN (
SELECT 
SUM(OrderLine.total_price) AS Total, OrderLine.order_id
FROM OrderLine 
GROUP BY OrderLine.order_id)
AS Totals ON Totals.order_id = "Order".id



INSERT INTO PointLog(points_amount,created_date,customer_id,employee_id,reason_id,order_id)
SELECT (Floor(final_total)/10) AS point_cost,order_date, "Order".customer_id, "Order".employee_id, 4 AS reason_id, "Order".id
FROM "Order"



INSERT INTO PointLog(points_amount,created_date,customer_id,employee_id,reason_id,order_id)
SELECT -point_cost AS point_cost,date_added, "Order".customer_id, "Order".employee_id, 5 AS reason_id, "Order".id
FROM "CustomerReward"
JOIN Reward ON Reward.id = CustomerReward.id
JOIN "Order" ON "Order".id = CustomerReward.order_id



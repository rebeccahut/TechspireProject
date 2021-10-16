--Rebecca Hutchinson
BULK INSERT CustomerCategory
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\CustomerCategoryList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Kyle Dela Pena
BULK INSERT EmployeeCategory
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\EmployeeCategoryList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Alanna Gilcrease
BULK INSERT EmployeeStatus
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\EmployeeStatusList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Umair Shamsuddin
BULK INSERT CustomerStatus
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\CustomerStatusList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Srijana Shrestha
BULK INSERT ProductStatus
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\ProductStatusList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Alanna Gilcrease
BULK INSERT StoreStatus
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\StoreStatusList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Alanna Gilcrease
BULK INSERT RewardStatus
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\RewardStatusList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Alanna Gilcrease
BULK INSERT BanType
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\BanTypeList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Jade Nguyen
BULK INSERT PointReasonType
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\PointReasonTypeList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Rebecca Hutchinson
BULK INSERT Country
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\CountryList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Umair Shamsuddin
BULK INSERT Tier
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\TierList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Kyle Dela Pena
BULK INSERT EmployeeType
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\EmployeeTypeList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Brett Meirhofer
BULK INSERT Job
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\JobList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY 
	)
GO;

--Umair Shamsuddin
BULK INSERT PaymentType
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\PaymentTypeList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Srijana Shrestha
BULK INSERT ProductType
from 'D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\ProductTypeList.csv'
with
    (
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '\n',
    KEEPIDENTITY
    )
GO

--Torrey Brett
BULK INSERT SocialMediaType
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\SocialMediaTypeList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Rebecca Hutchinson
BULK INSERT StateProvince
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\StateProvinceList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Srijana Shrestha
BULK INSERT Product
from 'D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\ProductList.csv'
with
    (
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '\n',
    KEEPIDENTITY
    )
GO

--Brett Meirhofer
BULK INSERT "Location"
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\LocationList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY
	)
GO

--Umair Shamsuddin
BULK INSERT Reward
from 'D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\RewardList.csv'
with
    (
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '\n',
    KEEPIDENTITY
    )
GO

--Brett Meirhofer
BULK INSERT Employee
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\EmployeeList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY 
	)
GO

--Srijana Shrestha
BULK INSERT Store
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\StoreList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Julia Chen
BULK INSERT Customer
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\CustomerList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Kyle Dela Pena
BULK INSERT EmployeeStatus
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\CustomerSocialMediaList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Brett Meirhofer
BULK INSERT EmployeeJob
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\EmployeeJobList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n'
	)
GO

--Saja Alyasin
BULK INSERT EmployeeType
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\EmployeeTypeList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Saja Alyasin
BULK INSERT EmployeeSocialMedia
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\EmployeeSocialMediaList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Torrey Brett
BULK INSERT StoreProduct
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\StoreProductList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Saja Alyasin
BULK INSERT StoreReward
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\StoreRewardList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Rebecca Hutchinson
BULK INSERT CustomerCustomerCategory
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\CustomerCustomerCategoryList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Torrey Brett
BULK INSERT Order
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\OrderList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Jade Nguyen
BULK INSERT CustomerSocialMedia
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\CustomerSocialMediaList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Julia Chen
BULK INSERT CustomerReward
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\CustomerRewardList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Julia Chen
BULK INSERT OrderLine
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\OrderLineList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO

--Jade Nguyen
BULK INSERT PointLog
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\PointLogList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY,
	CODEPAGE = 65001
	)
GO


BULK INSERT ProductType
from 'D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\ProductTypeList.csv'
with
    (
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '\n',
    KEEPIDENTITY
    )
GO
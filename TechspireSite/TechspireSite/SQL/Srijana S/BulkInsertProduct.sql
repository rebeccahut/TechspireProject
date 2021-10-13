BULK INSERT Product
from 'D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\ProductList.csv'
with
    (
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '\n',
    KEEPIDENTITY
    )
GO
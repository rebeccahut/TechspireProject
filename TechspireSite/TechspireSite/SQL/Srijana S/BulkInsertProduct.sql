BULK INSERT Product
from 'D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\ProductList.tsv'
with
    (
	CHECK_CONSTRAINTS,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '\n',
    KEEPIDENTITY
    )
GO
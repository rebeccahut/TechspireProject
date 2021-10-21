BULK INSERT Reward
from 'D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\RewardList.tsv'
with
    (
	CHECK_CONSTRAINTS,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '\n',
    KEEPIDENTITY
    )
GO
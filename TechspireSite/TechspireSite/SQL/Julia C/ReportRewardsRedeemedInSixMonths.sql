-- Julia Chen
-- Rewards Redeemed over a Six Month Period
-- Client can view popular-redeemed rewards in a certain timespan and curate special reward offers to drive business during specific timeframes.
-- Displays all rewards redeemed by customers over a given six month timeframe
-- Row Number,Date,Reward Name,Point Value
SELECT ROW_NUMBER()
OVER(ORDER BY Reward.date_added) AS ROW_NUM,
OrderReward.date_applied AS 'Date',
Reward.Reward_name AS 'Reward Name',
Reward.point_cost AS 'Point Value'

FROM Reward
INNER JOIN CustomerReward ON  Reward.id = CustomerReward.reward_id 
INNER JOIN RewardStatus ON RewardStatus.id = Reward.reward_status_id

WHERE RewardStatus.is_active = 1
AND CustomerReward.date_applied > '2012-01-01' AND
CustomerReward.date_applied < '2012-06-30';
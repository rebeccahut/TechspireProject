-- Julia Chen
-- Rewards Redeemed over a Six Month Period
-- Row Number,Date,RewardName,PointValue
SELECT ROW_NUMBER()
OVER(ORDER BY Reward.date_added) AS ROW_NUM,
CustomerReward.date_applied AS 'Date',
Reward.Reward_name AS 'Reward Name',
Reward.point_cost AS 'Point Value'

FROM Reward
INNER JOIN CustomerReward ON  Reward.id = CustomerReward.reward_id 
INNER JOIN RewardStatus ON RewardStatus.id = Reward.reward_status_id
INNER JOIN PointLog on Reward.point_cost = PointLog.points_amount

WHERE RewardStatus.is_active = 1
AND CustomerReward.date_applied > '2012-01-01' AND
CustomerReward.date_applied < '2012-06-30';
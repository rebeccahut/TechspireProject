-- Julia Chen
-- Rewards Redeemed over a Six Month Period
-- Client can view popular-redeemed rewards in a certain timespan and curate special reward offers to drive business during specific timeframes.
-- Displays all rewards redeemed by customers over a given six month timeframe
-- Row Number,Date,Reward Name,Point Value
SELECT ROW_NUMBER()
OVER(ORDER BY OrderReward.date_applied) AS ROW_NUM,
OrderReward.date_applied AS 'Date',
Reward.Reward_name AS 'Reward Name',
Reward.point_cost AS 'Point Value',
COUNT(Reward.reward_name) AS 'Times Redeemed' 

FROM Reward
INNER JOIN OrderReward ON  Reward.id = OrderReward.reward_id
INNER JOIN Customer ON OrderReward.customer_id = Customer.id
INNER JOIN "Order" ON "Order".customer_id = Customer.id
INNER JOIN RewardStatus ON RewardStatus.id = Reward.reward_status_id
INNER JOIN PointLog on Reward.point_cost = PointLog.points_amount 

WHERE RewardStatus.is_active = 1
AND "Order".order_date > '2012-01-01' AND "Order".order_date < '2012-06-30'

GROUP BY OrderReward.date_applied, Reward.reward_name, Reward.point_cost

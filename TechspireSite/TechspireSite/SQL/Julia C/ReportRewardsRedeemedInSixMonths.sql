-- Julia Chen
-- Rewards Redeemed over a Six Month Period
-- Client can view popular-redeemed rewards in a certain timespan and curate special reward offers to drive business during specific timeframes.
-- Displays all rewards redeemed by customers over a given six month timeframe
-- Row Number,Date,Reward Name,Point Value
SELECT ROW_NUMBER()
OVER(ORDER BY "Order".order_date) AS ROW_NUM,
Reward.Reward_name AS 'Reward Name',
Reward.point_cost AS 'Point Value',
"Order".order_date AS 'Date',
COUNT(Reward.reward_name) AS 'Times Redeemed' 

FROM Reward
INNER JOIN OrderReward ON  Reward.id = OrderReward.reward_id
--INNER JOIN Customer ON OrderReward.customer_id = Customer.id
--INNER JOIN OrderReward ON OrderReward.id = Reward.order_id
--INNER JOIN "Order" ON "Order".customer_id = Customer.id
--INNER JOIN RewardStatus ON RewardStatus.id = Reward.reward_status_id
--INNER JOIN PointLog on Reward.point_cost = PointLog.points_amount 



--WHERE RewardStatus.is_active = 1
--AND "Order".order_date > '2012-01-01' AND "Order".order_date < '2012-06-30'
--AND DATEPART(m FROM Customer.begin_date) = '10' 
--AND DATEPART(yyyy FROM Customer.begin_date) = '2017'


GROUP BY Reward.reward_name, Reward.point_cost

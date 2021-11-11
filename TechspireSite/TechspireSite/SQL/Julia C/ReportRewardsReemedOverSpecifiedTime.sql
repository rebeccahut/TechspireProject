-- Julia Chen
-- Rewards Redeemed over a Given Time Period and Store
--
--
--

DECLARE @store_id VARCHAR(12) = 1
DECLARE @begin_date VARCHAR(2) = '2015-01-01'
DECLARE @end_date VARCHAR(4) = '2015-06-30'
SELECT ROW_NUMBER()
OVER (ORDER BY "Order".order_date) AS ROW_NUM,

"Order".store_id AS 'Location',
MAX("Order".order_date) AS 'Latest Date Redeemed',
Reward.reward_name AS 'Reward Name',
COUNT(Reward.id) AS 'Times Redeemed'

FROM "Order"
JOIN OrderReward ON OrderReward.order_id = "Order".id -- compare orders that have rewards
JOIN Reward ON reward.id = OrderReward.reward_id -- identify which rewards were redeemed 
JOIN Store ON Store.id = "Order".store_id -- view records from a specific store
JOIN PointLog ON PointLog.order_id = "Order".id

WHERE "Order".store_id = @store_id
AND "Order".order_date >= @begin_date AND "Order".order_date <= @end_date

GROUP BY "Order".store_id, "Order".order_date, Reward.reward_name


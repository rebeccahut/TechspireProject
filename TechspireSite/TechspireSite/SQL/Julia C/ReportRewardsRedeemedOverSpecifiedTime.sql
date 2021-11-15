--Julia Chen
--Rewards Redeemed over a Given Time Period and Store
--The client can input a certain timespan and view which rewards have been redeemed in that timeframe, how many times it was redeemed in that timeframe, and the latest date that the reward was redeemed by a customer. The client can use this to determine which rewards were most popular with her customers and choose to release new reward types that are like the existing rewards that have already been proven to be popular. This data can also be used to help the client make business decisions in figuring out which product reward types could be successful with her customer base in the future. The client could also utilize this report to aid her in curating limited-time reward offers to drive business sale during specific seasons of the year.
--This report displays all rewards redeemed by customers over a given timeframe (month and year).
--Row,Location,Latest Date,Reward,Times Redeemed
--,,,,

DECLARE @store_id VARCHAR(12) = 1
DECLARE @begin_date VARCHAR(12) = '2015-01-01'
DECLARE @end_date VARCHAR(12) = '2015-12-31'
SELECT ROW_NUMBER()
OVER (ORDER BY "Order".order_date) AS ROW_NUM,

"Order".store_id AS 'Location',
MAX("Order".order_date) AS 'Latest Date Redeemed',
Reward.reward_name AS 'Reward Name',
COUNT(Reward.id) AS 'Times Redeemed'

FROM "Order"
JOIN OrderReward ON OrderReward.order_id = "Order".id
JOIN Reward ON reward.id = OrderReward.reward_id 
JOIN Store ON Store.id = "Order".store_id 
JOIN PointLog ON PointLog.order_id = "Order".id

WHERE "Order".store_id = @store_id
AND "Order".order_date >= @begin_date AND "Order".order_date <= @end_date

GROUP BY "Order".store_id, "Order".order_date, Reward.reward_name


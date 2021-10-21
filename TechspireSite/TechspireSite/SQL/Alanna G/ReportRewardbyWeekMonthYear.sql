--Alanna Gilcrease
--Used Reward by Month
--The client could use this report to view a list of rewards that have been redeemed by week, month, or year.
--Displays all rewards used by customers for the month
--Row Number, Customer Name, Point Cost, Total Redeemed Month

SELECT ROW_NUMBER() 
OVER(ORDER BY "Order".order_date) AS 'Row Num',
Customer.first_name AS 'First Name',
Customer.last_name AS 'Last Name',
CustomerStatus.is_active AS 'Status',
Reward.point_cost AS 'Total Points',
RewardStatus.is_active AS 'Available'

FROM Reward
INNER JOIN CustomerReward ON  Reward.id = CustomerReward.reward_id 
INNER JOIN Customer ON CustomerReward.customer_id = Customer.id
INNER JOIN "Order" ON "Order".customer_id = Customer.id
INNER JOIN RewardStatus ON RewardStatus.id = Reward.reward_status_id
INNER JOIN PointLog on Reward.point_cost = PointLog.points_amount

WHERE RewardStatus.is_active = 1
AND "Order".order_date > '2020-09-01' AND "Order".order_date < '2020-10-30'


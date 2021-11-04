UPDATE Customer
SET Customer.points_earned = Points.points_produced, 
Customer.points_spent = -Loss.points_produced, 
Customer.point_total = Points.points_produced + Loss.points_produced
FROM Customer
INNER JOIN
(SELECT SUM(PointLog.points_amount) as points_produced,PointLog.customer_id FROM PointLog
WHERE PointLog.points_amount >= 0
GROUP BY PointLog.customer_id) AS Points ON Points.customer_id = Customer.id
INNER JOIN
(SELECT SUM(PointLog.points_amount) as points_produced,PointLog.customer_id FROM PointLog
WHERE PointLog.points_amount < 0
GROUP BY PointLog.customer_id) AS Loss ON Loss.customer_id = Customer.id
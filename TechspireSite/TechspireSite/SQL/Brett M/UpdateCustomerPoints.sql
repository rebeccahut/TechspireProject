UPDATE Customer
SET Customer.points_earned = Points.points_produced
FROM Customer
INNER JOIN
(SELECT SUM(PointLog.points_amount) as points_produced,PointLog.customer_id FROM PointLog
WHERE PointLog.points_amount >= 0
GROUP BY PointLog.customer_id) AS Points ON Points.customer_id = Customer.id


UPDATE Customer
SET Customer.points_spent = -Points.points_produced
FROM Customer
INNER JOIN
(SELECT SUM(PointLog.points_amount) as points_produced,PointLog.customer_id FROM PointLog
WHERE PointLog.points_amount < 0
GROUP BY PointLog.customer_id) AS Points ON Points.customer_id = Customer.id

UPDATE Customer
SET Customer.point_total = Customer.points_earned - Customer.points_spent

--Torrey Brett
--Customer Spending and Points
--The client can yeah
--Displays all customers and their spending totals/point totals
--Row Number,First Name,Last Name,Spending Total,Point Total


SELECT Customer.first_name, Customer.last_name, Totals.total, Points.total FROM
(SELECT
SUM ("ORDER".final_total) AS total, "Order".customer_id
FROM "ORDER"
GROUP BY "Order".customer_id)
AS Totals
INNER JOIN Customer on Customer.id = Totals.customer_id
INNER JOIN (SELECT
SUM (PointLog.points_amount) AS total, PointLog.customer_id
FROM PointLog
GROUP BY PointLog.customer_id)
AS Points ON Points.customer_id = Totals.customer_id
ORDER BY Totals.total

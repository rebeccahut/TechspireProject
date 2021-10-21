INSERT INTO PointLog(points_amount,created_date,customer_id,employee_id,reason_id,order_id)
SELECT (Floor(final_total)/10) AS point_cost,order_date, "Order".customer_id, "Order".employee_id, 4 AS reason_id, "Order".id
FROM "Order"



INSERT INTO PointLog(points_amount,created_date,customer_id,employee_id,reason_id,order_id)
SELECT -point_cost AS point_cost,date_added, "Order".customer_id, "Order".employee_id, 5 AS reason_id, "Order".id
FROM "CustomerReward"
JOIN Reward ON Reward.id = CustomerReward.id
JOIN "Order" ON "Order".id = CustomerReward.order_id



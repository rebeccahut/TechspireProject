--Updates the total's on an order based on the total's of it's order-lines
UPDATE "Order"
SET original_total = Totals.Total,
final_total = Totals.Total, eligible_for_points = Totals.Total, points_produced = (Floor(Totals.Total)/10)
FROM "Order"
INNER JOIN (
SELECT 
SUM(OrderLine.total_price) AS Total, OrderLine.order_id
FROM OrderLine 
GROUP BY OrderLine.order_id)
AS Totals ON Totals.order_id = "Order".id

DROP TABLE #TempTable

SELECT
SUM(OrderLine.total_price) AS Total, OrderLine.order_id
INTO #TempTable
FROM OrderLine
GROUP BY OrderLine.order_id

UPDATE "Order"
SET original_total = #TempTable.Total,
final_total = #TempTable.Total
FROM "Order"
INNER JOIN #TempTable ON "Order".id = #TempTable.order_id



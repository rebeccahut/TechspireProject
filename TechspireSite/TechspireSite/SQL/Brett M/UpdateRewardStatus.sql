UPDATE "Reward"
SET date_disabled = Selection.end_date, reward_status_id = 2
FROM
(SELECT TOP 20 PERCENT
id, abs(checksum(NewId()) % 100) as points,'2020-2-15' as end_date
FROM Reward
ORDER BY NEWID()) AS Selection
WHERE Selection.id = Reward.id
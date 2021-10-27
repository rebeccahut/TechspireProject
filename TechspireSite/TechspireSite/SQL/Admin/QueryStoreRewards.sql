SELECT * 
FROM Reward
INNER JOIN StoreReward ON StoreReward.reward_id = Reward.id
WHERE StoreReward.store_id = %s

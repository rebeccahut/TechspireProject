UPDATE CustomerReward
SET CustomerReward.point_cost = Reward.point_cost, 
CustomerReward.discount_amount = Reward.discount_amount, 
CustomerReward.free_product_id = Reward.free_product_id
FROM CustomerReward
INNER JOIN Reward ON CustomerReward.reward_id = Reward.id
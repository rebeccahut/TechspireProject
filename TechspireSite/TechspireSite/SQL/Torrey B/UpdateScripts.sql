--ADD total column to store table
ALTER TABLE Store
ADD  total_number_of_transactions int;

-- count the number of orders made at store ID 1 and update the store total number of transactions to reflect which store is getting more traffic
UPDATE STORE SET total_number_of_transactions = 
(SELECT COUNT(store_id) FROM "Order"
WHERE store_id = 1)
WHERE Store.id = 1

-- count the number of orders made at store ID 1 and update the store total number of transactions to reflect which store is getting more traffic
UPDATE STORE SET total_number_of_transactions = 
(SELECT COUNT(store_id) FROM "Order"
WHERE store_id = 2)
WHERE Store.id = 2


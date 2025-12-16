-- Total transaction amount per user per day
SELECT
    user_id,
    toDate(created_at) AS txn_day,
    sum(amount) AS total_amount
FROM ewallet.transactions
WHERE status = 'COMPLETED'
GROUP BY user_id, txn_day
ORDER BY txn_day DESC, total_amount DESC;

-- Total transactions per merchant
SELECT
    merchant_id,
    count(*) AS txn_count,
    sum(amount) AS total_amount
FROM ewallet.transactions
WHERE status = 'COMPLETED'
GROUP BY merchant_id
ORDER BY txn_count DESC;
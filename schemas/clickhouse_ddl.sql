CREATE TABLE ewallet.users (
    user_id UInt32,
    name String,
    email String,
    created_at DateTime
) ENGINE = MergeTree()
ORDER BY user_id;

CREATE TABLE ewallet.merchants (
    merchant_id UInt32,
    name String,
    category String,
    created_at DateTime
) ENGINE = MergeTree()
ORDER BY merchant_id;

CREATE TABLE ewallet.transactions (
    txn_id String,
    user_id UInt32,
    merchant_id UInt32,
    amount Decimal(12,2),
    status LowCardinality(String),
    created_at DateTime,
    updated_at DateTime,
    _loaded_at DateTime DEFAULT now()
) ENGINE = MergeTree()
ORDER BY (toDate(created_at), user_id)
PARTITION BY toYYYYMM(created_at);
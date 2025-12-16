CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    created_at DATETIME
);

CREATE TABLE merchants (
    merchant_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    created_at DATETIME
);

CREATE TABLE transactions (
    txn_id VARCHAR(50) PRIMARY KEY,
    user_id INT,
    merchant_id INT,
    amount DECIMAL(12,2),
    status VARCHAR(20), -- 'pending', 'completed', 'failed'
    created_at DATETIME,
    updated_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (merchant_id) REFERENCES merchants(merchant_id)
);
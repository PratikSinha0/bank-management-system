CREATE DATABASE Bank_System;
USE Bank_System;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(200) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE account(
    account_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    user_id INT,
    balance DECIMAL(10,2) DEFAULT 0,
    account_type VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_account INT,
    receiver_account INT,
    amount DECIMAL(10,2),
    transaction_type VARCHAR(50),
    status VARCHAR(20) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_account) REFERENCES account(account_id),
    FOREIGN KEY (receiver_account) REFERENCES account(account_id)
);
DROP TABLE IF EXISTS transactions;
DROP TABLE budgets;
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS tags;


CREATE TABLE tags (
id SERIAL4 PRIMARY KEY,
category_name VARCHAR(255)

);

CREATE TABLE merchants (
id SERIAL4 PRIMARY KEY,
merchant_name VARCHAR(255)

);

CREATE TABLE budgets (
id SERIAL4 PRIMARY KEY,
budget_amount INT4
);

CREATE TABLE transactions (
id SERIAL4 PRIMARY KEY,
tag_id INT4 REFERENCES tags(id) ON DELETE CASCADE,
merchant_id INT4 REFERENCES merchants(id) ON DELETE CASCADE,
transaction_amount INT4,
transaction_date TIMESTAMP

);

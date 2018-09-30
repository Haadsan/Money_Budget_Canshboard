DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS tags;


CREATE TABLE tags (
id SERIAL4 PRIMARY KEY,
category_tag VARCHAR(255)

);

CREATE TABLE merchants (
id SERIAL4 PRIMARY KEY,
merchant_name VARCHAR(255)

);


CREATE TABLE transactions (
id SERIAL4 PRIMARY KEY,
tag_id INT4 REFERENCES tags(id) ON DELETE CASCADE,
merchant_id INT4 REFERENCES merchants(id) ON DELETE CASCADE,
amount INT4,
transaction_date DATE

);

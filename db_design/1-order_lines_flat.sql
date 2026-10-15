DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT NOT NULL,
    customer_email TEXT NOT NULL UNIQUE
);

CREATE TABLE categories (
    category_id INTEGER PRIMARY KEY,
    category_name TEXT NOT NULL UNIQUE
);

CREATE TABLE products (
    product_code TEXT PRIMARY KEY,
    product_name TEXT NOT NULL,
    category_id INTEGER NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories (category_id)
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    order_date TEXT NOT NULL,
    customer_id INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

-- unit_price_paid lives here, not in products: the price of a product can
-- change later, and each order line must keep the price that was paid.
CREATE TABLE order_items (
    order_id INTEGER NOT NULL,
    product_code TEXT NOT NULL,
    unit_price_paid REAL NOT NULL CHECK (unit_price_paid >= 0),
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (order_id, product_code),
    FOREIGN KEY (order_id) REFERENCES orders (order_id),
    FOREIGN KEY (product_code) REFERENCES products (product_code)
);

INSERT INTO customers (customer_name, customer_email)
SELECT DISTINCT customer_name, customer_email
FROM order_lines_flat
ORDER BY customer_email;

INSERT INTO categories (category_name)
SELECT DISTINCT category_name
FROM order_lines_flat
ORDER BY category_name;

INSERT INTO products (product_code, product_name, category_id)
SELECT DISTINCT order_lines_flat.product_code, order_lines_flat.product_name,
    categories.category_id
FROM order_lines_flat
INNER JOIN categories
    ON categories.category_name = order_lines_flat.category_name;

INSERT INTO orders (order_id, order_date, customer_id)
SELECT DISTINCT order_lines_flat.order_id, order_lines_flat.order_date,
    customers.customer_id
FROM order_lines_flat
INNER JOIN customers
    ON customers.customer_email = order_lines_flat.customer_email;

INSERT INTO order_items (order_id, product_code, unit_price_paid, quantity)
SELECT order_id, product_code, unit_price_paid, quantity
FROM order_lines_flat;

SHOW DATABASES;
USE pizza_restaurant;
DROP TABLE IF EXISTS order_pizzas;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS pizzas;
DROP TABLE IF EXISTS customers;

CREATE DATABASE pizza_restaurant;
USE pizza_restaurant;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_datetime DATETIME NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE pizzas (
    pizza_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(5,2) NOT NULL
);

CREATE TABLE order_pizzas (
    order_id INT NOT NULL,
    pizza_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, pizza_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (pizza_id) REFERENCES pizzas(pizza_id)
);

INSERT INTO pizzas (name, price) VALUES
('Pepperoni & Cheese', 7.99),
('Vegetarian', 9.99),
('Meat Lovers', 14.99),
('Hawaiian', 12.99);

INSERT INTO customers (name, phone_number) VALUES
('Trevor Page', '226-555-4982'),
('John Doe', '555-555-9498');

INSERT INTO orders (customer_id, order_datetime) VALUES
(1, '2023-09-10 09:47:00'),
(2, '2023-09-10 13:20:00'),
(1, '2023-09-10 09:47:00'),
(2, '2023-10-10 10:37:00');

INSERT INTO Order_Pizzas (order_id, pizza_id, quantity) VALUES 
(1, 1, 1),
(1, 3, 1),
(2, 2, 1),
(2, 3, 2),
(3, 3, 1),
(3, 4, 1),
(4, 2, 3),
(4, 4, 1);

SELECT 
	c.customer_id, 
	c.name,  
	c.phone_number,
SUM(p.price * op.quantity) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Pizzas op ON o.order_id = op.order_id
JOIN Pizzas p ON op.pizza_id = p.pizza_id
GROUP BY c.customer_id, c.name, c.phone_number
ORDER BY total_spent DESC;

SELECT
    c.customer_id,
    c.name,
    c.phone_number,
DATE(o.order_datetime) AS order_date,
SUM(p.price * op.quantity) AS daily_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_pizzas op ON o.order_id = op.order_id
JOIN Pizzas p ON op.pizza_id = p.pizza_id
GROUP BY c.customer_id, c.name, c.phone_number, DATE(o.order_datetime)
ORDER BY order_date, daily_spent DESC;


































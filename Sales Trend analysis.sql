CREATE DATABASE sales_analysis;

USE sales_analysis;

CREATE TABLE online_sales (order_id INT PRIMARY KEY, order_date DATE, product_id INT, amount DECIMAL(10,2));

INSERT INTO online_sales (order_id, order_date, product_id, amount) VALUES
(1, '2022-01-15', 101, 250.00),
(2, '2022-01-20', 102, 180.00),
(3, '2022-02-05', 103, 300.00),
(4, '2022-02-18', 101, 220.00),
(5, '2022-03-10', 104, 150.00),
(6, '2022-03-22', 102, 200.00),
(7, '2022-04-01', 105, 500.00),
(8, '2022-04-15', 103, 320.00),
(9, '2022-05-05', 101, 275.00),
(10, '2022-05-25', 104, 190.00);

SELECT EXTRACT(YEAR FROM order_date) AS order_year, EXTRACT(MONTH FROM order_date) AS order_month,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(amount) AS total_revenue
FROM online_sales WHERE order_date BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY order_year, order_month;

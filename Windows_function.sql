
CREATE TABLE sales_data (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    product VARCHAR(50),
    sale_date DATE,
    quantity INT
);

INSERT INTO sales_data (product, sale_date, quantity) VALUES
('A', '2023-01-01', 10),
('A', '2023-01-02', 20),
('A', '2023-01-03', 15),
('B', '2023-01-01', 5),
('B', '2023-01-02', 8),
('B', '2023-01-03', 12);



-- 1. ROW_NUMBER
SELECT *,
       ROW_NUMBER() OVER (ORDER BY quantity DESC) AS row_num
FROM sales_data;


-- 2. RANK
SELECT *,
       RANK() OVER (ORDER BY quantity DESC) AS rank_val
FROM sales_data;


-- 3. DENSE_RANK
SELECT *,
       DENSE_RANK() OVER (ORDER BY quantity DESC) AS dense_rank_val
FROM sales_data;


-- 4. PARTITION BY for the windows function
SELECT *,
       ROW_NUMBER() OVER (PARTITION BY product ORDER BY quantity DESC) AS row_num
FROM sales_data;


-- 5. LAG for the windows function
SELECT *,
       LAG(quantity) OVER (ORDER BY sale_date) AS prev_quantity
FROM sales_data;


-- 6. LEAD for the windows function
SELECT *,
       LEAD(quantity) OVER (ORDER BY sale_date) AS next_quantity
FROM sales_data;


-- 7. FIRST_VALUE for the windows function
SELECT *,
       FIRST_VALUE(quantity) OVER (PARTITION BY product ORDER BY sale_date) AS first_sale
FROM sales_data;


-- 8. LAST_VALUE for the windows function
SELECT *,
       LAST_VALUE(quantity) OVER (
           PARTITION BY product
           ORDER BY sale_date
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS last_sale
FROM sales_data;


-- 9. NTILE  for the windows function
SELECT *,
       NTILE(3) OVER (ORDER BY quantity DESC) AS group_no
FROM sales_data;


-- 10. Running Total (SUM window) for the windows function
SELECT *,
       SUM(quantity) OVER (ORDER BY sale_date) AS running_total
FROM sales_data;


-- 11. Moving Average for the windows function
SELECT *,
       AVG(quantity) OVER (
           ORDER BY sale_date
           ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
       ) AS moving_avg
FROM sales_data;
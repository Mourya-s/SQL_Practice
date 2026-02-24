
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    salary INT,
    dept_id INT
);

INSERT INTO employees (name, salary, dept_id) VALUES
('Ram', 30000, 10),
('Sam', 35000, 20),
('Tom', 40000, 10),
('Roy', 45000, 30),
('Ravi', 50000, 20);


-- 1. Scalar Subquery (single value)
SELECT name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- 2. Subquery in SELECT
SELECT name, salary,
       (SELECT AVG(salary) FROM employees) AS avg_salary
FROM employees;

-- 3. Subquery in FROM (Derived Table)
SELECT dept_id, avg_sal
FROM (
    SELECT dept_id, AVG(salary) AS avg_sal
    FROM employees
    GROUP BY dept_id
) AS dept_avg;

-- 4. Correlated Subquery
SELECT e1.name, e1.salary
FROM employees e1
WHERE salary > (
    SELECT AVG(salary)
    FROM employees e2
    WHERE e1.dept_id = e2.dept_id
);

-- 5. EXISTS Subquery
SELECT *
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM employees
    WHERE dept_id = e.dept_id
);

-- 6. NOT EXISTS
SELECT *
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM employees
    WHERE dept_id = e.dept_id AND salary > 60000
);

-- 7. IN Subquery
SELECT *
FROM employees
WHERE dept_id IN (
    SELECT dept_id
    FROM employees
    WHERE salary > 40000
);

-- 8. NOT IN
SELECT *
FROM employees
WHERE dept_id NOT IN (
    SELECT dept_id
    FROM employees
    WHERE salary > 45000
);


-- 1. Simple CTE
WITH avg_salary AS (
    SELECT AVG(salary) AS avg_sal
    FROM employees
)
SELECT *
FROM employees
WHERE salary > (SELECT avg_sal FROM avg_salary);

-- 2. CTE with GROUP BY
WITH dept_avg AS (
    SELECT dept_id, AVG(salary) AS avg_sal
    FROM employees
    GROUP BY dept_id
)
SELECT e.name, e.salary, d.avg_sal
FROM employees e
JOIN dept_avg d
ON e.dept_id = d.dept_id;

-- 3. Multiple CTE
WITH high_salary AS (
    SELECT * FROM employees WHERE salary > 40000
),
dept_count AS (
    SELECT dept_id, COUNT(*) AS emp_count
    FROM employees
    GROUP BY dept_id
)
SELECT h.name, h.salary, d.emp_count
FROM high_salary h
JOIN dept_count d
ON h.dept_id = d.dept_id;

-- 4. Recursive CTE (example)
WITH RECURSIVE numbers AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1 FROM numbers WHERE num < 5
)
SELECT * FROM numbers;



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
('Roy', 45000, 30);



-- 1. Simple View
CREATE VIEW emp_view AS
SELECT name, salary
FROM employees;

-- Using the view
SELECT * FROM emp_view;


-- 2. View with condition
CREATE VIEW high_salary_emp AS
SELECT *
FROM employees
WHERE salary > 35000;

SELECT * FROM high_salary_emp;


-- 3. View with JOIN
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments VALUES
(10, 'IT'),
(20, 'HR'),
(30, 'Finance');

CREATE VIEW emp_dept_view AS
SELECT e.name, e.salary, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;

SELECT * FROM emp_dept_view;


-- 4. Updating data through view
UPDATE emp_view
SET salary = 32000
WHERE name = 'Ram';


-- 5. Inserting through view
INSERT INTO emp_view (name, salary)
VALUES ('Ravi', 50000);


-- 6. ALTER VIEW
ALTER VIEW emp_view AS
SELECT emp_id, name
FROM employees;


-- 7. DROP VIEW
DROP VIEW high_salary_emp;
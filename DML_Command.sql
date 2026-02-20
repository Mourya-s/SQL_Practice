--DML commnds
-- Insert single row into departments
INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'HR');

-- Insert multiple rows at once
INSERT INTO departments (dept_id, dept_name) VALUES
(2, 'Finance'),
(3, 'IT');

-- Insert into staff table
INSERT INTO staff (staff_id, staff_name, dept_id) VALUES
(101, 'Alice', 1),
(102, 'Bob', 2),
(103, 'Charlie', 3);

-- Update salary or name (example using employees table)
UPDATE employees
SET salary = 60000
WHERE emp_id = 1;

-- Update multiple rows
UPDATE staff
SET dept_id = 2
WHERE staff_name = 'Charlie';


-- Delete a single row
DELETE FROM staff
WHERE staff_id = 102;

-- Delete all rows from table
DELETE FROM staff;

-- (Use TRUNCATE if you want it faster)
TRUNCATE TABLE staff;


-- Select all columns
SELECT * FROM employees;

-- Select specific columns
SELECT emp_name, salary FROM employees;

-- Select with condition
SELECT staff_name FROM staff WHERE dept_id = 1;

-- Select with sorting
SELECT * FROM employees ORDER BY salary DESC;

-- Select limited rows (MySQL example)
SELECT * FROM employees LIMIT 5;
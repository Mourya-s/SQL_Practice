--creating the database
CREATE DATABASE company_db;

--using the same datbase
USE company_db;

--creating the table in database
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2),
    department VARCHAR(30),
    joining_date DATE
);

--creating another table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(40)
);


--creating another table
CREATE TABLE staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);


--DDL ALTER comands

INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'HR'),


ALTER TABLE employees
ADD email VARCHAR(100);


ALTER TABLE employees
MODIFY salary DECIMAL(12,2);


ALTER TABLE employees
DROP COLUMN department;


RENAME TABLE employees TO emp_details;

TRuNCATE table employee;

DROP TABLE staff;

DROP DATABASE company_db;
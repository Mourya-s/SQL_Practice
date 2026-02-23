-- creating the data base
create database salary_data;

use salary_data;
-- creating the dept table
create table dept_table(
dept_id varchar(20),
name varchar(15),
salary int
);

-- inserting the values of the data
insert dept_table
values ('1111-MATH', 'RAHUL', 10000), 
('1111-MATH', 'RAKESH', 20000), 
('2222-SCIENCE', 'AKASH', 10000), 
('222-SCIENCE', 'ANDREW', 10000), 
('22-CHEM', 'ANKIT', 25000), 
('3333-CHEM', 'SONIKA', 12000), 
('4444-BIO', 'HITESH', 2300), 
('44-BIO', 'AKSHAY', 10000) ;

-- total salary of each deparment
SELECT 
    SUBSTRING_INDEX(dept_id, '-', -1) AS dept_name,
    SUM(salary) AS total_salary
FROM dept_table
GROUP BY dept_name;

-- or update the column first 
UPDATE dept_table
SET dept_id = SUBSTRING_INDEX(dept_id, '-', -1);
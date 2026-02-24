SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;


SELECT e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

SELECT e.emp_name, d.dept_name
FROM employees e
FULL JOIN departments d
ON e.dept_id = d.dept_id;

SELECT e.emp_name, d.dept_name
FROM employees e
CROSS JOIN departments d;

SELECT e1.emp_name, e2.emp_name AS manager
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.emp_id;


SELECT e1.emp_name, e2.emp_name AS manager
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.emp_id;


select * from students;
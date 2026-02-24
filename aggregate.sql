SELECT COUNT(*) 
FROM employees;SELECT COUNT(emp_id) 
FROM employees;'

'SELECT AVG(salary) 
FROM employees;

SELECT AVG(salary) 
FROM employees2;

SELECT MAX(salary) 
FROM employees;

SELECT dept_id, SUM(salary)
FROM employees
GROUP BY dept_id;

SELECT dept_id, AVG(salary)
FROM employees3
GROUP BY dept_id;


SELECT dept_id, COUNT(emp_id)
FROM employees
GROUP BY dept_id
HAVING COUNT(emp_id) > 5;
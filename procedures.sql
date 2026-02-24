

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



DELIMITER //

CREATE PROCEDURE get_all_employees()
BEGIN
    SELECT * FROM employees;
END //

DELIMITER ;

CALL get_all_employees();


DELIMITER //

CREATE PROCEDURE get_emp_by_dept(IN dept INT)
BEGIN
    SELECT * 
    FROM employees
    WHERE dept_id = dept;
END //

DELIMITER ;

CALL get_emp_by_dept(10);


DELIMITER //

CREATE PROCEDURE update_salary(IN dept INT, IN inc_amount INT)
BEGIN
    UPDATE employees
    SET salary = salary + inc_amount
    WHERE dept_id = dept;
END //

DELIMITER ;

CALL update_salary(10, 5000);



DELIMITER //

CREATE PROCEDURE get_total_salary(OUT total INT)
BEGIN
    SELECT SUM(salary) INTO total
    FROM employees;
END //

DELIMITER ;

CALL get_total_salary(@total_salary);
SELECT @total_salary;



DELIMITER //

CREATE PROCEDURE increase_value(INOUT num INT)
BEGIN
    SET num = num + 100;
END //

DELIMITER ;

SET @value = 500;
CALL increase_value(@value);
SELECT @value;


DELIMITER //

ALTER PROCEDURE get_all_employees
BEGIN
    SELECT emp_id, name FROM employees;
END //

DELIMITER ;



DROP PROCEDURE increase_value;
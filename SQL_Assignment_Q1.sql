CREATE DATABASE ecommerse;

-- Creating tables
CREATE TABLE gold_member_users (
    userid VARCHAR(15) PRIMARY KEY,
    signup_date DATE
);

CREATE TABLE users (
    userid VARCHAR(15),
    signup_date DATE
);

CREATE TABLE sales (
    userid VARCHAR(15),
    created_date DATE,
    product_id INT
);
CREATE TABLE product (
    product_id INT,
    product_name VARCHAR(15),
    price INT
);

DROP TABLE sales;
DROP TABLE users;
DROP TABLE product;
DROP TABLE gold_member_users;

USE ecommerse;
-- Inserting the valus
INSERT INTO gold_member_users VALUES
('John','2017-09-22'),
('Mary','2017-04-21');

INSERT INTO users VALUES
('John','2014-09-02'),
('Michel','2015-01-15'),
('Mary','2014-04-11');

INSERT INTO sales VALUES
('John','2017-04-19',2),
('Mary','2019-12-18',1),
('Michel','2020-07-20',3),
('John','2019-10-23',2),
('John','2018-03-19',3),
('Mary','2016-12-20',2),
('John','2016-11-09',1),
('John','2016-05-20',3),
('Michel','2017-09-24',1),
('John','2017-03-11',2),
('John','2016-03-11',1),
('Mary','2016-11-10',1),
('Mary','2017-12-07',2);


INSERT INTO product VALUES
(1,'Mobile',980),
(2,'Ipad',870),
(3,'Laptop',330);

SHOW DATABASES ;
SHOW TABLES;

-- counting all rows 

SELECT 'gold_member_users' , COUNT(*)
FROM gold_member_users
UNION ALL
SELECT 'users', COUNT(*) 
FROM users
UNION ALL
SELECT 'sales', COUNT(*) 
FROM sales
UNION ALL
SELECT 'product', COUNT(*) 
FROM product;

SELECT 
    (SELECT COUNT(*) FROM gold_member_users) +
    (SELECT COUNT(*) FROM product) +
    (SELECT COUNT(*) FROM sales) +
    (SELECT COUNT(*) FROM users) AS total_rows
    ;
    
-- What is the total amount each customer spent on ecommerce company 
SELECT s.userid, SUM(p.price) AS total_spent
FROM sales s
JOIN product p
ON s.product_id = p.product_id
GROUP BY s.userid;

-- 7.Find the distinct dates of each customer visited the website:  
--   output should have 2 columns date and customer name 
SELECT DISTINCT created_date, userid
FROM sales;


-- Find the first product purchased by each customer using 3 tables(users, sales, product) 
SELECT userid, product_name, created_date
FROM (
    SELECT s.userid,
           p.product_name,
           s.created_date,
           RANK() OVER (PARTITION BY s.userid ORDER BY s.created_date) AS rnk
    FROM sales s
    JOIN product p
    ON s.product_id = p.product_id
) temp
WHERE rnk = 1;

-- 9.What is the most purchased item of each customer and how many times the customer
-- has purchased it: output should have 2 columns count of the items as item_count and customer name
SELECT userid, item_count,product_id
FROM (
    SELECT userid,
           product_id,
           COUNT(*) AS item_count,
           RANK() OVER (PARTITION BY userid ORDER BY COUNT(*) DESC) AS rnk  -- usr ROW_NUMBER() if no duplicates wanted
    FROM sales
    GROUP BY userid, product_id
) temp
WHERE rnk = 1;

-- .Find out the customer who is not the gold_member_user
SELECT u.userid as not_in_gold
FROM users u
LEFT JOIN gold_member_users g
ON u.userid = g.userid
WHERE g.userid IS NULL;

-- What is the amount spent by each customer when he was the gold_member order by  user
SELECT g.userid, 
       SUM(p.price) AS total_exp
FROM gold_member_users g
JOIN sales s
ON g.userid = s.userid
AND s.created_date >= g.signup_date
JOIN product p
ON p.product_id = s.product_id
GROUP BY g.userid
ORDER BY g.userid;

-- starting from "m"
SELECT userid
FROM users
WHERE userid LIKE 'M%';


-- Find the Distinct customer Id of each customer
select distinct userid
from sales;

-- Change the Column name from product table as price_value from price 
ALTER TABLE product 
rename column price to price_value;
select * from product;

-- Change the Column value product_name – Ipad to Iphone from product table 
SET SQL_SAFE_UPDATES = 0;
update product
set product_name="iphone"
where product_name="Ipad";
select * from product;

-- Change the table name of gold_member_users to gold_membership_users 
RENAME TABLE gold_member_users to gold_membership_users;
show tables;

-- 17.Create a new column  as Status in the table crate above gold_membership_users  the Status 
-- values should be 2 Yes and No if the user is gold member, then status should be Yes else No. 
alter table users
add column status varchar(15);
UPDATE users u
LEFT JOIN gold_membership_users g
ON u.userid = g.userid
SET u.status = 
CASE                -- like if else conditon
    WHEN g.userid IS NOT NULL THEN 'Yes'
    ELSE 'No'
END;
-- or go with --> set status as NO and then use where to set yes by joining


-- Delete the users_ids 1,2 from users table and roll the back changes once both the
--  rows are deleted one by one mention the result when performed roll back
-- BUT MY USER DONT  HAVE USER ID IN INT ONLY
START TRANSACTION;
DELETE FROM users
WHERE user_id=1;
DELETE FROM users
WHERE user_id=2;
ROLLBACK;

-- .Insert one more record as same (3,'Laptop',330) as product table 
Insert product
values
(3,'Laptop',330);
select * from product;

-- Write a query to find the duplicates in product table
select *
from product p
join product l
on p.product_name=l.product_name
and p.product_id>l.product_id;
-- or go with this 


--
select sell_date,count(sell_date) as num_sold
from sales
group by sell_date
having count(*)>1;

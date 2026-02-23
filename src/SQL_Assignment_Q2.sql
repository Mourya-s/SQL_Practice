-- CREATING THE DATABASE
CREATE DATABASE sales_date_product;

use sales_date_product;
-- CREATING THE TABLE
CREATE TABLE sales_data(
sell_date date,
product varchar(15)
);

-- inserting the values
insert sales_data
values('2020-05-30', 'Headphones'), 
('2020-06-01','Pencil'), 
('2020-06-02','Mask'), 
('2020-05-30','Basketball'), 
('2020-06-01','Book'), 
('2020-06-02', ' Mask '), 
('2020-05-30','T-Shirt') ;
select * from sales_data;

-- 
select sell_date,
	count(*) as salled_items,
	 GROUP_CONCAT(product) AS product_list
from sales_data 
group by sell_date;


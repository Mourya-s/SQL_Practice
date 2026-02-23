use salary_data;
-- create a table named sales_data with columns: productid, sale_date, and  quantity_sold. 
create table saleies_data(
productid int,
sale_date date,
quantity_sold int
);

insert saleies_data
values (1, '2022-01-01', 20), 
   		(2, '2022-01-01', 15),
   		(1, '2022-01-02', 10), 
    		(2, '2022-01-02', 25), 
    		(1, '2022-01-03', 30), 
    		(2, '2022-01-03', 18), 
    		(1, '2022-01-04', 12), 
    	(2, '2022-01-04', 22) ;
        
select * from saleies_data;

-- Assign rank by partition based on product_id and find the latest product_id sold 
-- fro each date
select productid, sale_date
from (
select *,
	rank() over(partition by productid order by sale_date DESC) as rnk
    from saleies_data
) temp
where rnk =1;
-- for over all
SELECT productid,sale_date
FROM saleies_data
ORDER BY sale_date DESC
LIMIT 1;
        
-- Retrieve the quantity_sold value from a previous row and compare the quantity_sold. 
SELECT *,
       LAG(quantity_sold) OVER (partition by productid ORDER BY sale_date) AS prev_sales,
       quantity_sold - LAG(quantity_sold) OVER(partition by productid ORDER BY sale_date) AS diffen_sales
FROM saleies_data;

-- Partition based on product_id and return the first and last values in ordered set. 
select *,
	first_value(productid) over(partition by productid order by sale_date DESC) as first_sale,
    
	last_value(productid) over(partition by productid order by sale_date DESC 
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as first_sale
from saleies_data;
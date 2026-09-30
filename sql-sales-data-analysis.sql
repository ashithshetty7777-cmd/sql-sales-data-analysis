USE data_analyst_practice;

DROP TABLE IF EXISTS sales_project;

CREATE TABLE sales_project (
    order_id INT PRIMARY KEY,
    order_date DATE,
    employee_name VARCHAR(50),
    department VARCHAR(30),
    product VARCHAR(50),
    region VARCHAR(30),
    quantity INT,
    unit_price INT
);

INSERT INTO sales_project VALUES
(1001, '2026-01-05', 'Amit', 'IT', 'Laptop', 'West', 2, 55000),
(1002, '2026-01-08', 'Priya', 'HR', 'Keyboard', 'North', 5, 1500),
(1003, '2026-01-12', 'Rahul', 'Sales', 'Monitor', 'East', 3, 12000),
(1004, '2026-01-15', 'Sneha', 'Finance', 'Laptop', 'West', 1, 55000),
(1005, '2026-01-18', 'Rohit', 'Sales', 'Mouse', 'South', 10, 800),
(1006, '2026-01-22', 'Amit', 'IT', 'Monitor', 'North', 2, 12000),
(1007, '2026-02-02', 'Priya', 'HR', 'Laptop', 'East', 1, 55000),
(1008, '2026-02-07', 'Rahul', 'Sales', 'Keyboard', 'West', 8, 1500),
(1009, '2026-02-11', 'Sneha', 'Finance', 'Monitor', 'South', 4, 12000),
(1010, '2026-02-15', 'Rohit', 'Sales', 'Laptop', 'North', 2, 55000),
(1011, '2026-02-20', 'Amit', 'IT', 'Mouse', 'East', 15, 800),
(1012, '2026-02-25', 'Rahul', 'Sales', 'Laptop', 'West', 3, 55000),
(1013, '2026-03-03', 'Priya', 'HR', 'Monitor', 'South', 2, 12000),
(1014, '2026-03-08', 'Sneha', 'Finance', 'Keyboard', 'North', 6, 1500),
(1015, '2026-03-12', 'Rohit', 'Sales', 'Monitor', 'East', 5, 12000);

SELECT * FROM sales_project;
SELECT
    order_id,
    employee_name,
    product,
    quantity,
    unit_price,
    quantity * unit_price AS sales_amount
FROM sales_project;
select sum(quantity * unit_price) as total_sale
from Sales_project;
select employee_name,
sum(quantity*unit_price) as total_sale
from Sales_project
group by employee_name
order by total_sale desc;
select product,
sum(quantity*unit_price) as total_sales
from Sales_project
group by product
order by total_sales desc;
select region,
sum(quantity*unit_price) as total_sales
from Sales_project
group by region
order by total_sales desc;
SELECT
    department,
    SUM(quantity * unit_price) AS total_sales
FROM sales_project
GROUP BY department
ORDER BY total_sales DESC;
select 
employee_name,
sum(quantity * unit_price) as total_sales
from sales_project
group by employee_name
having sum(quantity*unit_price) >100000
order by total_sales desc;
SELECT
    AVG(quantity * unit_price) AS average_order_value
FROM sales_project;
SELECT
    order_id,
    employee_name,
    product,
    quantity,
    unit_price,
    quantity * unit_price AS sales_amount
FROM sales_project
ORDER BY sales_amount DESC
LIMIT 1;
SELECT
    product,
    SUM(quantity) AS total_quantity
FROM sales_project
GROUP BY product
ORDER BY total_quantity DESC;
SELECT
    employee_name,
    product,
    SUM(quantity * unit_price) AS total_sales
FROM sales_project
GROUP BY employee_name, product
ORDER BY total_sales DESC;
select
order_id ,
employee_name,
quantity * unit_price AS sales_amount,
case
when quantity*unit_price >= 50000 then 'High'
when quantity*unit_price >= 20000 then 'Medium'
else 'Low'
end as sales_category
from sales_project;
SELECT
    CASE
        WHEN quantity * unit_price >= 50000 THEN 'High'
        WHEN quantity * unit_price >= 20000 THEN 'Medium'
        ELSE 'Low'
    END AS sales_category,
    count(*) total_orders
    from sales_project
    group by sales_category
    ORDER BY total_orders DESC;
    select employee_name,
    SUM(quantity * unit_price) AS total_sales
    from sales_project
    group by employee_name
    order by total_sales desc
    limit 1;
    SELECT
    product,
    SUM(quantity * unit_price) AS total_sales
FROM sales_project
GROUP BY product
ORDER BY total_sales DESC
LIMIT 1;
SELECT
    employee_name,
    SUM(quantity * unit_price) AS total_sales
FROM sales_project
GROUP BY employee_name
HAVING SUM(quantity * unit_price) > (
    SELECT AVG(employee_sales)
    FROM (
        SELECT SUM(quantity * unit_price) AS employee_sales
        FROM sales_project
        GROUP BY employee_name
    ) AS sales_summary
)
ORDER BY total_sales DESC;
    SELECT
    region,
    SUM(quantity * unit_price) AS total_sales
FROM sales_project
GROUP BY region
HAVING SUM(quantity * unit_price) > 100000
ORDER BY total_sales DESC;
SELECT
    COUNT(*) AS total_orders,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales,
    AVG(quantity * unit_price) AS average_order_value
FROM sales_project;


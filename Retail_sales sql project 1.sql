create database sql_project_p1;
use sql_project_p1;

create table retail_sales
(transactions_id int primary key,
sale_date date,
sale_time time ,
customer_id int,
gender varchar(15),
age int,
category varchar(15),
quantiy int,
price_per_unit float,
cogs float,
total_sale float);

select * from retail_sales;

SELECT COUNT(*) 
FROM retail_sales;

select * from retail_sales
where transactions_id is null;

select * from retail_sales
where sale_date is null;

select * from retail_sales
where sale_time is null;

select * from retail_sales
where transactions_id is null
or
sale_date is null
or
sale_time is null
or 
gender is null
or 
category is null
or 
quantiy is null
or
cogs is null
or 
total_sale is null;

-- Data Exploration

-- How many sales we have ?
select count(*) as total_sale from retail_sales;

-- How many customers we have ?
select count(distinct customer_id) as total_sale from retail_sales;

select distinct  category from retail_sales;

-- Data Analysis & Business Key Problem & Answers

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select *
from retail_sales
where sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the  quantity sold is more then 10 in the month of Nov-2022

SELECT
    category,
    SUM(quantiy) AS total_quantity
FROM retail_sales
WHERE category = 'Clothing'
  AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
  AND quantiy >= 4
;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category
SELECT 
    category,
    SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY category;
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category
select 
category,
avg(age) as average_age
from retail_sales
where category = 'Beauty';


-- Q.5 Write a SQL query to find all transactions where the total_sale is grater than 1000
SELECT *
FROM retail_sales
WHERE total_sale > 1000;

-- Q.6  Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category
SELECT gender,category,
COUNT(transactions_id) AS total_transactions
FROM retail_sales
GROUP BY gender, category
order by 1;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year 
WITH monthly_sales AS (
SELECT 
YEAR(sale_date) AS year,
MONTH(sale_date) AS month,
AVG(total_sale) AS average_sale
FROM retail_sales
GROUP BY YEAR(sale_date), MONTH(sale_date)
),
ranked AS (
SELECT *,
RANK() OVER (
PARTITION BY year 
ORDER BY average_sale DESC) AS rnk
FROM monthly_sales)
SELECT year,month,average_sale
FROM ranked
WHERE rnk = 1
ORDER BY year;
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales
SELECT customer_id,
SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category 
SELECT category,
COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;
-- Q.10 Write a SQL query to create each shift and number of orders(Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

SELECT
    CASE
        WHEN HOUR(sale_time) <= 12 THEN 'Morning'
        WHEN HOUR(sale_time) > 12 AND HOUR(sale_time) <= 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(transactions_id) AS number_of_orders
FROM retail_sales
GROUP BY shift;

-- End of Project

create database companyy;
use companyy;
CREATE TABLE keshavberiwal (
    sale_id INT PRIMARY KEY,
    product VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    price INT,
    region VARCHAR(50),
    salesperson VARCHAR(50),
    sale_date DATE
);

INSERT INTO sales (sale_id, product, category, quantity, price, region, salesperson, sale_date) VALUES
(1, 'Laptop', 'Electronics', 5, 50000, 'East', 'John', '05-01-2024'),
(2, 'Mobile', 'Electronics', 10, 20000, 'West', 'Mary', '10-01-2024'),
(3, 'Chair', 'Furniture', 20, 1500, 'East', 'John', '15-02-2024'),
(4, 'Table', 'Furniture', 8, 5000, 'North', 'Steve','18-02-2024'),
(5, 'Laptop', 'Electronics', 7, 55000, 'South', 'Mary', '01-03-2024'),
(6, 'Mobile', 'Electronics', 15, 18000, 'East', 'John', '05-03-2024'),
(7, 'Sofa', 'Furniture', 3, 25000, 'West', 'Steve','20-03-2024'),
(8, 'Laptop', 'Electronics', 2, 52000, 'North', 'Mary','02-04-2024'),
(9, 'Chair', 'Furniture', 30, 1200, 'South', 'John', '12-04-2024'),
(10, 'Mobile', 'Electronics', 12, 22000, 'West', 'Steve', '15-04-2024');

select * from keshavberiwal;

# 1. Find total sales amount for each region.
select region, sum(quantity*price)
from keshavberiwal
group by region;

# 2. Find total quantity sold by each salesperson.
select salesperson, sum(quantity)
from keshavberiwal
group by salesperson;

# 3. Show categories where total quantity sold is more than 30.
select category, sum(quantity)
from keshavberiwal
group by category
having sum(quantity)>30;

# 4. Find total revenue by each category.
select category, sum(quantity*price)
from keshavberiwal
group by category;

# 5. Find salesperson who sold total quantity more than 20.
select salesperson, sum(quantity)
from keshavberiwal
group by salesperson
having sum(quantity)>20;

# 4. Find total revenue by each category.
select category, sum(quantity*price)
from keshavberiwal
group by category;

# 5. Find salesperson who sold total quantity more than 20.
select salesperson, sum(quantity)
from keshavberiwal
group by salesperson
having sum(quantity)>20;

# 6.  Find region-wise average sale price
select region, avg(price)
from keshavberiwal
group by region;

# 7. Find total revenue for each salesperson and show only those having revenue above >300000.
select salesperson, sum(quantity*price)
from keshavberiwal
group by salesperson
having sum(quantity*price)>300000;

# 8. Find how many products each category has.
select category, count(product)
from keshavberiwal
group by category;

# 9. Find total sales per month.
select "sale date", sum(price*quantity)
from keshavberiwal
group by "sale date";

# 10. Find each region's maximum sale price.
select region, max(price)
from keshavberiwal
group by region;

# 11. Find each category's average quantity sold, but show only where avg > 10
select category, avg(quantity)
from keshavberiwal
group by category
having avg(quantity)>10;

# 12. Find total revenue by region and category.
select region, category, sum(price*quantity)
from keshavberiwal
group by region, category;

# 13. Find how many sales each salesperson made in each region.
select salesperson, region, sum(price*quantity)
from keshavberiwal
group by salesperson, region;

-- 14. Regions where total quantity sold > 20
SELECT reqion
FROM  keshavberiwal
GROUP BY reqion
HAVING SUM(quantity) > 20;

-- 15. Salespersons who sold in more than one region
SELECT salesperson
FROM keshavberiwal
GROUP BY salesperson
HAVING COUNT(DISTINCT reqion) > 1;

-- 16. Categories with revenue between 200000 and 1000000
SELECT category, SUM(quantity * price) AS revenue
FROM  keshavberiwal
GROUP BY category
HAVING revenue BETWEEN 20000 AND 50000;

-- 17. Top 1 category with highest sales
SELECT category, SUM(quantity * price) AS revenue
FROM keshavberiwal
GROUP BY category
ORDER BY revenue DESC
LIMIT 1;

-- 18. Average sale value per transaction by salesperson
SELECT salesperson, AVG(quantity * price)
FROM keshavberiwal
GROUP BY salesperson;

-- 19. Category with minimum average price greater than 20000
SELECT category, MIN(price)
FROM keshavberiwal
GROUP BY category
HAVING AVG(price) > 20000;

-- 20. Region and salesperson combinations with revenue > 200000
SELECT reqion, salesperson, SUM(quantity * price) AS revenue
FROM keshavberiwal
GROUP BY reqion, salesperson
HAVING revenue > 200000;

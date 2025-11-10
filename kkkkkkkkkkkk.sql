use companyy;
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
from keshavbeiwal
group by salesperson, region;

-- 14. Regions where total quantity sold > 20
SELECT reqion
FROM ql_practics
GROUP BY reqion
HAVING SUM(quantity) > 20;

-- 15. Salespersons who sold in more than one region
SELECT salesperson
FROM ql_practics
GROUP BY salesperson
HAVING COUNT(DISTINCT reqion) > 1;

-- 16. Categories with revenue between 200000 and 1000000
SELECT category, SUM(quantity * price) AS revenue
FROM ql_practics
GROUP BY category
HAVING revenue BETWEEN 20000 AND 50000;

-- 17. Top 1 category with highest sales
SELECT category, SUM(quantity * price) AS revenue
FROM ql_practics
GROUP BY category
ORDER BY revenue DESC
LIMIT 1;

-- 18. Average sale value per transaction by salesperson
SELECT salesperson, AVG(quantity * price)
FROM ql_practics
GROUP BY salesperson;

-- 19. Category with minimum average price greater than 20000
SELECT category, MIN(price)
FROM ql_practics
GROUP BY category
HAVING AVG(price) > 20000;

-- 20. Region and salesperson combinations with revenue > 200000
SELECT reqion, salesperson, SUM(quantity * price) AS revenue
FROM ql_practics
GROUP BY reqion, salesperson
HAVING revenue > 200000;
create database Sa;

use Sa;

create table emp(
Emp_id int,
Name varchar(10),
Department varchar(10),
Sales_Amount int,
Sale_Date int);

insert into emp values
(1,"Alice","A",1000,2024-01-01),
(2,"Bob","B",1500,2024-01-02),
(3,"Alice","A",2000,2024-01-03),
(4,"Bob","B",1800,2024-01-04),
(5,"Alice","A",1200,2024-01-05),
(6,"Bob","B",1600,2024-01-06);

select * from emp;

#Q:1 Total sales per employee (Running Total).
select Emp_id,Name,Department,Sales_Amount,Sale_Date,
sum(Sales_Amount)over(partition by Name order by Sale_Date) as Runing_Total from emp;

#Q:2 Row number per employee.
select Emp_id,Name,Department,Sales_Amount,Sale_Date,
row_number()over(partition by Name order by Sale_date) as Row_Num from emp;

#Q:3 Rank of sales per department.
select Emp_id,Name,Department,Sales_Amount,Sale_Date,
rank()over(partition by Department order by Sales_Amount DESC) as sales_rank from emp;

#Q:4 Lead (next sale) per employee.
select Emp_id,Name,Department,Sales_Amount,Sale_Date,
lead(Sales_Amount)over(partition by Name order by Sale_Date) as next_sale from emp;

#Q:5 Lag (previous sale) per employee.
select Emp_id,Name,Department,Sales_Amount,Sale_Date,
lag(Sales_Amount)over(partition by Name order by Sale_Date) as previous_sale from emp;

#Q:6 Average sales per employee.
select Emp_id,Name,Department,Sales_Amount,sale_Date,
avg(Sales_Amount)over(partition by Name) as avg_sale from emp;

#Q:7 First and last sales per employee.
select Emp_id,Name,Department,Sales_amount,Sale_Date,
first_value(Sales_Amount)over(partition by Name order by Sale_Date) as first_sale,
last_value(Sales_Amount)over(partition by Name order by Sale_Date) as last_sale from emp;

#Q:8 Dense rank (no gaps).
select Emp_id,Name,Department,Sales_Amount,Sale_date,
dense_rank()over(partition by Department order by Sales_Amount DESC) as Dense_Ranks from emp;

#Q:9 Cumulative average per employee.
select Emp_id,Name,Department,Sales_Amount,Sale_Date,
avg(Sales_Amount)over(partition by Name order by Sale_Date) as cumulative_avg from emp;

#Q:10 Find highest sale per employee.
select Emp_id,Name,Department,Sales_Amount,Sale_Date,
max(Sales_Amount)over(partition by Name) as highest_sale from emp;

#Q:11 Sales difference from previous record.
select Emp_id,Name,Department,Sales_Amount,Sale_Date,
Sales_Amount-lag(Sales_Amount)over(partition by Name order by Sale_Date) as difference from emp;

#Q:12 Cumulative count of sales per employee.
select Emp_id,Name,Department,Sales_Amount,Sale_Date,
count(*)over(partition by Name order by Sale_Date) as Running_count from emp;

#Q:13 Show if sale is above average per employee.
select Emp_id,Name,Department,Sales_Amount,Sale_Date,
avg(Sales_AMount)over(partition by Name) as avg_sale,
case 
when Sales_Amount>avg(Sales_Amount)over(partition by Name)
then "Above avg"
else "Below avg" end as status from emp;

#Q:14 Find second highest sale per employee.

select Name,Sales_Amount FROM
(select Name,Sales_Amount,DENSE_RANK() OVER(PARTITION BY Name ORDER BY Sales_Amount DESC)
AS rnk FROM emp)x WHERE rnk = 2;
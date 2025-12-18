create database microsoft;

use microsoft;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary INT,
    age INT);

INSERT INTO employee (emp_id, emp_name, dept_id, salary, age) VALUES
(1, 'John', 101, 50000, 28),
(2, 'Emma', 101, 65000, 32),
(3, 'Raj', 102, 45000, 26),
(4, 'Meera', 103, 70000, 38),
(5, 'Ravi', 102, 48000, 30),
(6, 'Naina', 103, 52000, 29),
(7, 'Alex', 101, 58000, 31);

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50));

INSERT INTO department (dept_id, dept_name) VALUES
(101, 'Sales'),
(102, 'Marketing'),
(103, 'Finance');

/* Q1. show employee whose salary is above avg_salary.*/
select emp_name, salary, dept_name
from employee e
join department d on e.dept_id=d.dept_id
where salary>(select avg(salary) from employee);

/* Q2. find employee eho work in sales department.*/
select emp_name 
from employee 
where dept_id=(select dept_id 
from department 
where dept_name="Sales");

/* Q3. find the highest paid employee.*/
select emp_name
from employee
where salary=(select max(salary) from employee);

/* Q4. find employee older than the yongest employee */
select emp_name
from employee
where age!=(select min(age) from employee);

/* Q5. list employee who earn more than john.*/
select emp_name
from employee
where salary > (select salary from employee where emp_name="john");

/* Q6. find the employee in department where avg salary is above 50000.*/
select emp_name
from employee
where dept_id in
 (select dept_id from employee
group by dept_id having avg(salary)>50000) ;

/* Q7. find employees whose salary is second highest.*/
select emp_name
from employee
where salary<(select max(salary) from employee)
order by salary desc limit 1;

select emp_name from employee
where salary=(select max(salary) from employee
where salary<(select max(salary) from employee ));

/* Q8. find employees in same dept as emma.*/
select emp_name
from employee
where dept_id=(select dept_id from employee where emp_name="Emma");

/* Q9. list department that have more than 2 employees.*/
select dept_name from department where dept_id=
(select dept_id from employee group by dept_id having count(dept_id)>2);

/* Q10. find the employees who earn more than employees in marketing.*/
select emp_name from employee where salary>
(select max(salary) from employee where dept_id=
(select dept_id from department where dept_name="Marketing"));

/* Q11. find the employee who earn the min salary in their department.*/
select emp_name,salary ,dept_id
from employee
where salary in (select min(Salary) from employee 
group by dept_id);

select emp_name, dept_id, salary
from employee e
where salary= (select min(salary) from employee
where dept_id=e.dept_id);

/* Q12. find the employee whose salary is above department average.*/
select emp_name, salary, dept_id
from employee e
where salary> (select avg(salary) from employee 
where dept_id=e.dept_id);

/*Q13. list the employee who are younger than emma.*/
select emp_name, age
from employee
where age<(select age from employee where emp_name="Emma");

/*14. Find employees who do NOT work in any department present in the DEPARTMENT table.*/
select emp_name from employee where dept_id not in  (select dept_id
from employee );

/* 15. Find the top 2 highest salaries using a subquery.*/

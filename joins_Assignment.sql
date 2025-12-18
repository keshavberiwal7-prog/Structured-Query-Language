create database joints;

use joints;

CREATE TABLE Employee (
    emp_id   INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id  INT,
    salary   INT
);

INSERT INTO Employee (emp_id, emp_name, dept_id, salary) VALUES
(1, 'John', 101, 50000),
(2, 'Emma', 101, 65000),
(3, 'Raj', 102, 45000),
(4, 'Meera', 103, 70000),
(5, 'Ravi', 102, 48000),
(6, 'Naina', 103, 52000),
(7, 'Alex', 101, 58000);

CREATE TABLE Department (
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO Department (dept_id, dept_name) VALUES
(101, 'Sales'),
(102, 'Marketing'),
(103, 'Finance'),
(104, 'HR');

/* 1. Display employee name with their department name.*/
select e.emp_name, d.dept_name
from Employee e
inner join Department d
on e.dept_id=d.dept_id;

/* 2. List all employees including those with no matching department.*/
select e.emp_name , d.dept_name
from Employee e
left join Department d
on e.dept_id=d.dept_id;

/* 3. List all departments even if no employees.*/
select d.dept_name, e.emp_name
from Department d
left join Employee e
on d.dept_id=e.dept_id;

/* 4. Show employees from Sales department. */
select e.emp_name , d.dept_name
from employee e
inner join department d
on e.dept_id=d.dept_id
where dept_name='sales';

/* 5. Find top 3 highest paid employees.*/
select emp_name , salary
from employee 
order by salary desc limit 3;

/* 6. Find employee11`s earning more than 50,000 from Marketing.*/
select e.emp_name , e.salary, d.dept_name
from employee e 
inner join department d 
on e.dept_id=d.dept_id
 group by e.emp_name , e.salary , d.dept_name
 having salary > 50000 and dept_name="marketing" ;

/* 7. Count employees in each department.*/
select d.dept_name , count(e.emp_id)
from employee e 
join department d 
on e.dept_id=d.dept_id
group by d.dept_name;

/* 8. Show departments having more than 2 employees.*/
select d.dept_name , count(emp_id)
from department d 
left join employee e 
on e.dept_id=d.dept_id
group by d.dept_name  having count(emp_id)> 2;

/*9. Show highest salary in each department.*/
select d.dept_name, max(e.salary)
from employee e
inner join department d
on e.dept_id=d.dept_id
group by dept_name;

/* 10. Show employees whose salary is above department average.*/
SELECT e.emp_name,
       d.dept_name,
       e.salary
FROM employee e
INNER JOIN department d ON e.dept_id = d.dept_id
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employee e
    WHERE dept_id = e.dept_id)
ORDER BY e.salary;

/* 11. Show employees and their departments sorted by department name.*/
select e.emp_name ,d.dept_name
from employee e 
join department d 
ON e.dept_id = d.dept_id
order by d.dept_name asc;

/* 12. List the 2 lowest-paid employees with department names.*/
select e.emp_name ,d.dept_name , e.salary
from employee e 
join department d 
ON e.dept_id = d.dept_id
order by e.salary asc limit 2;

/* 13. Show total salary expenditure per department.*/
select  d.dept_name, sum( e.salary) 
from employee e 
join department d 
ON e.dept_id = d.dept_id
group by  d.dept_name ;

/* 14. Show departments where total salary spent is more than 150,000.*/
select  d.dept_name, sum( e.salary) 
from employee e 
join department d 
ON e.dept_id = d.dept_id
group by  d.dept_name  having sum(e.salary) > 150000;

/* 15. Show employees who belong to departments starting with 'S'.*/
select e.emp_name , d.dept_name
from employee e 
join department d 
ON e.dept_id = d.dept_id
where d.dept_name like 's%';

/* 16. Find employees whose salary is the highest in their department.*/
SELECT e.emp_name, d.dept_name, e.salary
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
WHERE e.salary = (
    SELECT MAX(salary)
    FROM employee
    WHERE dept_id = e.dept_id);

/* 17. Show employees and department sorted by salary descending.*/
SELECT e.emp_name,
       d.dept_name,
       e.salary
FROM employee e
JOIN department d 
  ON e.dept_id = d.dept_id
ORDER BY e.salary DESC;
/* 18. Count how many employees earn above 50,000 per department.*/
SELECT d.dept_name,
       COUNT(e.emp_id) AS emp_count
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
WHERE e.salary > 50000
GROUP BY d.dept_name;

/*19. Show employee name, department, and salary for employees between 45,000 and 60,000.*/
select e.emp_name,e.salary,d.dept_name
from employee e
left join department d on e.dept_id=d.dept_id
where e.salary between 45000 and 60000;

/*20. Find departments with no employees.*/
SELECT  d.dept_name
FROM Department d
LEFT JOIN Employee e
       ON d.dept_id = e.dept_id
GROUP BY  d.dept_name
HAVING COUNT(e.emp_id) = 0;

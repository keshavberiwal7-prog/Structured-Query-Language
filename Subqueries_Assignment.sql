create database microsoft ;
use microsoft;
CREATE TABLE employees (
    emp_id     INT PRIMARY KEY,
    emp_name   VARCHAR(50),
    department VARCHAR(20),
    salary     INT,
    manager_id INT
);

INSERT INTO employees (emp_id, emp_name, department, salary, manager_id) VALUES
(1,  'Arjun',  'HR', 40000,  NULL),
(2,  'Neha',   'IT', 65000,  5),
(3,  'Rohan',  'IT', 55000,  5),
(4,  'Meera',  'Finance', 70000,  NULL),
(5,  'Suresh', 'IT', 90000,  4),
(6,  'Alia',   'HR', 45000,  1),
(7,  'Karan',  'Finance', 75000,  4),
(8,  'Rahul',  'Marketing', 30000,  NULL),
(9,  'Priya',  'Marketing', 35000,  8),
(10, 'Varun',  'IT', 50000,  5);

/* Q1.List employees earning more than the average salary.*/
select emp_name ,salary
from employees
where salary>(select avg(salary) from employees);

/*Q2. Find employees who earn the maximum salary.*/
select emp_name , salary
from employees
where salary=(select max(salary) from employees);

/* Q3. Find employees working in the same department as ‘Neha’.*/
select emp_name , department from employees where department=
(select department from employees where emp_name="Neha");

/* Q4. List employees whose salary is higher than Suresh’s salary.*/
select emp_name from employees where salary>
(select salary from employees where emp_name="Suresh");

/* Q5. Show departments where the minimum salary is less than 40,000.*/
select department from employees where salary<40000;

/* Q6. Find employees who do not have a manager.*/
SELECT emp_id, department
FROM employees e
WHERE e.manager_id = ("NULL");

/* Q7. Find employees who report to the same manager as Rohan.*/
select emp_name from employees where manager_id=
(select manager_id from employees where emp_name="Rohan");

/* Q8. List employees in IT with salary above the IT average.*/
select emp_name, salary from employees where department="IT" and salary>
(select avg(salary) from employees where department="IT");

/* Q9. Show employees whose salary is in the bottom 3.*/
select emp_name
from employees
where salary>=(select min(salary) from employees)
order by salary  limit 3;

/* Q10. Show employees whose salary is within the top 3.*/
select emp_name
from employees
where salary<=(select max(salary) from employees)
order by salary desc limit 3;

/* Q11. Find employees earning more than HR department average salary.*/
select emp_name, salary from employees where  salary>
(select avg(salary) from employees where department="HR");

/* Q12. List employees having the same salary as Priya.*/
select emp_name, salary from employees where  salary=
(select salary from employees where emp_name="Priya");

/* Q13. Count employees who earn below overall average.*/
select emp_name, salary from employees where  salary<
(select avg(salary) from employees );

/* Q14. Show employees whose manager earns more than 70,000.*/
select emp_name, manager_id from employees
where manager_id in (select emp_id from employees
where salary > 70000);

/* Q15. Display employees in departments where more than 2 employees work.*/
select department, count(emp_id) from employees group by department having count(emp_id)>2 ;

/* Q16. Show departments where the average salary is above company average.*/
select department, avg(salary) from employees group by department having avg(salary)>
(select avg(salary) from employees );

/* Q17. Find the 2nd highest salary.*/
select emp_name
from employees
where salary<(select max(salary) from employees)
order by salary desc limit 1;

/* Q18. Employees with salary greater than the average salary of their manager’s team.*/
select emp_name, salary from employees
where salary > (select avg(salary) from employees
where emp_id in (select manager_id from employees
where manager_id is not null));

/* Q19. Show employees who work in a department where Suresh works.*/
select emp_name , department from employees where department=
(select department from employees where emp_name="Suresh");

/* Q20. List employees whose manager earns the maximum salary.*/
select emp_name from employees
where manager_id = (select emp_id from employees
where salary = (select max(salary) from employees
where emp_id in (select manager_id from employees
where manager_id is not null)));

/* Q21. Show employees whose salaries appear more than once.*/
select emp_name, salary from employees 
where salary in (select salary from employees
group by salary
having count(*) > 1);

/* Q22. List employees earning less than the minimum IT salary.*/
select emp_name , salary from employees where salary<
(select min(salary) from employees where department="IT");

/* Q23. Show employees with salary higher than Finance average salary.*/
select emp_name, salary from employees where  salary<
(select avg(salary) from employees where department="Finance" );

/* Q24. Find employees earning exactly the 3rd highest salary.*/
select emp_name, salary from employees
where salary=(select max(salary) from employees 
where salary<(select max(salary) from employees
where salary<(select max(salary) from employees )));

/* Q25. List employees having salary in the same salary group as Meera’s department.*/
select emp_name, department, salary from employees 
where department = (select department from employees
where emp_name = "Meera");

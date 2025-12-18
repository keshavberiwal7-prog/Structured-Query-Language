create database joins;

use joins;

create table student(
student_id int,
student_name varchar(20),
course_id int null
);

insert into student(student_id,student_name,course_id)values
(1,'John',101),
(2,'Emma',102),
(3,'Raj',103),
(4,'Sara',null),
(5,'Alex',101);

select * from student;

create table course(
course_id int,
course_name varchar(20),
instructor_id int
);

insert into course(course_id,course_name,instructor_id)values
(101,'Data science',1),
(102,'Machine learning',2),
(103,'Database systems',3),
(104,'Web development',4);

select * from course;

create table instructors(
instructor_id int not null,
instructor_name varchar(20)
);

insert into instructors(instructor_id,instructor_name)values
(1,'Dr.Smith'),
(2,'Dr.Miller'),
(3,'Dr.Patil'),
(4,'Dr,Brown'),
(5,'Dr.Jones');

select * from instructors;

## 1. Get all students with their course name.
select s.student_name, c.course_name
from student s
inner join course c
on s.course_id=c.course_id;


select s.student_name, c.course_name
from student s
inner join course c
on s.course_id=c.course_id
where course_name="Machine Learning";

select s.student_name, c.course_name, i.instructor_name
from student s
inner join course c on s.course_id=c.course_id
inner join instructors i on c.instructor_id=i.instructor_id;


select i.instructor_name, s.student_name
from instructors i 
inner join course c on i.instructor_id=c.instructor_id
inner join student s on c.course_id=s.course_id;

select  c.course_name
from student s
inner join course c
on s.course_id=c.course_id;
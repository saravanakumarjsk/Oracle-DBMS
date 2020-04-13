create table dept(dno number primary key, 
dname varchar(20), location VARCHAR(20));

drop table emp;

create table emp
(eno number primary key, 
ename varchar(25), 
design varchar(25), 
salary int,
dept_id number references dept(dno));

insert into dept values(11, 'Admin', 'Chennai');
insert into dept values(12, 'Development', 'Madurai');
insert into dept values(14, 'Training', 'Hydrabad');
insert into dept values(15, 'Marketting', 'Chennai');

select * from dept;

insert into emp values(101, 'Ram', 'Manager', 7000, 11);
insert into emp values(102, 'Ravi', 'Boss', 6000, 11);
insert into emp values(103, 'Rakesh', 'Manager', 5000, 11);
insert into emp values(104, 'Kavya', 'Developer', 8500, 11);
insert into emp values(105, 'Kavitha', 'Developer', 6700, 12);
insert into emp values(106, 'Reathi', 'Programmer', 5700, 12);
insert into emp values(107, 'Leo', 'Programmer', 3000, 12);
insert into emp values(108, 'Magesh', 'Trainer', 4500, 14);
insert into emp values(109, 'Pradeep', 'Programmer', 4700, 12);
insert into emp values(110, 'Raesh', 'Trainer', 5000, 14);
insert into emp values(111, 'Sai', 'Developer', 5000, null);
insert into emp values(112, 'Kumar', 'Manager', 5000, null);

select * from emp;

--inner join
select eno, ename, design, salary, dname, location
from emp inner join dept 
on emp.dept_id = dept.dno;

--using
select ename, design, salary, dname, location
from emp inner join dept
using(dno);

--natural join
select ename, desig, salary, dname, location
from emp natural join dept;

--left outer join
select ename, design, salary, dname, location
from emp left outer join dept
on emp.dept_id = dept.dno;

--right outer join
select ename, design, salary, dname, location
from emp right outer join dept
on emp.dept_id = dept.dno;

--full outer join
select * from emp full outer join dept
on emp.dept_id = dept.dno;

commit;

create table developer(dname varchar(20));
insert into developer values('Ram');
insert into developer values('krish');
insert into developer values('shiva');

create table technology(tname varchar(25));
insert into technology values('java');
insert into technology values('.net');
insert into technology values('JS');

--cartesian join
select dname, tname from technology cross join developer;

--alais name for table
select e.ename, e.design, d.dno, d.dname from emp e join dept d on
e.dept_id = d.dno;


commit;




















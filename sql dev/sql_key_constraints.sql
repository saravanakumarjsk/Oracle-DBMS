-- not null
-- show user;
create table test(id number not null, name varchar(20));

insert into test values(1, 'sam');
insert into test values(1, 'kev');
select * from test;

--primary key
drop table passport;

create table passport(id number, name varchar(20));
alter table passport add constraint pk primary key(id, name);

insert into passport values(1, 'sk');
insert into passport values(2, 'rk');
insert into passport values(3, 'mk');

select * from passport;

--foreign key

drop table company;

create table company(id number, name varchar(20));
alter table company add constraint pk1 primary key(id);

insert into company values(1, 'sk');
insert into company values(2, 'rk');
insert into company values(3, 'mk');

drop table emp;
create table emp(depid number, salary varchar(20));
alter table emp add constraint fk1 foreign key(depid) references company(id);

insert into emp values(1, 1500);
insert into emp values(2, 2500);
insert into emp values(3, 3500);

update emp set salary=1500 where depid=3;
update emp set salary=1500 where depid=1;
delete from emp where salary=1500;

select * from company;
select * from emp;

delete from emp where depid=1;
delete from company where id=1;

--check
create table checkc(id number, age number check(age>=18));
insert into checkc values(1, 24);
insert into checkc values(1, 77);
select * from checkc;

--default
create table course(cid number, name varchar(20), fee number default 1000);

insert into course(cid, name) values(101, 'ram');
insert into course(cid, name) values(102, 'charan');
insert into course values(103, 'magesh babu', 2000);

select * from course;

-----------------------------------------------------
drop table test;
--enabling and disabling constraint
create table test(f1 number);

alter table test add constraint cc check(f1 between 10 and 20);

insert into test values(10);
insert into test values(100);

alter table test disable constraint cc;

select * from test;

alter table test enable constraint cc;
delete from test where f1=100;
alter table test enable constraint cc;

----------------------------------------------------

--Data dictionaries

select * from user_constraintS where table_name='EMP';
























































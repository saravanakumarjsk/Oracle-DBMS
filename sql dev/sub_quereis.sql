create table deptm(dno number primary key, 
dname varchar(20), location VARCHAR(20));

drop table emply;

create table emply
(eno number primary key, 
ename varchar(25), 
design varchar(25), 
salary int,
dept_id number references deptm(dno));

insert into deptm values(11, 'Admin', 'Chennai');
insert into deptm values(12, 'Development', 'Madurai');
insert into deptm values(14, 'Training', 'Hydrabad');
insert into deptm values(15, 'Marketting', 'Chennai');

select * from deptm;

drop table deptm;

insert into emply values(101, 'Ram', 'Manager', 7000, 11);
insert into emply values(102, 'Ravi', 'Boss', 6000, 11);
insert into emply values(103, 'Rakesh', 'Manager', 5000, 11);
insert into emply values(104, 'Kavya', 'Developer', 8500, 11);
insert into emply values(105, 'Kavitha', 'Developer', 6700, 12);
insert into emply values(106, 'Reathi', 'Programmer', 5700, 12);
insert into emply values(107, 'Leo', 'Programmer', 3000, 12);
insert into emply values(108, 'Magesh', 'Trainer', 4500, 14);
insert into emply values(109, 'Pradeep', 'Programmer', 4700, 12);
insert into emply values(110, 'Raesh', 'Trainer', 5000, 14);
insert into emply values(111, 'Sai', 'Developer', 5000, null);
insert into emply values(112, 'Kumar', 'Manager', 5000, null);

select * from emply;

commit;

select * from emply where salary = (select max(salary) from emply);

--single row sub qurey

create table product(pid number, pname varchar(20));
insert into product values(300, 'pen');
insert into product values(301, 'pencil');
insert into product values(302, 'reaser');


create table orders(order_id number, cust_id number, to_street varchar(20),
to_city varchar(20), ship_date date);

insert into orders values(200, 100, 'anna street', 'chennai', to_date('10-apr-20', 'dd-mon-yy'));
insert into orders values(201, 101, 'gandhi street', 'madurai', to_date('12-feb-20', 'dd-mon-yy'));
insert into orders values(202, 102, 'anna street', 'chennai', to_date('15-mar-20', 'dd-mon-yy'));


create table customer(cust_id number, fname varchar(20), street varchar(20),
city varchar(20), zipcode number, phone number);


insert into customer values(100, 'ram', 'anna street', 'chennai', 600001, 983457834);
insert into customer values(101, 'krishna', 'gandhi street', 'madurai', 600002, 98373475);
insert into customer values(102, 'shiva', 'anna street', 'chennai', 600001, 98364434);

--single row qurey

select * from orders where cust_id=(select cust_id from customer where fname='ram');

--multiple row subqurey
select * from orders where cust_id in (select cust_id from customer where fname='ram');

--multiple column subqurey
select order_id, pdt_id, quantity from product_order where
(pdt_id, quantity) in (select pdt_id, quantity from product_order
where order_id=200);

--correlated subqurey
select pdt_name, peice from product p
where pdt_id in (select pdt_id from product_order
where p.pdt_type='stationary')











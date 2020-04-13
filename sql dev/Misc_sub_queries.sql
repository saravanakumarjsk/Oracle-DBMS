select * from building;
select * from bill;

--left outer join
select * from building, bill where bill.id = building.id(+);
--right outer join
select * from building, bill where bill.id(+) = building.id;
--full outer join
select * from building, bill where bill.id = building.id(+)
union
select * from building, bill where bill.id(+) = building.id;

--coalesce
select coalesce(1,2,null,4,3) from dual;
select coalesce(null,2,null,4,3) from dual;

-----------------------------------------------------------------

create table emp(eno number primary key);
insert into emp values(101);
insert into emp values(102);
insert into emp values(103);
insert into emp values(104);
insert into emp values(105);
insert into emp values(106);

--DECODE
select ename, design, salary, decode(desig, 'Manager', 3000, 'Trainer',2000,
1000) bonus from emp;

--case
select ename, desig, salary,
case desig
when 'Manager' then salary+4000
when 'Developer' then salary+3000
when 'programmer' then salary+2000
else salary+1000
end bonus
from emp;

--case with 2 conditions
update emp set salary=
case when salary>8000 then salary+1000
else aslary
end;



create table empcon(id number primary key, eno int references emp(eno),
home varchar(15), work varchar(15), cell varchar(15));

insert into empcon values(1, 101, null, '044-983483948', 9888898989657);
insert into empcon values(2, 102, null, '044-983483948', 9888898989657);
insert into empcon values(3, 103, null, '044-983483948', 9888898989657);
insert into empcon values(4, 104, null, '044-983483948', 9888898989657);
insert into empcon values(5, 105, null, '044-983483948', 9888898989657);
insert into empcon values(6, 106, null, '044-983483948', 9888898989657);


--greatest and lowest
select greatest(10,20,30,40,50) from dual;
select least(10,20,30,40,50) from dual;

--NVL, NVL2, NULLIF

select id, eno, home, nvl(home, 'sweet home') as "dummy" from empcon;

select id, eno, home, nvl2(home, 'sweet home', id) as "dummy" from empcon;

--rollup
select id, sum(eno) from empcon group by rollup(id);

--cube
select id, sum(eno) from empcon group by cube(id); 
































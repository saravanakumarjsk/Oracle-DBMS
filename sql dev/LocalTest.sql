select * from emp;

select * from building;

select sum(salary) from emp;
select count(salary) from emp;
select min(salary) from emp;
select avg(salary) from emp;
select max(salary) from emp;


select desig from emp group by desig;
select ename, desig from emp group by ename, desig;
select desig, count(ename) from emp group by desig;
select desig, count(ename) from emp group by desig having desig='pro';

select * from emp;

select * from tab;

desc dual;

select * from dual;

select count(*) from dual;

select abs(834.384) from dual;

select exp(4) from dual;

select ceil(834.384) from dual;
select round(834.384) from dual;
select trunc(834.384) from dual;
select floor(834.384) from dual;
select sqrt(834.384) from dual;

-- Date arithmetic
add_months('05-JAN-14', 7);

SELECT
  ADD_MONTHS( DATE '2016-02-29', 1 )
FROM
  dual;

commit;


ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH24:MI:SS';

SELECT
  TO_CHAR(
        ROUND( TO_DATE( '20-Jul-2017 16:30:15',  'DD-Mon-YYYY HH24:MI:SS' ) ),
  'DD-Mon-YYYY HH24:MI:SS' )  rounded_result
FROM
  dual;


-- String functions
select * from dual;

select length('oracle length') len from dual;

select length(ename) len from emp;

select upper(ename) from emp;

select lower(ename) from emp;

select initcap(ename) from emp;

select lpad(ename, 10, '*') from emp;

select rpad(ename, 10, '*') from emp;

select ltrim(' xyz') from emp;

select replace ('this is an example string', ' is', ' the') from dual;

select chr(98) from dual;

commit;

savepoint latest;

select * from building;

select owner_name, length(owner_name) as "name length"
from building order by owner_name asc;

select concat(concat(concat(concat(owner_name, '-'), contact_number),'-'), email_address) from building
order by owner_name desc;

select substr(meter_number, 1,3) as "meter code" from building;

select owner_name from building where ename like '%di%' order by owner_name asc;

select sum(fine_amount)as "total fine" from bill where due_date >= '01-oct-2017' and due_date <='01-nov-2017';

select due_date, payable_amount from bill where not payment_date >= '10-oct-2017' and payment_date <='10-sep-2017';

select sum(fine_amount) as "monthly_fine_amount" from bill where month between '06' and '10' order by month asc;

select is_payed from bill where day='23-sep-2017';

select due_date, payment_date, due_date-payment_date from bill;

select day, to_char(day, 'DAY') dayyy, avg(total_units) as "avg_consuption"
from electricity_reading
group by day order by dayyy asc;



















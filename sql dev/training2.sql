create table electricity_reading(id number, meter_id number,
day Date, h1 number, h2 number, h3 number, h4 number, h5 number, h6 number,
 h7 number, h8 number, h9 number, h10 number, h11 number, h12 number, h13 number,
  h14 number, h15 number, h16 number, h17 number, h18 number, h19 number, h20 number,
   h21 number, h22 number, h23 number, h24 number, total_units number);
   
insert into electricity_reading values(1, 1, TO_DATE('17/12/2015', 'DD/MM/YYYY'), 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,600);
insert into electricity_reading values(1, 1, TO_DATE('17/12/2015', 'DD/MM/YYYY'), 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,600);
insert into electricity_reading values(1, 1, TO_DATE('17/12/2015', 'DD/MM/YYYY'), 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,600);
insert into electricity_reading values(1, 1, TO_DATE('17/12/2015', 'DD/MM/YYYY'), 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,600);
insert into electricity_reading values(1, 1, TO_DATE('17/12/2015', 'DD/MM/YYYY'), 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,600);
insert into electricity_reading values(1, 1, TO_DATE('01-Oct-2017', 'DD-MM-YYYY'), 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,600);


select * from electricity_reading;
commit;

select avg(h8) as "avg_8th_hour_reading" from electricity_reading;

select avg(payable_amount) as "avg_payable_amount" from bill where payable_amount>1000;

select avg(fine_amount) as "average_fine_amount" from bill where extract(year from payment_date) = 2015;

select sum(payable_amount) as "sum_payable_amount" from bill;

select sum(total_units) as "sum_payable_amount" from bill where day=to_date('01-Oct-2017', 'DD-MM-YYYY');

select min(total_units) as "min_total_units" from electricity_reading;

select * from bill;

select fine_amount from (select fine_amount, dense_rank() over (order by fine_amount asc) rnk from bill) where rnk=2;

select month, total_units as "minimum_units" from bill;

select stddev(fine_amount) "std_deviation_amount" from bill where year=2018;

select variance(payable_amount) as "variance_payable_amount" from bill where monthname(payment_date)='October';

select total_units as "count_total_units_500" from electricity_reading where total_units>500;

select max(payable_amount) as "maximum_payable_amount" from bill; 

select * from dual;
select h1, h2 from electricity_reading where not to_char(day, 'MM')='oct';













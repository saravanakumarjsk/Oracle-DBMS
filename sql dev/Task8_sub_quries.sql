--1
select * from building_type where
name in (select name from building_type where name='SHOPPING MALL' 
or name='HOTEL');

--2
select name from building_type
where id = (select id from meter where 
meter_number='SG567423');

--3
select total_units, payable_amount 
from bill where id = (select id from
meter where meter_number='SG934826');

--4
select avg(payable_amount) as "payable_amount" from bill
where id in (select id from slab where rate<24);

--5
select meter_number from meter
where id in (select id from bill where (month, total_units) in (select month, min(total_units)
from bill group by month)) order by meter_number asc;










--1
select * from bill l join meter m on
l.meter_id = m.id
order by payable_amount asc;

--2
select d.meter_number, b.owner_name, b.address, b.contact_number
from building b join meter d
on (b.building_type_id = d.building_id)
order by b.owner_name asc,d.meter_number asc;


--3
select b.owner_name, b.address, b.contact_number, m.meter_number, t.name, e.connection_name
from building b, meter m, electricity_connection_type e, building_type t
where m.building_id = b.id
and b.building_type_id = t.id
and t.connection_type_id = e.id
order by b.owner_name asc, m.meter_number asc;

--4
select c.connection_name, s.from_unit, s.to_unit, s.rate
from slab s, electricity_connection_type c
where s.connection_type_id = c.id
order by s.rate;

--5
select b.owner_name, b.address, m.meter_number, l.payable_amount, max(l.fine_amount)
from slab s, electricity_connection_type c, building b, meter m, building_type t, bill l
where s.connection_type_id = c.id
and m.building_id = b.id
and b.building_type_id = t.id
and t.connection_type_id = c.id
and l.meter_id = m.id
group by b.owner_name, b.address, m.meter_number, l.payable_amount
order by b.owner_name asc;

--6
select b.owner_name, b.address, m.meter_number, l.total_units, l.year, l.month
from building b, meter m, bill l
where m.building_id = b.id
and l.meter_id = m.id
and (l.year = 2017 and l.month = 11)
order by l.total_units desc;
commit;


--7
select m.meter_number,b.owner_name,b.address
from building b join meter m on b.id = m.building_id
join 
(select meter_id,count(fine_amount) A from bill group by meter_id) 
b on m.id = b.meter_id
where 
A=(select max(D)from (select count(fine_amount) D from bill group by meter_id))
order by b.owner_name;

--select meter_id, count(meter_id) from bill group by meter_id;

-- 8
select b.owner_name, b.address, (select count(building_type_id) from building group by building_type_id) 
as "count freq"
from building b join building_type t 
on t.id = b.building_type_id
group by b.owner_name, b.address
order by b.owner_name asc;


select count(building_type_id) from building group by building_type_id;





select * from bill;
commit;

--slab s> from unit, to unit, rate
--meter m> meter_number;
--building b> owner_name, add, contact,;
--building_type bt> name,
--elect_reading c> connection_name
--bill l> payable_amount, fine_amount
--electricity_reading r>meter_id, total_units

select * from building;



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

















-- drop table electricity_connection_type;

create table electricity_connection_type(id number primary key,
    connection_name varchar(20));

-- drop table slab;

create table slab(id number primary key,
connection_type_id number not null,
from_unit number not null,
to_unit number not null,
rate number not null);

--drop table building_type;

create table building_type(id number primary key,
    name varchar(20),
    connection_type_id number REFERENCES
    electricity_connection_type(id));

--drop table building;

create table building(id number primary key,
owner_name varchar(20) not null,
address varchar(20) not null,
building_type_id number REFERENCES building_type(id),
contact_number varchar(20) not null,
email_address varchar(20));


--drop table meter;

create table meter(id number primary key,
    meter_number varchar(20) not null,
    building_id number REFERENCES building(id));


--drop table bill;
create table bill(
id number primary key,
meter_id number REFERENCES meter(id),
month number not null,
year number not null,
due_date date not null,
total_units number not null,
payable_amount number not null,
is_payed number(1) not null,
payment_date date,
fine_amount number);

--drop table electricity_reading;

create table electricity_reading(id number primary key,
meter_id number REFERENCES meter(id),
day date not null,
h1 number, h2 number , h3 number , h4 number ,
h5 number, h6 number , h7 number , h8 number ,
h9 number, h10 number, h11 number ,h12 number ,
h13 number, h14 number, h15 number , h16 number,
h17 number, h18 number, h19 number , h20 number,
h21 number, h22 number, h23 number , h24 number,
total_units number not null);


--desc bill;

insert into electricity_connection_type values(1, 'HOME');
insert into electricity_connection_type values(2, 'COMMERCIAL');

insert into building_type values(1, 'SHOPPING MALL', 2);
insert into building_type values(2, 'HOTEL', 2);
insert into building_type values(3, 'THEATER', 2);
insert into building_type values(4, 'APARTMENT', 1);
insert into building_type values(5, 'FLAT', 1);
insert into building_type values(6, 'PHARMACY', 1);
insert into building_type values(7, 'COLLEGE', 2);
insert into building_type values(8, 'SCHOOL', 2);

INSERT INTO BUILDING VALUES(1, 'HAIDIL', 'VIVOCITY, 1 HARBOURFRON T WALK, SINGAPORE 098585',
    1, '+65 6377 6860', 'VIVOSUPPORT@VIVOCITY.COM.SG');
INSERT INTO BUILDING VALUES(2, 'MUHAMMAD HAFAZ', 'SUNTEC CITY 3E TEMASEK BOULEVARD, SINGAPORE 038964',
    1, '+65 6266 1502', 'SUNTECENQUREIS@SUNTECREIT.SG');
INSERT INTO BUILDING VALUES(3, 'PEISEN', 'VHOTEL LAVENDER, 70 JELLIOODE RD, SINGAPORE 208767',
    2, '+58 6345 2233', 'CONTACTLAVENDER@VHOTEL.SG');
INSERT INTO BUILDING VALUES(4, 'CLAUDIA MOONSOON', 'STRAND HOTEL SINGAPORE, 25 BENCOOLEN ST, SINGAPORE CITY 189619',
    2, '+65 6338 2233', 'RESERVERSTRAND@STRANDHOTEL.COM.SG');
INSERT INTO BUILDING VALUES(5, 'MUZZAMMIL', 'OCBC ARENA, 5 SADIUM DRIVE, SINGAPORE 397631',
    3, '+65 6653 8900', 'MAIL@THEKALLANGWAVE.SG');
INSERT INTO BUILDING VALUES(6, 'MARK JEDIDIAH', 'THE ARENA SINGAPORE,48 WOODLEIGH PARK, SINGAPORE 357844',
    3, '+65 6653 8900', 'CONTACT@THEARENA.SG');
INSERT INTO BUILDING VALUES(7, 'NICHOLAS', 'THE CATHY, 2 HANDY ROAD, LEVEL 5 and 6, THE CATHY, SINGAPORE 2292223',
    3, '+65 6653 8900', 'MAIL@CATHY.COM.SG');
INSERT INTO BUILDING VALUES(8, 'CHARMAINE', 'CARNIVAL CINEMAS, 100 BEACH ROAD #02-30A SHAW TOWEERS, SINGAPORE 189702',
    3, '+65 6653 8900', 'FEEDBACK@CARNIVALCINEMAS.IN');


INSERT INTO METER VALUES(1, 'SG394826', 1);
INSERT INTO METER VALUES(2, 'SG923564', 2);
INSERT INTO METER VALUES(3, 'SG567423', 3);
INSERT INTO METER VALUES(4, 'SG854378', 4);
INSERT INTO METER VALUES(5, 'SG976232', 5);
INSERT INTO METER VALUES(6, 'SG413789', 6);
INSERT INTO METER VALUES(7, 'SG732537', 7);
INSERT INTO METER VALUES(8, 'SG288942', 8);



INSERT INTO bill VALUES(1, 1, 12, 2017, TO_DATE('2018-01-01', 'YYYY-MM-DD'),  19900, 696500, 0, null, null);
INSERT INTO bill VALUES(2, 2, 12, 2017, TO_DATE('2018-01-01', 'YYYY-MM-DD'),  17000, 595000, 1, TO_DATE('2018-01-02', 'YYYY-MM-DD'), 59500);
INSERT INTO bill VALUES(3, 3, 10, 2017, TO_DATE('2017-11-01', 'YYYY-MM-DD'),  4100, 110700, 1, TO_DATE('2017-10-28', 'YYYY-MM-DD'), null);
INSERT INTO bill VALUES(4, 4, 11, 2017, TO_DATE('2017-12-01', 'YYYY-MM-DD'),  4500, 121500, 0, null, null);
INSERT INTO bill VALUES(5, 5, 12, 2017, TO_DATE('2018-01-01', 'YYYY-MM-DD'),  7500, 262500, 0, null, null);
INSERT INTO bill VALUES(6, 5, 11, 2017, TO_DATE('2017-12-01', 'YYYY-MM-DD'),  7670, 268450, 1, TO_DATE('2017-12-15', 'YYYY-MM-DD'), 26845);
INSERT INTO bill VALUES(7, 5, 9, 2017, TO_DATE('2017-10-01', 'YYYY-MM-DD'),  7550, 226500, 1, TO_DATE('2017-09-10', 'YYYY-MM-DD'), null);
INSERT INTO bill VALUES(8, 6, 9, 2017, TO_DATE('2017-10-01', 'YYYY-MM-DD'),  7800, 234000, 0, null, null);
INSERT INTO bill VALUES(9, 7, 10, 2017, TO_DATE('2017-11-01', 'YYYY-MM-DD'),  4050, 109350, 1, TO_DATE('2017-10-20', 'YYYY-MM-DD'), null);
INSERT INTO bill VALUES(10, 7, 11, 2017, TO_DATE('2017-12-01', 'YYYY-MM-DD'),  4110, 110970, 1, TO_DATE('2017-12-14', 'YYYY-MM-DD'), 11097);
INSERT INTO bill VALUES(11, 7, 12, 2017, TO_DATE('2018-01-01', 'YYYY-MM-DD'),  4220, 113940, 0, null, null);
INSERT INTO bill VALUES(12, 8, 11, 2017, TO_DATE('2017-12-01', 'YYYY-MM-DD'),  3960, 106920, 1, TO_DATE('2017-11-25', 'YYYY-MM-DD'), null);
--INSERT INTO bill VALUES(13, 9, 11, 2017, TO_DATE('2017-12-01', 'YYYY-MM-DD'),  1200, 27000, 1, TO_DATE('2017-12-20', 'YYYY-MM-DD'), 2700);
--INSERT INTO bill VALUES(14, 10, 10, 2017, TO_DATE('2017-11-01', 'YYYY-MM-DD'),  750, 16875, 1, TO_DATE('2017-11-01', 'YYYY-MM-DD'), 1687.5);


INSERT INTO ELECTRICITY_READING VALUES(1, 1, TO_DATE('2018-05-06', 'YYYY-MM-DD'),5, 5, 5, 5, 5, 5, 5, 5, 5, 50, 55, 50, 60, 60, 50, 50, 55, 50, 50, 80, 75, 75, 5, 5, 815);
INSERT INTO ELECTRICITY_READING VALUES(2, 1, TO_DATE('2018-05-07', 'YYYY-MM-DD'),5, 5, 5, 5, 5, 5, 5, 5, 5, 40, 45, 50, 55, 50, 50, 55, 60, 60, 55, 75, 80, 70, 5, 5, 805);
INSERT INTO ELECTRICITY_READING VALUES(3, 2, TO_DATE('2018-05-06', 'YYYY-MM-DD'),4, 4, 4, 4, 4, 4, 4, 4, 4, 40, 35, 40, 45, 45, 40, 47, 50, 45, 50, 50, 65, 70, 5, 5, 668);
INSERT INTO ELECTRICITY_READING VALUES(4, 2, TO_DATE('2018-05-07', 'YYYY-MM-DD'),4, 4, 4, 4, 4, 4, 4, 4, 4, 45, 40, 35, 40, 50, 45, 50, 50, 45, 45, 60, 65, 65, 5, 5, 681);
INSERT INTO ELECTRICITY_READING VALUES(5, 3, TO_DATE('2018-05-06', 'YYYY-MM-DD'),2, 2, 2, 2, 2, 4, 5, 5, 6, 6, 8, 9, 7, 8, 10, 9, 6, 7, 8, 10, 11, 11, 4, 3, 147);
INSERT INTO ELECTRICITY_READING VALUES(6, 3, TO_DATE('2018-05-07', 'YYYY-MM-DD'),1,2,2,1,2,4,8,7,8,6,10,9,9,10,7,9,8,8,8,11,9,10,4,2,155);
INSERT INTO ELECTRICITY_READING VALUES(7, 4, TO_DATE('2018-05-06', 'YYYY-MM-DD'),2,3,2,2,2,5,4,7,6,5,6,8,7,8,10,10,9,10,7,9,11,10,3,4,150);
INSERT INTO ELECTRICITY_READING VALUES(8, 4, TO_DATE('2018-05-07', 'YYYY-MM-DD'),2,2,3,3,2,4,7,6,9,8,10,9,9,11,11,9,10,9,9,11,12,10,2,2,170);
INSERT INTO ELECTRICITY_READING VALUES(9, 5, TO_DATE('2018-05-06', 'YYYY-MM-DD'),2,2,1,1,1,1,1,2,2,2,2,3,2,3,2,2,2,3,2,50,80,60,60,5,291);
INSERT INTO ELECTRICITY_READING VALUES(10, 5, TO_DATE('2018-05-07', 'YYYY-MM-DD'),1,2,2,1,1,1,1,2,1,1,2,2,2,2,1,3,3,2,2,60,60,70,50,6,278);

INSERT INTO SLAB VALUES(1,1,0,100,20);
INSERT INTO SLAB VALUES(2,1,101,300,22.5);
INSERT INTO SLAB VALUES(3,2,301,750,24);
INSERT INTO SLAB VALUES(4,2,751,1500,28);

--SELECT * FROM TAB;
--cl scr;
select * from building;
select * from bill;
commit;


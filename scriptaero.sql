create database aero;
use  aero;

create table aerolineas(id_aerolinea int,nombre_aerolinea varchar(45));

alter table aerolineas add constraint pk_id_aerolinea primary key (id_aerolinea);

insert into aerolineas (id_aerolinea,nombre_aerolinea) values (1,'volaris');
insert into aerolineas (id_aerolinea,nombre_aerolinea) values (2,'aeromar');
insert into aerolineas (id_aerolinea,nombre_aerolinea) values (3,'interjet');
insert into aerolineas (id_aerolinea,nombre_aerolinea) values (4,'aeromexico');


create table aeropuertos(id_aeropuerto int,nombre_aerolinea varchar(45));

alter table aeropuertos add constraint pk_id_aeropuerto primary key (id_aeropuerto);

insert into aeropuertos (id_aeropuerto,nombre_aerolinea) values (1,'benito juarez');
insert into aeropuertos (id_aeropuerto,nombre_aerolinea) values (2,'guanajuato');
insert into aeropuertos (id_aeropuerto,nombre_aerolinea) values (3,'la paz');
insert into aeropuertos (id_aeropuerto,nombre_aerolinea) values (4,'oaxaca');


create table movimientos(id_mov int,descripcion varchar(45));

alter table movimientos add constraint pk_id_mov primary key (id_mov);

insert into movimientos (id_mov,descripcion) values (1,'salida');
insert into movimientos (id_mov,descripcion) values (2,'llegada');




create table vuelos (id_vuelo int,id_aerolinea int,id_aeropuerto int,id_mov int,dia date);

alter table vuelos add constraint pk_id_vuelo primary key (id_vuelo);

alter table vuelos add constraint fk_id_aerolinea foreign key (id_aerolinea)
 references aerolineas (id_aerolinea);
alter table vuelos add constraint fk_id_aeropuerto foreign key (id_aeropuerto)
 references aeropuertos (id_aeropuerto);
alter table vuelos add constraint fk_id_mov foreign key (id_mov) 
references movimientos (id_mov);

select * from vuelos;

insert into vuelos (id_vuelo,id_aerolinea,id_aeropuerto,id_mov,dia) values (1,1,1,1,'2021-05-02');
insert into vuelos (id_vuelo,id_aerolinea,id_aeropuerto,id_mov,dia) values (2,2,1,1,'2021-05-02');
insert into vuelos (id_vuelo,id_aerolinea,id_aeropuerto,id_mov,dia) values (3,3,2,2,'2021-05-02');
insert into vuelos (id_vuelo,id_aerolinea,id_aeropuerto,id_mov,dia) values (4,4,3,2,'2021-05-02');
insert into vuelos (id_vuelo,id_aerolinea,id_aeropuerto,id_mov,dia) values (5,1,3,2,'2021-05-02');
insert into vuelos (id_vuelo,id_aerolinea,id_aeropuerto,id_mov,dia) values (6,2,1,1,'2021-05-02');
insert into vuelos (id_vuelo,id_aerolinea,id_aeropuerto,id_mov,dia) values (7,2,3,1,'2021-05-04');
insert into vuelos (id_vuelo,id_aerolinea,id_aeropuerto,id_mov,dia) values (8,3,4,1,'2021-05-04');
insert into vuelos (id_vuelo,id_aerolinea,id_aeropuerto,id_mov,dia) values (9,3,4,1,'2021-05-04');

select * from vuelos;

select ao.nombre_aerolinea,m.id_mov from aeropuertos ao inner join movimientos m 
where m.id_mov>='dia';

select o.nombre_aerolinea,id_mov from aerolineas o inner join vuelos
 where id_mov=(select max(id_mov)from vuelos);


select MAX(dia)
from vuelos;


select a.nombre_aerolinea 
from aerolineas a inner join vuelos v
where id_mov>=2;








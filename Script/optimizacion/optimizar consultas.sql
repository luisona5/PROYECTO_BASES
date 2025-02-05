use aerolineas;
-- EXPLAIN
explain select*from pasajeros where nombre='Adrian' ;
explain analyze select*from pasajeros where apellido='Garcia';

-- --------------------------------------------------------
-- PROCEDIMIENTO
select*from reservas;

delimiter //
create procedure act_precio(in vuelos_id int, in porcentaje decimal(10,2))
begin
update reservas
set precio=round(precio*(1 + porcentaje/100),2)
where vuelo2_id=vuelos_id;
end //
delimiter ;
-- llamando al procedimiento
call act_precio(1,65.15);


use aerolineas;
-- -------------------------------------------------------------
					-- CONSULTAS-VISTAS
alter view informacion as 
select ae.nombre as aerolinea,ae.codigo,
p.nombre as pais_origen, ae.frecuencia_vuelo,
a.nombre as aeropuerto,av.modelo,av.capacidad,
ic.nombre as estado
from aerolineas as ae
inner join paises as p on p.id=ae.pais1_id
inner join aeropuertos a on a.id=ae.aeropuerto_id
inner join aviones as av on ae.id=av.id
inner join item_catalogos as ic on ic.id=estado_avion_id;
select*from informacion;



alter view informacion_persona as
select concat(p.nombre,' ',p.apellido) as identificacion,p.correo,p.telefono,e.numero_puerta,e.terminal,
ic.nombre as tipo_asiento,r.precio,r.fecha_compra,
v.distancia_recorrida,
aerol.nombre as aerolinea,ae.
nombre as aeropuerto
from reservas as r
inner join pasajeros as p on p.id=r.pasajero2_id
inner join embargues as e on e.id=r.embargue_id
inner join item_catalogos as ic on ic.id= estado_reserva_id
inner join vuelos as v on v.id=vuelo2_id
inner join aeropuertos as ae on ae.id=v.aeropuerto_destino
inner join aerolineas as aerol on ae.id=aerol.aeropuerto_id;

select*from  informacion_persona;


-- ------------------------------------------------------------------------------
							-- TRIGGERS 

create table auditoria_pasajeros(
id int auto_increment primary key,
cedula varchar(10) ,
nombre varchar(50) ,
apellido varchar(50) ,
edad int ,
correo varchar(100) ,
telefono varchar(10) ,
equipaje1_id int,
fecha_eliminacion timestamp default current_timestamp
);

 delimiter $$
 create trigger before_delete_pasajeros
 before delete on pasajeros
 for each  row
 begin
	insert into auditoria_pasajeros(cedula,nombre,apellido,edad,correo,telefono,equipaje1_id)
    values(old.cedula,old.nombre,old.apellido,old.edad,old.correo,old.telefono,old.equipaje1_id);
 end $$
 delimiter ;
 
 delete from pasajeros where id=21;
 
 select*from auditoria_pasajeros;
 
 
 -- ---------------------------------------------------------------------
 
 SHOW PROCESSLIST;
 SHOW FULL PROCESSLIST;

select*from catalogos;
select*from item_catalogos;
select*from equipajes;
select*from pasajeros;
select*from tripulantes;
select*from pilotos;
select*from paises;
select*from ciudades;
select*from aeropuertos;
select*from aerolineas;
select*from vuelos;
select*from embargues;
select*from aviones;
select*from reservas;
  
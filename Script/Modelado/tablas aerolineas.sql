drop database aerolineas;

create database aerolineas;
use aerolineas;

 create table catalogos(
 id int auto_increment primary key,
 nombre_catalogo varchar(50)not null
 );
 
 create table item_catalogos(
 id int auto_increment primary key,
 nombre varchar(50) not null,
 catalogos_id int not null,
 constraint fk_catalogo foreign key(catalogos_id ) references catalogos(id) on delete cascade
 );
 -- drop table item_catalogos
 create table equipajes(
 id int auto_increment primary key,
 etiqueta varchar(50) not null unique,
 peso decimal(4,2)not null,
 dimension varchar(50) not null,
 equipaje_id int not null,
 constraint fk_item foreign key(equipaje_id) references item_catalogos(id) on delete cascade
 
 );
-- drop table equipajes;

create table pasajeros(
id int auto_increment primary key,
cedula varchar(10) not null,
nombre varchar(50) not null,
apellido varchar(50) not null,
edad int not null,
correo varchar(100) not null unique,
telefono varchar(10) not null,
equipaje1_id int not null,
constraint fk_equipa foreign key(equipaje1_id) references equipajes(id) on delete cascade

);

-- drop table pasajeros;


create table tripulantes(
id int auto_increment primary key,
nombre varchar(50) not null,
identificacion_unico varchar(10) not null,
certificacion varchar(50) not null,
estado_cargo_id int not null,
constraint fk_cargo foreign key(estado_cargo_id) references item_catalogos(id) on delete cascade
);
-- drop table tripulantes;

create table pilotos(
id int auto_increment primary key,
licencia varchar(50) not null unique,
nacionalidad varchar(50) not null,
horas_vuelo int not null,
estado_piloto int  not null,
tripulantes_id int not null,
constraint fk_categoria foreign key(estado_piloto) references item_catalogos(id) on delete cascade,
constraint fk_nombre foreign key(tripulantes_id) references tripulantes(id) on delete cascade
);
-- drop table pilotos;

create table paises(
id int auto_increment primary key,
nombre varchar(50)not null
);
 create table ciudades(
 id int auto_increment primary key,
 nombre varchar(50)not null,
 pais_id int not null,
 constraint fk_pais foreign key(pais_id)  references paises(id) on delete cascade
 );
 
 create table aeropuertos(
 id int auto_increment primary key,
 nombre varchar(50)not null,
 ciudad_id int not null,
 constraint fk_ciudad foreign key(ciudad_id) references ciudades(id) on delete cascade
 );

 create table aerolineas(
 id int auto_increment primary key,
 nombre varchar(50) not null,
 codigo varchar(50) not null,
 pais1_id int not null,
 frecuencia_vuelo varchar(50) not null,
 codigo_IATA varchar(50) not null,
 aeropuerto_id int not null,
 constraint fk_pais1 foreign key(pais1_id) references paises(id) on delete cascade,
 constraint fk_aerolinea foreign key(aeropuerto_id) references aeropuertos(id) on delete cascade
 );

-- drop table aerolineas;

 create table vuelos(
 id int auto_increment primary key,
 numero_vuelo int not null,
 duracion_vuelo int not null,
 distancia_recorrida decimal(10,2),
 aeropuerto_origen int not null,
 aeropuerto_destino int not null,
 aerolinea_id int not null,
 estado_vuelo1_id int not null,
 constraint fk_destino1 foreign key(aeropuerto_origen) references aeropuertos(id) on delete cascade,
 constraint fk_destino2 foreign key(aeropuerto_destino) references aeropuertos(id) on delete cascade,
 constraint fk_aerolinea1 foreign key(aerolinea_id) references aerolineas(id) on delete cascade,
 constraint fk_estado_vuelo foreign key(estado_vuelo1_id) references item_catalogos(id) on delete cascade
 );
 
 
-- set foreign_key_checks=1;
 
 create table embargues(
 id int auto_increment primary key,
 numero_puerta varchar(25) not null,
 terminal varchar(50) not null,
 vuelo_id int not null,
 estado_puerta_id int not null,
 persona_id int not null,
 constraint fk_vuelo foreign key(vuelo_id) references vuelos(id) on delete cascade,
 constraint fk_estado_puerta foreign key(estado_puerta_id) references item_catalogos(id) on delete cascade, 
 constraint fk_persona foreign key(persona_id) references pasajeros(id) on delete cascade 
 );
 
-- drop table embargues;
 
 create table aviones(
 id int auto_increment primary key,
 modelo varchar(50) not null,
 matricula varchar(50) not null,
 capacidad int not null,
 fabricante varchar(50) not null,
 ano_fabricacion date,
 piloto_id int not null,
 aerolinea_id int not null,
 vuelo_id int not null,
 estado_avion_id int not null,
 constraint fk_estado foreign key(estado_avion_id) references item_catalogos(id) on delete cascade,
 constraint fk_piloto foreign key(piloto_id) references pilotos(id) on delete cascade,
 constraint fk_aerolinea2 foreign key(aerolinea_id) references aerolineas(id) on delete cascade,
 constraint fk_vuelo1 foreign key(vuelo_id) references vuelos(id) on delete cascade
 );
 

create table reservas(
id int auto_increment primary key,
numero_reserva int not null,
fecha_compra datetime default current_timestamp,
precio decimal(10,2),
estado_reserva_id int not null,
pasajero2_id int not null,
embargue_id int not null,
vuelo2_id int not null,
constraint fk_reserva foreign key(estado_reserva_id) references item_catalogos(id) on delete cascade,
constraint fk_pasajero2 foreign key(pasajero2_id) references pasajeros(id) on delete cascade,
constraint fk_embargue foreign key(embargue_id) references embargues(id) on delete cascade,
constraint fk_vuelo2 foreign key(vuelo2_id) references vuelos(id) on delete cascade
);
drop table reservas

-- drop table reservas
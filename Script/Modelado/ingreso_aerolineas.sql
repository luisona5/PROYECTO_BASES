use aerolineas;
-- -------------------------------------------------------------------------------------------------------------
			-- INGRESO DE CATALOGOS-
insert into catalogos(nombre_catalogo) values
('estado_avion') ,
 ('estado_piloto'),
 ('estado_puerta_embargue'),
 ('estado_equipaje') ,
 ('estado_vuelo'),
 ('estado_clase_servicio'),
 ('estado_cargo_tripulantes'); 
 select*from catalogos;
 desc catalogos;
-- -------------------------------------------------------------------------------------------------------------
			-- INGRESO DE ITEMS CATALOGOS--
insert into item_catalogos(nombre,catalogos_id) values
('activo'			,	1),
('mantenimiento'	,	1),
('fuera de servicio',	1),
('activo'			,	2),
('retirado'			,	2),
('abierto'			,	3),
('cerrado'			,	3),
('facturada'		,	4),
('extraviado'	,		4),
('entregado'	,		4),
('programado'	,		5),
('en vuelo'		,		5),
('retrasado'	,		5),
('cancelado'	,		5),
('primera clase'	,	6),
('business'		,		6),
('economica'	,		6),
('piloto'		,		7),
('copiloto'		,		7),
('asistente de vuelo',	7);

select*from item_catalogos;
select i.nombre,c.nombre_catalogo
from catalogos as c
inner join item_catalogos as i
on c.id=i.catalogos_id
where nombre_catalogo='estado_avion';


		
-- ---------------------------------------------------------------------------------------
			-- INGRESO DE EQUIPAJES--
insert into equipajes(etiqueta, peso,dimension,equipaje_id) values
( 'MED000569',10.00,'35X55X25',8),
( 'MAN000593',23.00,'30X40X15',9),
( 'GRAN00057',18.20,'35X25X55',10);

select ic.nombre as estado, e.etiqueta, e.peso,e.dimension
from equipajes as e
join item_catalogos as ic on ic.id=e.equipaje_id
where peso=10;

select*from equipajes;

-- ---------------------------------------------------------------------------------------
			-- INGRESO DE PASAJEROS--
select*from pasajeros;
insert into pasajeros(cedula,nombre,apellido,edad,correo,telefono,equipaje1_id) values
('1234567890', 'Mateo','Torres', 16,'mateotorres@gmail.com','0952647894'		,1 ),
('1736185107', 'Ithan','Camacho', 28, 'ithancamacho@hotmail.com','0987654321'	,2),
('1795195107', 'Richard','Soria', 37,'richardsoria@yahoo.es','0987654322'		,3) ,
('1736635219', 'Carlos ','Perez', 65, 'carlosperez@hotmail.com','0987654323'	,1),
('1755195317', 'Adrian','Ramos', 29, 'adrianramos@gmail.com','0987654324'		,2), -- 1
('1726395709', 'Adrian','Cadena', 33, 'adrian123@yahoo.es','0987654325'			,3), -- 2
('1736492203', 'Paul','Cabrera', 26, 'paul_Cabrera@hotmail.com','0987654326'	,3),
('1826152241', 'Mireya ','Garcia', 28, 'mireya_Garcia@gmail.com','0987654327'	,2),
('3300010840', 'Sofia','Gonzalez', 27, 'sofia_gonzalez@yahoo.es','0987654328'	,1),
('0338943111', 'Miguel ','Ramos', 35, 'miguel_ramos@yahoo.es','0987654329'		,1),
('3989134597', 'Mireya','Gonzalez', 15, 'mireya_gonzalezi@gmail.com','0987654310',1),
('6613419590', 'Adrian ','Ramos', 46, 'ithan123@hotmail.com','0987654311'		,2), -- 3
('6944649165', 'Miguel','Camacho', 37, 'miguel123@yahoo.es','0987754312'		,2),
('3342166849', 'Juan','Cabrera', 27, 'juan123@gmail.com','0987754313'			,3),
('1715353271', 'Lucia','Gonzalez', 54, 'Lucia123@hotmail.com','0987754314'		,1),
('0052717064', 'Miguel','Astudillo', 18, 'miguel-astudillo@yahoo.es','0987754315',2),
('5447931325', 'Miguel','Lopez', 23, 'miguel-lopez123@gmail.com','0987654316'	,1),
('1372137650', 'Adrian ','Lopez', 54, 'adrianlopeZ963@hotmail.com.com','0987654317',3), -- 4
('6000263486', 'Adrian','Cadena', 20, 'adriancadena963@yahoo.es','0988654318'	,3),    -- 5
('8840211992', 'Sofia','Cabrera', 19, 'ithancamacho123@gmail.com','0988654319'	,2),
('7716619596', 'Miguel ','Cadena', 23, 'miguelcadena123@hotmail.com','0988654320',1),
('7415178323', 'Paul','Sanchez', 44, 'paulSanchez123@yahoo.es','0987654393'		,2),
('6196022548', 'Mateo ','Torres', 16, 'mateo123@gmail.com','0987654321'			,3);



select p.cedula,concat(p.nombre,' ',p.apellido) as nombres, p.correo,e.peso,ic.nombre
from equipajes as e
join item_catalogos as ic on ic.id=e.equipaje_id
join pasajeros as p on p.equipaje1_id=e.id;

-- agregamos una nueva tabla 
ALTER TABLE pasajeros ADD cedula_encriptado VARBINARY(255);
ALTER TABLE pasajeros ADD cedula_desencriptada VARCHAR(255);

-- encriptacion de datos
UPDATE pasajeros SET cedula_encriptado = AES_ENCRYPT(cedula, 'encriptado');
UPDATE pasajeros SET cedula_desencriptada = CAST(AES_DECRYPT(cedula_encriptado, 'encriptado') AS CHAR);

-- verificamos la encriptacion
select*from pasajeros;
-- recordadndo
-- es un tipo de dato que se utiliza para almacenar grandes cantidades de información binaria, 
-- como imágenes, audio, video o documentos.
-- ---------------------------------------------------------------------------------------
			-- INGRESO DE TRIPULANTES--
insert into tripulantes(identificacion_unico,nombre,certificacion,estado_cargo_id) values
('0677201110', 'Luis Garcia', 'Aviacion-COPEC'			,20),
('1269272579', 'Carlos Martinez','Aviation-New Zeland'  ,20),
('3855491449', 'Luis Garcia', 'FrancAviant'				,19),
('5340478369', 'Ithan Rodriguez','Aviacion-COPEC'		,18),
('3124868439', 'Mateo Cadena', 'AeroePort'				,18),
('4991200876', 'Carlos Cabrera','Aviacion-Select'		,20),
('5738355070', 'Mateo Torres','Aviacion-Select'			,19),
('6510509736', 'Carlos Soria', 'Aviacion-IMPROV'		,18);

select*from tripulantes;

select t.nombre as tripulante, ic.nombre as cargo
from tripulantes as t
join item_catalogos as ic on ic.id=t.estado_cargo_id;

-- ---------------------------------------------------------------------------------------
			-- INGRESO DE PILOTOS--
insert into pilotos(licencia ,nacionalidad ,horas_vuelo ,estado_piloto,tripulantes_id)values
('EC-2024-QUIT-REC','Ecuatoriano',248,4,4),
('EE.UU-2018-SPN-REC','Estadounidense',320,5,5),
('FR-2016-LON-REC','Frances',200,4,8),
('EC-2022-QUIT-REC','Ecuatoriano',195,4,5),
('EC-2018-GYL-REC','Ecuatoriano',320,5,4),
('FR-2015-LON-REC','Frances',450,4,8);
select*from pilotos;


-- ---------------------------------------------------------------------------------------
			-- INGRESO DE PAISES--
insert into paises(nombre) values
('Ecuador'),
('Mexico'),
('Francia'),
('China'),
('Corea del Sur'),
('España');

-- ---------------------------------------------------------------------------------------
			-- INGRESO DE CIUDADES--
insert into ciudades(nombre,pais_id) values
('Quito',1),
('Ciudad de Mexico',2),
('Londres',3),
('Pekin',4),
('Seul',5),
('Madrid',6);

select*from paises;
select*from ciudades;
-- ---------------------------------------------------------------------------------------
			-- INGRESO DE AEROPUERTOS--
insert into aeropuertos(nombre,ciudad_id)values
('aeropuerto internacional Mariscal Sucre',		1),
('aeropuerto internacional Ciudad de Mexico',	2),
('Aeropuerto de Heathrow ',						3),
('Aeropuerto Internacional de Pekín-Daxing',	4),
('Aeropuerto Internacional de Incheon',			5),
('aeropuerto  Adolfo Suárez Madrid-Barajas ',	6);

select p.nombre,c.nombre,a.nombre
from aeropuertos as a
inner join paises as p on p.id=a.id
inner join ciudades as c on p.id=c.id;

select*from aeropuertos;
-- ---------------------------------------------------------------------------------------
			-- INGRESO DE AEROLINEAS--
insert into aerolineas(nombre ,codigo, pais1_id,frecuencia_vuelo,codigo_IATA, aeropuerto_id) values
('Tame','ECU789E-0',1,'diario','EC',1),
('VivaAerobus','MEX789X-0',2,'diario','MEX',2),
('Air France','LHR233R-0',3,'semanal','LHR',3),
('AirAsia','PKX569X-0',4,'semanal','PKX',4),
('Asiana Airlines','ICN000N-0',5,'semanal','ICN',5),
('Iberia','MAD5005X-0',6,'diario','MAD',6);

select*from aerolineas;

select p.nombre,c.nombre,a.nombre,ae.nombre,ae.codigo,ae.frecuencia_vuelo,ae.codigo_IATA
from aeropuertos as a
inner join paises as p on p.id=a.id
inner join ciudades as c on p.id=c.id
inner join aerolineas as ae on c.id=ae.id;

-- ---------------------------------------------------------------------------------------
			-- INGRESO DE VUELOS--
            
-- la distancia esta dada en kilometros
-- la duracion esta dada en hora
-- 11 al 14
insert into vuelos(numero_vuelo,duracion_vuelo,distancia_recorrida ,aeropuerto_origen,aeropuerto_destino,aerolinea_id ,estado_vuelo1_id)
values				(1,15,32346.26,1,6,1,11),
					(23,16,18789.03,2,1,4,12),
					(15,8,26698.35,3,5,3,13),
					(78,32,21649.60,4,2,2,14),
					(34,10,19517.02,5,3,6,12),
					(79,8,74136.56,6,1,2,11),
					(2,6,35795.15,2,4,5,14);

select*from vuelos;
select v.numero_vuelo,v.duracion_vuelo,v.distancia_recorrida ,v.aeropuerto_destino,
	ae.nombre,aero.nombre,ic.nombre
    from aeropuertos as ae
    inner join vuelos as v on ae.id=v.aeropuerto_origen
    inner join aerolineas as aero on v.aerolinea_id=aero.id
    inner join item_catalogos as ic on ic.id=v.estado_vuelo1_id;

-- ---------------------------------------------------------------------------------------
			-- INGRESO DE VUELOS--
insert into embargues(numero_puerta,terminal,vuelo_id,estado_puerta_id,persona_id) values
					(17,'salida',1,6,1),
					(18,'llegada',2,7,2),
					(17,'salida',3,7,3),
					(18,'salida',4,6,4),
					(17,'llegada',5,6,5),
                    (17,'salida',6,6,6),
					(18,'llegada',7,7,7),
					(17,'salida',1,7,8),
					(18,'salida',2,6,9),
					(17,'llegada',3,6,10),
                    (17,'salida',4,6,11),
					(18,'llegada',5,7,12),
					(17,'salida',6,7,13),
					(18,'salida',7,6,14),
					(17,'llegada',1,6,15),
                    (17,'salida',2,6,16),
					(18,'llegada',3,7,17),
					(17,'salida',4,7,18),
					(18,'salida',5,6,19),
					(17,'llegada',6,6,20);

select e.numero_puerta,e.terminal,ic.nombre as puerta,concat(p.nombre,' ',p.apellido) as pasajero
from embargues as e
inner join pasajeros as p on e.id=p.id
inner join item_catalogos as ic on ic.id=e.estado_puerta_id;

select*from vuelos;
-- ---------------------------------------------------------------------------------------
			-- INGRESO DE AVIONES--
insert into aviones( matricula,modelo ,capacidad,fabricante ,ano_fabricacion,piloto_id ,aerolinea_id ,vuelo_id,estado_avion_id ) values
('XA-TEX', 'Airbus A320',220,'Airbus','2000-12-01',1,6,1,2),
('XB-TIJ', 'Boeing 737',600,'Boeing','2002-11-12',2,5,2,3),
('XC-MZT', 'Boeing 777',550,'Boeing','2004-03-05',3,4,3,1),
('XD-GDL', 'Airbus A350',350,'Airbus','2005-01-29',4,3,4,1),
('XE-PBC', 'Boeing 787 Dreamliner',400,'Boeing','2006-06-13',5,2,5,2),
('XF-CUN', 'Airbus A380',450,'Airbus','2007-02-16',6,1,6,3),
('XG-MID', 'Boeing 747',320,'Boeing','2008-02-16',1,1,7,1),
('XH-VER', 'Bombardier CRJ Series',80,'ATR','2009-04-12',2,2,1,2),
('XI-AGU', 'ATR 72',120,'ATR','2009-05-28',3,3,2,3),
('XJ-MTY', 'Airbus A320',220,'Airbus','2009-06-02',4,4,3,3),
('XK-TLC', 'Boeing 737',600,'Boeing','2009-07-28',5,5,4,1),
('XL-BJX', 'Boeing 777',550,'Boeing','2009-08-05',6,6,5,1),
('XM-QRO', 'Airbus A350',350,'Airbus','2014-09-14',6,6,6,1),
('XN-SLP', 'Boeing 787 Dreamliner',400,'Boeing','2015-10-11',5,1,7,2),
('XP-CUL', 'Airbus A380',450,'Airbus','2016-01-01',4,2,1,2),
('XQ-MML', 'Boeing 747',320,'Boeing','2017-01-25',3,3,2,2),
('XR-CUU', 'Airbus A320',220,'Airbus','2017-05-05',2,4,3,2),
('XS-CLQ', 'Boeing 737',600,'Boeing','2019-08-26',1,5,4,3),
('XT-HMO', 'Boeing 777',550,'Boeing','2020-02-14',6,6,5,1),
('XU-LAP', 'Airbus A350',350,'Airbus','2021-12-05',3,5,6,1);

select*from aviones;

-- ---------------------------------------------------------------------------------------
			-- INGRESO DE AVIONES--
insert into reservas(numero_reserva,precio,estado_reserva_id,pasajero2_id ,embargue_id ,vuelo2_id)
		values			(3, 420.75,15,1,1,7);
 
 insert into reservas(numero_reserva,precio,estado_reserva_id,pasajero2_id ,embargue_id ,vuelo2_id)
		values			(4, 400.75,15,20,2,6),
						(2, 420.75,15,19,3,5),
						(1, 200.03,16,18,4,4),
						(6, 850.00,17,17,5,3),
						(5, 300.89,16,16,6,2),
						(3, 978.35,15,15,7,1);
                    
select*from reservas;


-- --------------------------------------------------------------
			-- CREANDO INDEX
use aerolineas;
CREATE INDEX index_nombre ON pasajeros (nombre);

-- verificando
SHOW INDEX FROM pasajeros WHERE Key_name = 'index_nombre';

show index from pasajeros;

-- consultando
SELECT * FROM pasajeros WHERE nombre = 'Adrian';








            
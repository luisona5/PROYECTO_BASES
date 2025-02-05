use aerolineas;

-- CREACION DE ROLES
create user 'Aerolineas'@'localhost' identified by '1234';
create user 'Administrador'@'localhost' identified by 'administrador';
create user 'Usuario'@'localhost' identified by 'usuario';
create user 'Auditoria'@'localhost' identified by 'auditoria';


-- verificacion de los usuarios creados 
select*from mysql.user;

-- roles a cada usuario
-- el administrador podra hacer todo(leer,eliminar,actualizar)
grant all privileges on aerolineas.* to 'Administrador'@'localhost';
flush privileges;

-- el usuario solo podra ver y leer
grant select on aerolineas.* to 'Usuario'@'localhost';
flush privileges;

grant select, insert, update on aerolineas.* to 'Auditoria'@'localhost';



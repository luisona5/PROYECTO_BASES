-- --------------------------------CIFRADO DE DATOS--------------------

-- ENCRIPTACION DE DATOS
-- agregamos una nueva tabla 
alter table  pasajeros ADD cedula_encriptado VARBINARY(255);
UPDATE pasajeros SET cedula_encriptado = AES_ENCRYPT(cedula, 'encriptado');


-- para la desencriptacion de datos
ALTER TABLE pasajeros ADD cedula_desencriptada VARCHAR(255);
UPDATE pasajeros SET cedula_desencriptada = CAST(AES_DECRYPT(cedula_encriptado, 'encriptado') AS CHAR);
-- --------------------------------------------------------------
			-- CREANDO INDEX
use aerolineas;
CREATE INDEX index_nombre ON pasajeros (nombre);

-- verificando
SHOW INDEX FROM pasajeros WHERE Key_name = 'index_nombre';

show index from pasajeros;

-- consultando
SELECT * FROM pasajeros WHERE nombre = 'Adrian';

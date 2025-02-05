	
-- verificar si esta encendido
SHOW GLOBAL VARIABLES LIKE 'general_log';


set global general_log='on';

select*from mysql.general_log
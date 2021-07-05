CREATE OR REPLACE FUNCTION
generar_contraseña()
RETURNS void AS $$ 

DECLARE
clave RECORD ;

BEGIN
    IF NOT EXISTS(SELECT * FROM information_schema.COLUMNS WHERE COLUMN_NAME = 'contraseña' AND TABLE_NAME='usuarios_web') THEN
    ALTER TABLE usuarios_web ADD COLUMN contraseña varchar(4);
    END IF; 

    UPDATE usuarios_web
    SET usuarios_web.contraseña = query.clave
    FROM (SELECT SUBSTRING(rut,1,4) as clave FROM usuarios_web) AS query; 
END

$$ language plpgsql
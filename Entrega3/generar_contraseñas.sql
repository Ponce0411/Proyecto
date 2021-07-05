CREATE PROCEDURE
generar_contraseña()
BEGIN
IF NOT EXISTS(
    SELECT * FROM information_schema.COLUMNS
    WHERE COLUMN_NAME = 'contraseña' AND TABLE_NAME='usuarios_web'
)
THEN
ALTER TABLE 'usuarios_web' ADD COLUMN 'contraseña' varchar(4) NOT NULL default '';
END IF; 

UPDATE usuarios_web
SET contraseña = clave
FROM (SELECT SUBSTRING(rut,1,4) as clave
                          FROM usuarios_web
                          ) 
END;

$$ language plpgsql
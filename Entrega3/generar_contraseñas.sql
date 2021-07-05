CREATE OR REPLACE FUNCTION
generar_contraseña()
RETURNS void AS $$ 

BEGIN
    IF NOT EXISTS(SELECT * FROM information_schema.COLUMNS WHERE COLUMN_NAME = 'contraseña' AND TABLE_NAME='usuarios_web') THEN
    ALTER TABLE usuarios_web ADD COLUMN contraseña varchar(4);
    END IF; 

    UPDATE usuarios_web
    SET contraseña = SUBSTRING(rut,1,4);
END

$$ language plpgsql
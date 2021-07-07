CREATE OR REPLACE FUNCTION
generar_contraseña()
RETURNS void AS $$ 

BEGIN
    IF NOT EXISTS(SELECT * FROM information_schema.COLUMNS WHERE COLUMN_NAME = 'contraseña' AND TABLE_NAME='usuarios') THEN
    ALTER TABLE usuarios ADD COLUMN contraseña varchar(100);
    END IF;

    UPDATE usuarios
    SET contraseña = SUBSTRING(rut,1,4);
END

$$ language plpgsql
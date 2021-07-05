CREATE OR REPLACE FUNCTION
cambiar_contraseña(Rut varchar, clave varchar)
RETURNS void AS $$

BEGIN

    UPDATE usuarios_web
    SET contraseña = clave
    WHERE rut = Rut;
    
END

$$ language plpgsql
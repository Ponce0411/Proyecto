CREATE OR REPLACE FUNCTION
cambiar_contraseña(verificador varchar, clave varchar)
RETURNS void AS $$

BEGIN

    UPDATE usuarios_web
    SET contraseña = clave
    WHERE rut = verificador;
    
END

$$ language plpgsql
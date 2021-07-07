CREATE OR REPLACE FUNCTION
pico()
RETURNS void AS $$

DECLARE
tupla RECORD ;

BEGIN
    FOR tupla IN (SELECT direcciones.id as id1, usuarios_web.id as id2 FROM direcciones, usuarios_web WHERE usuarios_web.direccion = direcciones.nombre)


    LOOP

    IF tupla.id2 NOT IN (SELECT direccion_usuarios.usuario_id FROM direccion_usuarios) AND tupla.id1 NOT IN (SELECT direccion_usuarios.direccion_id FROM direccion_usuarios) THEN

    INSERT INTO direccion_usuarios VALUES(tupla.id1, tupla.id2);
    
    END IF;

    END LOOP;

END

$$ language plpgsql
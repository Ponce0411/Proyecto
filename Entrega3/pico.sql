CREATE OR REPLACE FUNCTION
pico()
RETURNS void AS $$

DECLARE
tupla RECORD ;

BEGIN
    FOR tupla IN (SELECT direcciones.id, usuarios_web.id FROM direcciones, usuarios_web WHERE usuarios_web.direccion = direcciones.nombre AS f(id1 int, id2 int))


    LOOP

    IF tupla.id2 NOT IN (SELECT direccion_usuarios.usuario_id FROM direccion_usuarios) AND tupla.id1 NOT IN (SELECT direccion_usuarios.direccion_id FROM direccion_usuarios) THEN

    INSERT INTO direccion_usuarios VALUES(tupla.id1, tupla.id2);
    
    END IF;

    END LOOP;

END

$$ language plpgsql
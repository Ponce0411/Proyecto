CREATE OR REPLACE FUNCTION
pico()
RETURNS void AS $$

DECLARE
tupla RECORD ;

BEGIN
    FOR tupla IN (SELECT direcciones.id as id1, usuarios_web.id as id2 FROM direcciones, usuarios_web 
    WHERE usuarios_web.direccion = direcciones.nombre)


    LOOP

    IF tupla.id2 NOT IN (SELECT direccion_usuarios_web.usuario_id FROM direccion_usuarios_web) AND tupla.id1 NOT IN (SELECT direccion_usuarios_web.direccion_id FROM direccion_usuarios_web) THEN

    INSERT INTO direccion_usuarios_web VALUES(tupla.id1, tupla.id2);
    
    END IF;

    END LOOP;

END

$$ language plpgsql
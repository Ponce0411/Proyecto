CREATE OR REPLACE FUNCTION
generar_compra(pid int, tid int, uwid)
RETURNS void AS $$

DECLARE
maximo INT ;
did INT ;

BEGIN

    SELECT INTO maximo
    MAX(compras_web.id)
    FROM compras_web;

    SELECT INTO did
    MAX(direccion_usuarios_web.direccion_id)
    FROM direccion_usuarios_web 
    WHERE direccion_usuarios_web.usuario_id = uwid;

    IF pid IN (SELECT productos_en_tienda.producto_id FROM productos_en_tienda WHERE productos_en_tienda.tienda_id = tid) THEN
    INSERT INTO compras_web VALUES(maximo+1, uwid, did, tid);
    END IF;

END

$$ language plpgsql
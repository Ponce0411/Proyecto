CREATE OR REPLACE FUNCTION
generar_compra(pid int, uwid int, did int, tid int, cant int)
RETURNS void AS $$

DECLARE
maximo INT ;

BEGIN

    SELECT INTO maximo
    MAX(compras_web.id)
    FROM compras_web;

    IF pid IN (SELECT productos_en_tienda.producto_id FROM productos_en_tienda WHERE productos_en_tienda.tienda_id = tid) THEN
    INSERT INTO compras_web VALUES(maximo+1, uwid, did, tid);
    INSERT INTO productos_en_compra VALUES(maximo+1, did, cant);
    END IF;

END

$$ language plpgsql
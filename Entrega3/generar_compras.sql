CREATE OR REPLACE FUNCTION
generar_compra(cid int, pid int, uwid int, did int, tid int, cant int)
RETURNS void AS $$

BEGIN

    IF pid IN (SELECT productos_en_tienda.producto_id FROM productos_en_tienda WHERE productos_en_tienda.tienda_id = tid) THEN
    INSERT INTO compras_web VALUES(cid, uwid, did, tid, '07-07-2021');
    INSERT INTO productos_en_compra VALUES(cid, did, cant);
    END IF;

END

$$ language plpgsql
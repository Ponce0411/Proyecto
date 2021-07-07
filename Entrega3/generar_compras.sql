CREATE OR REPLACE FUNCTION
generar_compra(cid int, pid int, uwid int, did int, tid int, cant int, fecha varchar)
RETURNS void AS $$

BEGIN

    IF pid IN (SELECT productos_en_tienda.producto_id FROM productos_en_tienda WHERE productos_en_tienda.tienda_id = tid) AND cid IN (SELECT id FROM compras) THEN
    INSERT INTO productos_en_compra VALUES(cid, pid, cant);
    END IF;
    

    IF pid IN (SELECT productos_en_tienda.producto_id FROM productos_en_tienda WHERE productos_en_tienda.tienda_id = tid) AND cid NOT IN (SELECT id FROM compras) THEN
    INSERT INTO compras VALUES(cid, uwid, did, tid, fecha);
    INSERT INTO productos_en_compra VALUES(cid, pid, cant);
    END IF;

END

$$ language plpgsql
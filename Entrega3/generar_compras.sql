CREATE OR REPLACE FUNCTION
generar_compra(cid int, pid int, uwid int, did int, tid int, cant int)
RETURNS void AS $$

DECLARE

funcion date;
fecha_actual varchar;

BEGIN

    SELECT INTO funcion GETDATE();

    SELECT INTO fecha_actual CONVERT(varchar, funcion);

    IF pid IN (SELECT productos_en_tienda.producto_id FROM productos_en_tienda WHERE productos_en_tienda.tienda_id = tid) THEN
    INSERT INTO compras VALUES(cid, uwid, did, tid,SUBSTRING(fecha_actual,1,10);
    INSERT INTO productos_en_compra VALUES(cid, did, cant);
    END IF;

END

$$ language plpgsql
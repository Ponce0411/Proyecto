CREATE OR REPLACE FUNCTION
Listado_Enguels()
RETURNS void AS $$

DECLARE
tupla_compra RECORD ;

BEGIN

    IF NOT EXISTS(SELECT * FROM information_schema.COLUMNS WHERE COLUMN_NAME = 'fecha' AND TABLE_NAME='compras') THEN
    ALTER TABLE compras ADD COLUMN fecha date;
    END IF; 

    FOR tupla_compra IN (SELECT * FROM public.dblink('dbname=grupo48e3 
    port=5432
    password=tuckathomas123
    user=grupo48','SELECT despachos.compra_id, despachos.fecha FROM despachos') AS f(id_compra int, fecha date))

    LOOP

    UPDATE compras
    SET fecha = tupla_compra.fecha
    WHERE id = tupla_compra.id_compra;

    END LOOP;

END

$$ language plpgsql 
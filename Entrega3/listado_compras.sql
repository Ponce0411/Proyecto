CREATE OR REPLACE FUNCTION
listado_compra()
RETURNS void AS $$

DECLARE
tupla_compra RECORD ;

BEGIN
    FOR tupla_compra IN (SELECT * FROM public.dblink('dbname=grupo48e3 
    port=5432
    password=tuckathomas123
    user=grupo48','SELECT despachos.id_compra, despachos.fecha FROM despachos') AS f(id_compra int, fecha date))

    IF NOT EXISTS(SELECT * FROM information_schema.COLUMNS WHERE COLUMN_NAME = 'fecha' AND TABLE_NAME='compras') THEN
    ALTER TABLE compras ADD COLUMN fecha date;
    END IF; 

END

$$ language plpgsql 
CREATE OR REPLACE FUNCTION
insertar_usuarios(id INT)
RETURNS void AS $$

DECLARE
tupla_compra RECORD ;

BEGIN
    FOR tupla_compra IN (SELECT * FROM public.dblink('dbname=grupo48e3 
    port=5432
    password=tuckathomas123
    user=grupo48','SELECT despacho.id_compra, despacho.fecha FROM despacho') AS f(id_compra int, fecha date)

    IF NOT EXISTS(SELECT * FROM information_schema.COLUMNS WHERE COLUMN_NAME = 'fecha' AND TABLE_NAME='compras') THEN
    ALTER TABLE compras ADD COLUMN fecha date;
    END IF; 

    UPDATE compras
    SET fecha = tupla_compra.fecha
END

$$ language plpgsql 
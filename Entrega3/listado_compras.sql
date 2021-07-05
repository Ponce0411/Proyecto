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

    SELECT INTO 
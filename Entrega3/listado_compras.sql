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

    SELECT compras.id, tiendas.nombre, direcciones.nombre, tupla_compra.fecha FROM compras, tiendas, direcciones, tupla_compra
    WHERE compras.tienda_id = tiendas.id 
    AND compras.direccion_id = direcciones.id
    AND compras.id = tupla_compra.id_compra
    AND compras.usuario_id = id
    ORDER BY tupla_compra.fecha;
CREATE OR REPLACE FUNCTION
agregar_direcciones()
RETURNS void AS $$

DECLARE
Direcciones RECORD ;

BEGIN
    CREATE TABLE usuarios2 AS SELECT usuarios.id, usuarios.nombre, usuarios.rut, usuarios.edad, usuarios.sexo, direcciones.nombre FROM usuarios, direcciones, direccion_usuarios WHERE usuarios.id = direccion_usuarios.usuario_id AND direccion_usuarios.direccion_id = direcciones.id;

END

$$ language plpgsql
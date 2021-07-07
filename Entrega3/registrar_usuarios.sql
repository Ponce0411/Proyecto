CREATE OR REPLACE FUNCTION
registrar_usuarios(nombres varchar, verificador varchar, edad int, sexo varchar, direccion varchar, comunas varchar)
RETURNS void AS $$

DECLARE
maximo1 INT ;
maximo2 INT ;
id1 INT ;

BEGIN

    SELECT INTO maximo1
    MAX(usuarios_web.id) 
    FROM usuarios_web;

    SELECT INTO maximo2
    MAX(direcciones.id) 
    FROM direcciones;

    IF (verificador NOT IN (SELECT usuarios_web.rut FROM usuarios_web) AND NOT (direccion IN (SELECT direcciones.nombre FROM direcciones) 
    AND comunas IN (SELECT direcciones.comuna FROM direcciones))) THEN   
    INSERT INTO direcciones VALUES(maximo2+1,direccion,comunas);
    INSERT INTO direccion_usuarios_web VALUES(maximo2+1, maximo1+1)
    INSERT INTO usuarios_web VALUES(maximo1+1,nombres,verificador,edad,sexo,direccion,SUBSTRING(verificador,1,4));
    END IF;

    IF (verificador NOT IN (SELECT usuarios_web.rut FROM usuarios_web)) AND (direccion IN (SELECT direcciones.nombre FROM direcciones) 
    AND comunas IN (SELECT direcciones.comuna FROM direcciones))) THEN 
    SELECT INTO id1
    id FROM direcciones WHERE direcciones.nombre = direccion AND direcciones.comuna = comunas; 
    INSERT INTO usuarios_web VALUES(maximo1+1,nombres,verificador,edad,sexo,direccion,SUBSTRING(verificador,1,4));
    INSERT INTO direccion_usuarios_web VALUES(id1, maximo1+1)
    END IF;

END

$$ language plpgsql
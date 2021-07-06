CREATE OR REPLACE FUNCTION
registrar_usuarios(nombre varchar, verificador varchar, edad int, sexo varchar, direccion varchar, comuna varchar)
RETURNS void AS $$

DECLARE
maximo1 INT ;
maximo2 INT ;

BEGIN

    SELECT INTO maximo1
    MAX(usuarios_web.id) 
    FROM usuarios_web;

    SELECT INTO maximo2
    MAX(direcciones.id) 
    FROM direcciones;

    IF (verificador NOT IN (SELECT usuarios_web.rut FROM usuarios_web)) THEN   
    INSERT INTO usuarios_web VALUES(maximo1+1,nombre,verificador,edad,sexo,direccion,SUBSTRING(verificador,1,4));
    END IF;

    IF (verificador NOT IN (SELECT usuarios_web.rut FROM usuarios_web) AND NOT (direccion IN (SELECT direcciones.nombre FROM direcciones) 
    AND comuna IN (SELECT direcciones.comuna FROM direcciones))) THEN   
    INSERT INTO direcciones VALUES(maximo2+1,direccion,comuna);
    END IF;

END

$$ language plpgsql
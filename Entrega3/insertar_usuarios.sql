CREATE OR REPLACE FUNCTION
insertar_usuarios()
RETURNS void AS $$

DECLARE
tupla_persona2 RECORD ;
maximo INT ;

BEGIN
    FOR tupla_persona2 IN (SELECT * FROM public.dblink('dbname=grupo48e3 
    port=5432
    password=tuckathomas123
    user=grupo48','SELECT personal.id, personal.nombre,personal.rut,personal.edad,personal.sexo,personal.clasificación,lugares.direccion
    FROM personal, unidades, lugares, trabaja_en WHERE trabaja_en.personal_id=personal.id AND trabaja_en.uid = unidades.id AND unidades.did = lugares.id') AS f(id int, nombre varchar, rut varchar, edad int, sexo varchar, clasificación varchar, direccion varchar))
    

    LOOP

    SELECT INTO maximo
    MAX(usuarios_web.id) 
    FROM usuarios_web;
    IF (tupla_persona2.rut NOT IN (SELECT usuarios.rut FROM usuarios_web) AND tupla_persona2.clasificación = 'administracion') THEN   
    INSERT INTO usuarios_web VALUES(maximo+1,tupla_persona2.nombre,tupla_persona2.rut,tupla_persona2.edad,tupla_persona2.sexo,tupla_persona2.direccion);
    END IF;

    END LOOP;

END

$$ language plpgsql
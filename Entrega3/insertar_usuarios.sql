CREATE OR REPLACE FUNCTION
insertar_usuarios()
RETURNS void AS $$

DECLARE
tupla_persona2 RECORD ;
maximo INT ;

BEGIN
    FOR tupla_persona2 IN (SELECT * FROM public.dblink("dbname=grupo48e3 
    port=5432
    password=tuckathomas123
    user=grupo48','SELECT personal.id, personal.nombre,personal.rut,personal.edad,personal.sexo
    FROM personal WHERE personal.clasificación = 'administracion'") AS f(id int, nombre varchar, rut int, edad int, sexo varchar))
    

    LOOP

    SELECT INTO maximo
    MAX(usuarios.id) 
    FROM usuarios;
    IF (tupla_persona2 NOT IN (SELECT * FROM usuarios)) THEN   
    INSERT INTO usuarios VALUES(maximo+1,tupla_persona2.nombre,tupla_persona2.rut,tupla_persona2.edad,tupla_persona2.sexo);
    END IF;

    END LOOP;

END

$$ language plpgsql
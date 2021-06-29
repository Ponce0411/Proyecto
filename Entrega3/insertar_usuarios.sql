CREATE OR REPLACE FUNCTION
insertar_usuarios()
RETURNS void AS $$

DECLARE
tupla_persona2 RECORD ;
maximo INT ;

BEGIN
    FOR tupla_persona2 IN (SELECT personal.id, personal.nombre,personal.rut,personal.sexo
    FROM public.dblink('dbname=grupo48e3 
    port=5432
    password=tuckathomas123
    user=grupo48','SELECT * FROM personal') AS f(id int, nombre varchar, rut int, sexo varchar) WHERE personal.clasificacion = 'administracion')
    

    LOOP

        SET (maximo = SELECT MAX(usuarios.id) FROM usuarios)

        IF tupla_persona2 NOT IN (SELECT * FROM usuarios) THEN
        
        INSERT INTO usuarios VALUES(maximo+1,tupla_persona2.nombre,tupla_persona2.rut,tupla_persona2.sexo);
    END LOOP;

END

$$ language plpgsql
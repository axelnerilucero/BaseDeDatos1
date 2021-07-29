USE colegio2409;

select * from salones;

select * from cursos;

select * from grados;

select * from niveles;

select * from salones, cursos;

select * from salones, cursos, grados, niveles
where salones.id_salon = 1 order by 1; -- id de curso aparece dos veces porque una es llave foranea
-- primer join
select * from salones s, cursos c 
WHERE s.id_curso = c.id_curso -- con este where ya es join
order by 1;

select s.id_salon, observaciones as salon, tipo_grupo, abreviatura curso
from salones s, cursos c 
WHERE s.id_curso = c.id_curso 
order by 1;

select s.id_salon, observaciones as salon, tipo_grupo, abreviatura curso
from salones s, cursos c 
WHERE s.id_curso = c.id_curso -- c porque es llame foranea, se pone para hacer referencia al nombre de la tabla 
AND abreviatura = '2017-2018'
order by 1;

select s.id_salon, observaciones as salon, tipo_grupo, abreviatura curso, g.nombre grado
from salones s, cursos c, grados g 
WHERE s.id_curso = c.id_curso -- c porque es llame foranea, se pone para hacer referencia al nombre de la tabla 
AND s.id_grado = g.id_grado
AND abreviatura = '2017-2018' -- filtrando a los de 2017-2018 y que sean de tercero
AND g.nombre = '3o'
AND  g.nombre = 'bachillerato'
order by 1;

-- Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'WHERE id_nivel IN(Select id_nivel from niveles)' at line 1

select s.id_salon, observaciones as salon, tipo_grupo, abreviatura curso, g.nombre grado, n.nombre nivel
from salones s, cursos c, grados g, niveles n
WHERE s.id_curso = c.id_curso -- c porque es llame foranea, se pone para hacer referencia al nombre de la tabla 
AND s.id_grado = g.id_grado
AND s.id_nivel = n.id_nivel
AND abreviatura = '2017-2018' -- filtrando a los de 2017-2018 y que sean de tercero
AND g.nombre = '3o'
order by 1;

select * from salones -- IN evalua que un campo este en una lista
WHERE id_nivel NOT IN(Select id_nivel from niveles);

select count(*) from alumnos;

select count(*) from pagos;

select * from pagos; 

select count(*) from alumnos, pagos, cursos;

select * from alumnos a, pagos p, cursos c
WHERE a.clave_alu = p.clave_alu
AND p.id_curso = c.id_curso;

select a.clave_alu, ap_paterno, ap_materno, a.nombre, pago, fecha_pago, abreviatura curso
from 
(select * from alumnos WHERE sexo = 'f') a, 
(select * from pagos WHERE pago >= 2000)p, cursos c
WHERE a.clave_alu = p.clave_alu
AND p.id_curso = c.id_curso
order by 2,3,4;

-- JOIN 28 de julio
select * from alumnos a
JOIN pagos p ON(a.clave_alu = p.clave_alu) -- ON igualar de llave primaria y froanea
JOIN cursos c ON (p.id_curso = c.id_curso)
order by 1;

select a.clave_alu, ap_paterno, ap_materno, a.nombre, pago, fecha_pago, abreviatura curso
from alumnos a
JOIN pagos p ON(a.clave_alu = p.clave_alu) -- ON igualar de llave primaria y froanea
JOIN cursos c ON (p.id_curso = c.id_curso)
order by 1;

select a.clave_alu, ap_paterno, ap_materno, a.nombre, pago, fecha_pago, abreviatura curso,
p.*, c.* -- hace referencia a todos los campos de esas tablas
from alumnos a
JOIN pagos p ON(a.clave_alu = p.clave_alu) -- ON igualar de llave primaria y froanea
JOIN cursos c ON (p.id_curso = c.id_curso)
order by 1;

-- ejemplo de berna
select * from alumnos a
JOIN pagos p ON(a.clave_alu = p.clave_alu) -- ON igualar de llave primaria y froanea
JOIN cursos c ON (p.id_curso = c.id_curso) 
WHERE sexo = 'f'
order by 1;

-- LEFT JOIN todos los alumnos
select a.clave_alu, ap_paterno, ap_materno, a.nombre, pago, fecha_pago, abreviatura curso,
p.*, c.* -- hace referencia a todos los campos de esas tablas
from alumnos a
LEFT JOIN pagos p ON(a.clave_alu = p.clave_alu) -- ON igualar de llave primaria y froanea
LEFT JOIN cursos c ON (p.id_curso = c.id_curso)
order by p.clave_alu; -- era uno pero asi se muestran todos los que estan en null

-- alumnos que no han pagado nada
select a.clave_alu, ap_paterno, ap_materno, a.nombre, pago, fecha_pago, abreviatura curso,
p.*, c.* -- hace referencia a todos los campos de esas tablas
from alumnos a
LEFT JOIN pagos p ON(a.clave_alu = p.clave_alu) -- ON igualar de llave primaria y froanea
LEFT JOIN cursos c ON (p.id_curso = c.id_curso)
WHERE p.clave_alu is null -- siempre llave foranea
order by p.clave_alu; -- era uno pero asi se muestran todos los que estan en null

select * from salones s
LEFT JOIN niveles n ON(s.id_nivel =n.id_nivel)
ORDER BY n.id_nivel; 

select * from salones s
LEFT JOIN niveles n ON(s.id_nivel =n.id_nivel)
WHERE n.id_nivel is null -- siempre llave foranea
ORDER BY n.id_nivel; 

-- RIGTH 
select * from salones s
RIGHT JOIN niveles n ON(s.id_nivel =n.id_nivel)
ORDER BY n.id_nivel; 

-- rigth con where
select * from salones s
RIGHT JOIN niveles n ON(s.id_nivel =n.id_nivel)
WHERE s.id_nivel is null
ORDER BY n.id_nivel; 

-- USING y NATURAL es con la llave primaria
select * from salones s
LEFT JOIN niveles n ON(s.id_nivel =n.id_nivel)
ORDER BY n.id_nivel; 

select * from salones s
JOIN niveles n USING(id_nivel); -- USING SOLO SI LAS LLAVES SON IGUALES(NOMBRE)

select * from salones s
LEFT JOIN niveles n USING(id_nivel); -- USING SOLO SI LAS LLAVES SON IGUALES(NOMBRE)

select * from salones s
LEFT JOIN niveles n USING(id_nivel) -- USING SOLO SI LAS LLAVES SON IGUALES(NOMBRE)
WHERE n.id_nivel is null;

select * from salones s
NATURAL JOIN niveles n; -- TAMBIEN SE DEBEN LLAMAR IGUAL LAS LLAVES

select * from salones s
NATURAL LEFT JOIN niveles n-- SOLO SI LAS LLAVES SON IGUALES(NOMBRE)
WHERE n.id_nivel is null;

-- LEFT JOIN todos los alumnos
select *
from alumnos a
NATURAL LEFT JOIN pagos p 
NATURAL LEFT JOIN cursos c; -- si son muchas tablas el NATURAL join puede ya no ubicar de buena manera las llaves

-- medio ejercicio 
SELECT a.clave_alu, concat_ws(' ', ap_paterno, ap_materno, a.nombre) -- funciones
alumno, 
npago, tpago, abreviatura -- vienen de tablas
from alumnos a
LEFT JOIN (  
select clave_alu, id_curso, count(pago) npago, sum(pago) tpago
from pagos
group by clave_alu, id_curso) p ON (a.clave_alu = p.clave_alu)
LEFT JOIN cursos USING(id_curso);


-- quitar los null
SELECT a.clave_alu, 
if(length(concat_ws(' ', ap_paterno, ap_materno, a.nombre)) >3,
	concat_ws(' ', ap_paterno, ap_materno, a.nombre), 
    'SIN DATO' -- funciones
)alumno, 
IFNULL(npago, 0) npago, IFNULL(tpago, 0) tpago, 
IFNULL(abreviatura, 'SIN DATO') curso -- vienen de tablas
from alumnos a
LEFT JOIN (  
select clave_alu, id_curso, count(pago) npago, sum(pago) tpago
from pagos
group by clave_alu, id_curso) p ON (a.clave_alu = p.clave_alu)
LEFT JOIN cursos USING(id_curso)
WHERE sexo = 'F';

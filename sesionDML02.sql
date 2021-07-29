SELECT sysdate();

SELECT database();

SELECT user();

select now(), database(), current_time(), current_date();

select 34*4, 67 + 100, 500/3;

select year(now()), day(now()), year(now()) * day(now());

select year(now()) as anio, day(now()) as dia, year(now()) * day(now()) as 'multiplicar dia por anio';

SELECT 'Hola mundo' saludo;

show tables;

select * from alumnos;

desc alumnos;


select clave_alu, nombre, ap_paterno paterno, curp
from alumnos;

select nombre from alumnos;

select nombre from alumnos ORDER BY nombre DESC;

select DISTINCT nombre from alumnos ORDER BY nombre;

select DISTINCT nombre, ap_paterno, ap_materno from alumnos ORDER BY nombre;

select DISTINCT clave_alu, nombre from alumnos order by nombre;

select DISTINCT sexo from alumnos;

select DISTINCT ciudad from alumnos order by ciudad;

select * from alumnos WHERE sexo = 'f'; 

select DISTINCT nombre 
from alumnos 
WHERE sexo = 'f'
ORDER BY nombre;

select DISTINCT nombre 
from alumnos 
WHERE sexo = 'f' AND ciudad = 'queretaro'
ORDER BY nombre;

select nombre 
from alumnos 
WHERE sexo = 'f' AND ciudad = 'queretaro'
ORDER BY nombre;

select nombre, ap_paterno, ap_materno 
from alumnos 
WHERE sexo = 'f' AND ciudad = 'queretaro'
ORDER BY nombre;

select clave_alu, nombre, ap_paterno, ap_materno 
from alumnos 
WHERE sexo = 'f' AND ciudad = 'queretaro'
ORDER BY nombre;

select clave_alu, nombre, ap_paterno, ap_materno, sexo, ciudad
from alumnos 
WHERE sexo = 'f' OR ciudad = 'queretaro'
ORDER BY nombre;

select sexo 
from alumnos 
GROUP BY sexo;

select count(*) from alumnos;

select sexo, count(*) nalumnos 
from alumnos 
GROUP BY sexo;

select ciudad, sexo, count(*) nalumnos 
from alumnos 
GROUP BY ciudad, sexo
ORDER BY ciudad;

select ciudad, sexo, count(*) nalumnos 
from alumnos 
WHERE ciudad = 'QUERETARO' OR ciudad = 'corregidora'
GROUP BY ciudad, sexo
ORDER BY ciudad;

select ciudad, count(*) nalumnos 
from alumnos 
GROUP BY ciudad
ORDER BY ciudad;

select ciudad, count(*) nalumnos 
from alumnos 
GROUP BY ciudad
ORDER BY 2 DESC;

select ciudad, count(*) nalumnos 
from alumnos 
GROUP BY ciudad
HAVING count(*) <= 10
ORDER BY 2 DESC;

select ciudad, count(*) nalumnos 
from alumnos 
WHERE sexo = 'f'
GROUP BY ciudad
HAVING count(*) <= 10
ORDER BY 2 DESC;

-- AXEL URIEL NERI LUCERO

select ciudad, count(*) nalumnos 
from alumnos 
WHERE sexo = 'f'
GROUP BY ciudad
HAVING count(*) <= 10
ORDER BY 2 DESC
LIMIT 5;


-- 25 de junio 

USE colegio2409;

select * from alumnos;

select * from pagos order by 1;

select * from pagos where clave_alu ='11030172' order by 1;

select * from alumnos where clave_alu = '11030172' order by 1;

select *
from alumnos a, pagos p
where
a.clave_alu = p.clave_alu -- tienen que ser las mismas
AND a.clave_alu = '11030172' 
order by 1;

-- Error Code: 1052. Column 'clave_alu' in where clause is ambiguous

select * from alumnos;

select * from ciudad;

select count(*), sum(peso), max(peso), min(peso), avg(peso) 
from alumnos;

select sexo, count(*) n_alu, sum(peso) suma_peso, max(peso) peso_maximo, 
min(peso) peso_minimo, avg(peso) promedio_peso 
from alumnos
where ciudad <> 'QUERETARO'
group by sexo
order by 4 ASC;

-- agruparlos por ciudad

select ciudad, count(*) n_alu, sum(peso) suma_peso, max(peso) peso_maximo, 
min(peso) peso_minimo, avg(peso) promedio_peso 
from alumnos
group by ciudad
order by 4 ASC;

-- LIMITAR PARA MOSTRAR LOS 10 CON MAS SUM(PESO) 
select ciudad, count(*) n_alu, sum(peso) suma_peso, max(peso) peso_maximo, 
min(peso) peso_minimo, avg(peso) promedio_peso 
from alumnos
group by ciudad
order by 3 DESC
LIMIT 10;

-- ordenar en orden alfabetico de la ciudad
select ciudad, count(*) n_alu, sum(peso) suma_peso, max(peso) peso_maximo, 
min(peso) peso_minimo, avg(peso) promedio_peso 
from alumnos
group by ciudad
order by 3 DESC, ciudad ASC
LIMIT 20, 10;

-- verlo por ciudad y por sexo
select ciudad, sexo, count(*) n_alu, sum(peso) suma_peso, max(peso) peso_maximo, 
min(peso) peso_minimo, avg(peso) promedio_peso 
from alumnos
group by ciudad, sexo
order by 3 DESC, ciudad ASC; 


-- filtrar por los que pesen menos de 50
select ciudad, sexo, count(*) n_alu, sum(peso) suma_peso, max(peso) peso_maximo, 
min(peso) peso_minimo, avg(peso) promedio_peso 
from alumnos
group by ciudad, sexo
having  avg(peso) > 50.00
order by 3 DESC, ciudad ASC; 


-- filtrar por los que pesen menos de 50 y solo sexos validos
select ciudad, sexo, count(*) n_alu, sum(peso) suma_peso, max(peso) peso_maximo, 
min(peso) peso_minimo, avg(peso) promedio_peso 
from alumnos
where sexo = 'f' or sexo = 'm'
group by ciudad, sexo
having  avg(peso) > 50.00
order by 3 DESC, ciudad ASC; 

-- aqui para pasar del peso dekilos a gramos
select ciudad, sexo, count(*) n_alu, sum(peso) suma_peso, max(peso) peso_maximo, 
min(peso) peso_minimo, avg(peso) promedio_peso, (avg(peso)* 1000) promedio_peso_gr 
from alumnos
where sexo <> ''
group by ciudad, sexo
having  avg(peso) > 50.00
order by 3 DESC, ciudad ASC; 

-- aqui para delimitar los decimales con el format
select ciudad, sexo, count(*) n_alu, sum(peso) suma_peso, max(peso) peso_maximo, 
min(peso) peso_minimo, avg(peso) promedio_peso, format((avg(peso)* 1000),2) promedio_peso_gr 
from alumnos
where sexo <> ''
group by ciudad, sexo
having  avg(peso) > 50.00 
order by 3 DESC, ciudad ASC; 

-- aqui para mostrar los pesos entre 50 y 59
select ciudad, sexo, count(*) n_alu, sum(peso) suma_peso, max(peso) peso_maximo, 
min(peso) peso_minimo, avg(peso) promedio_peso, format((avg(peso)* 1000),2) promedio_peso_gr 
from alumnos
where sexo <> ''
group by ciudad, sexo
having  avg(peso) > 50.00 AND avg(peso) <= 59.00
order by 3 DESC, ciudad ASC; 

select * from alumnos;

describe alumnos;


 -- alumnos que hicieron cambios en el 2017
select * from alumnos 
where 
(fedita >= '2017-01-01 00:00:00' AND 
fedita <= '2017-12-31 23:59:59')
AND sexo = 'f';


-- solamente alumnos que tienen valor en peso y estatura
select nombre, ap_paterno, ap_materno, peso, estatura, (peso/(estatura*estatura)) imc 
from alumnos
where 
(fedita >= '2017-01-01 00:00:00' AND 
fedita <= '2017-12-31 23:59:59')
AND sexo = 'f' AND (peso > 0 AND estatura > 0)
order by peso DESC;


-- 28 DE JUNIO
USE colegio2409;

select * from alumnos;

select * from alumnos WHERE direccion = 'NULL';
-- aqui los que tienen 0
select * from alumnos WHERE peso = 'NULL';
-- evaluamos los que son nulos
select * from alumnos WHERE peso is NULL;

select * from alumnos WHERE peso IS NOT NULL;

select * from alumnos WHERE NOT peso is NULL;

select * from alumnos WHERE NOT sexo = 'f';

select nombre, ap_paterno, ap_paterno, peso, estatura 
FROM alumnos
order by peso DESC, estatura DESC;

-- filtrar con dos condiciones
select nombre, ap_paterno, ap_paterno, peso, estatura 
FROM alumnos
WHERE peso >= 90 AND peso <= 100
order by peso DESC, estatura DESC;

-- evaluar un rango
select nombre, ap_paterno, ap_paterno, peso, estatura 
FROM alumnos
WHERE peso BETWEEN 90 AND 100
order by peso DESC, estatura DESC;

-- evaluar ALGO EXCEPTO LO DE un rango
select nombre, ap_paterno, ap_paterno, peso, estatura 
FROM alumnos
WHERE NOT peso BETWEEN 90 AND 100
order by peso DESC, estatura DESC;

select nombre, ap_paterno, ap_paterno, peso, estatura 
FROM alumnos
WHERE nombre BETWEEN 'OMAR' AND 'PEDRO'
order by nombre;

select nombre, ap_paterno, ap_paterno, peso, estatura 
FROM alumnos
WHERE nombre = 'PEDRO'
order by nombre;

select nombre, ap_paterno, ap_paterno, peso, estatura 
FROM alumnos
WHERE nombre BETWEEN 'FES' AND 'PATITO 23'
order by nombre;

select nombre, ap_paterno, ap_paterno, peso, estatura 
FROM alumnos
WHERE NOT nombre BETWEEN 'FES' AND 'PATITO 23'
order by nombre;

select nombre, ap_paterno, ap_paterno, peso, estatura, fedita 
FROM alumnos
WHERE nombre BETWEEN 'FES' AND 'PATITO 23'
order by nombre;

-- seleccionar entre datos
select nombre, ap_paterno, ap_paterno, peso, estatura, fedita 
FROM alumnos
WHERE fedita BETWEEN '2016-07-01 00:00:00' AND '2016-12-31 23:59:59'
order by fedita;
-- encontrar a las personas con esos nombres
select nombre, ap_paterno, ap_paterno, peso, estatura, fedita 
FROM alumnos
WHERE nombre = 'MARIANA' OR nombre = 'GABRIELA' OR nombre = 'PAMELA'
OR nombre = 'CAROLINA' or nombre = 'LUCIA'
order by nombre;

select nombre, ap_paterno, ap_paterno, peso, estatura, fedita 
FROM alumnos
WHERE nombre IN ('MARIANA', 'GABRIELA','PAMELA', 'CAROLINA','LUCIA', 'ALDO')
order by nombre;

select nombre, ap_paterno, ap_paterno, peso, estatura, fedita 
FROM alumnos
WHERE NOT nombre IN ('MARIANA', 'GABRIELA','PAMELA', 'CAROLINA','LUCIA') 
AND sexo ='F' 
AND fedita BETWEEN '2016-09-01 00:00:00' AND '2016-09-30 23:59:59'
AND peso > 0
order by nombre, fedita;

-- like sin comodines
select nombre, ap_paterno, ap_paterno, peso, estatura, fedita 
FROM alumnos
WHERE nombre like 'ALDO';

-- like con comodin % que contenga la cadeana, en este caso aldo
select nombre, ap_paterno, ap_paterno, peso, estatura, fedita 
FROM alumnos
WHERE nombre like '%ALDO%';

-- aqui los nombres que comiencen con la cadena
select nombre, ap_paterno, ap_paterno, peso, estatura, fedita 
FROM alumnos
WHERE nombre like 'ALDO%';

-- LAS QUE TERMINEN CON ALDO
select nombre, ap_paterno, ap_paterno, peso, estatura, fedita 
FROM alumnos
WHERE nombre like '%ALDO';

-- TODOS LOS ALUMNOS QUE EMPIECEN CON B
select nombre, ap_paterno, ap_paterno, peso, estatura, fedita 
FROM alumnos
WHERE nombre like 'B%';

select nombre, ap_paterno, ap_paterno, peso, estatura, fedita 
FROM alumnos
WHERE nombre like '%B';

select nombre, ap_paterno, ap_paterno, peso, estatura, fedita 
FROM alumnos
WHERE nombre like '%B%';

-- QUE TENGAN UNA B Y TERMINEN CON UNA 'A'
select nombre, ap_paterno, ap_paterno, peso, estatura, fedita 
FROM alumnos
WHERE nombre like '%B%A';

-- EMPIEZA CON G, TIENE UNA B DONDE SEA Y TERMINA CON A
select nombre, ap_paterno, ap_paterno, peso, estatura, fedita 
FROM alumnos
WHERE nombre like 'G%B%A';

select nombre, ap_paterno, ciudad, ap_paterno, peso, estatura, fedita 
FROM alumnos
WHERE ciudad like '%QUER%' OR ciudad like '%QRO%';

-- que tengan dos nombres
select nombre, ap_paterno, ap_paterno, peso, estatura, fedita 
FROM alumnos
WHERE nombre like '% %'
order by nombre;

-- segundo comodin, 4 guiones bajos son para representar posiciones
select nombre, ap_paterno, ap_paterno, peso, estatura, fedita 
FROM alumnos
WHERE nombre like '_A__'
order by nombre;
-- una a en la segunda letra y qu termine con lo que sea
select nombre, ap_paterno, ap_paterno, peso, estatura, fedita 
FROM alumnos
WHERE nombre like '_A%'
order by nombre;

select nombre, ap_paterno, ap_paterno, peso, estatura, fedita 
FROM alumnos
WHERE fedita like '_____09%'
order by fedita;

-- los que no tengan @
select nombre, ap_paterno, ap_paterno, peso, estatura, fedita, curp, email 
FROM alumnos
WHERE email NOT like '%@%'
order by fedita;

select nombre, ap_paterno, ap_paterno, peso, estatura, fedita, curp, email 
FROM alumnos
WHERE email like '%gmail%'
order by fedita;

-- Binary diferencia entre mayusculas y munisculas
select nombre, ap_paterno, ap_paterno, peso, estatura, fedita, curp, email 
FROM alumnos
WHERE  BINARY nombre = '%aldo%'
order by nombre; -- 0 RESULTADOS

select nombre, ap_paterno, ap_paterno, peso, estatura, fedita, curp, email 
FROM alumnos
WHERE nombre ='aldo'
order by nombre; -- 4 resultados

use colegio2409;



-- 30 de junio
select nombre, length(nombre)
from alumnos;

select nombre, length(nombre)
from alumnos
WHERE length(nombre) >= 10
order by 2 DESC; 

select nombre, length(nombre)
from alumnos
WHERE length(nombre) >= 10
order by 2 DESC; 

select nombre, length(nombre) largo, count(*) as alu
from alumnos
group by length(nombre) 
order by 2 DESC; 

select nombre, length(nombre)
from alumnos
where length(nombre) = 7
order by 2 DESC; 

select nombre, length(nombre)
from alumnos
where length(nombre) = 7
order by 1; 

-- locate regresa la posicion de l primer vez que aparezca una cadena
SELECT nombre, LOCATE('A', nombre)
from alumnos;
-- los que no tieen una a
SELECT nombre, LOCATE('A', nombre)
from alumnos
WHERE LOCATE('A', nombre) = 0;
-- los que tienen a
SELECT nombre, LOCATE('A', nombre)
from alumnos
WHERE LOCATE('A', nombre) > 0;

SELECT nombre, LOCATE('A', nombre), LOCATE('A', nombre, 5)
from alumnos;

-- seleccionar la "a" despues de la primera "a"
SELECT nombre, LOCATE('A', nombre), LOCATE('A', nombre, 5),
LOCATE('A', nombre, LOCATE('A', nombre)+1 )
from alumnos;

SELECT nombre, LOCATE('MARIA', nombre)
from alumnos
WHERE LOCATE('MARIA', nombre) > 0;

-- mio 
SELECT nombre, LOCATE('A', nombre), LOCATE('A', nombre, 5)
from alumnos
where LOCATE('A', nombre, 5) > 0;
-- mio 
SELECT nombre, LOCATE (' ', nombre) nombre_1
from alumnos;

select nombre, left(nombre, 4), right(nombre, 4), mid(nombre, 4), 
mid(nombre, 4, 4), substr(nombre, 3, 4)
from alumnos;

-- este con right
select nombre, left(nombre, LOCATE(' ', nombre)) as primer_nombre, 
right(nombre, LOCATE(' ', nombre)+1) as segundo_nombre
from alumnos;

-- este con mid
select nombre, left(nombre, LOCATE(' ', nombre)) as primer_nombre, 
mid(nombre, LOCATE(' ', nombre)+1) 
from alumnos;

-- if acepta 3 parametros; condicion, que hacer si si, que hacer si no
select nombre, sexo, if(sexo = 'f', 'MUJER', if(sexo = 'm', 'HOMBRE', 'SIN DATO')) s
from alumnos;

-- este con mid y con if para que los separe correctamente
select nombre, 
if (locate(' ', nombre) = 0,
nombre, 
left(nombre, LOCATE(' ', nombre))) primer_nombre,
if (locate(' ', nombre) > 0, 
mid(nombre, LOCATE(' ', nombre)+1), ' ' ) segundo_nombre
from alumnos;

-- replace
select nombre, replace(nombre, 'A', '4')
from alumnos;

-- con la linea de abajo si se modifica la información
update alumnos set nombre = replace(nombre, 'A', '4');
select * from alumnos where nombre like '%A%';
update alumnos set nombre = replace(nombre, '4', 'A');
--

select nombre, lower(nombre), upper(nombre), lcase(nombre), ucase(nombre)
from alumnos;

-- concatenar
select nombre, ap_paterno, ap_materno, concat(nombre, ' ', ap_paterno, ' ', ap_materno) nombre_completo,
length(concat(nombre, ' ', ap_paterno, ' ', ap_materno)) largo
from alumnos
order by 5 DESC;

select nombre, left(md5(concat(nombre, sysdate())), 8) pass
from alumnos;


-- REVISAR ESTE MAS QUE NADA PORQUE TIENE TODO LO DEL 30
select nombre, ap_paterno, email,
lower(concat(left(nombre, 1), replace(ap_paterno,' ', ''), if(
sexo = 'f', '@patito23.com', '@patito24'))) email,
left(md5(concat(nombre, sysdate())), 8) pass 
from alumnos
where LOCATE('@', email) = 0;
	
select nombre, ap_paterno, ap_materno, 
concat_ws(' ', nombre, ' ', ap_paterno, ' ', ap_materno) nombre_completo
from alumnos;


--  7 de Julio 2021

USE colegio2409;
select md5('PATITO23'), md5('pATITO23');

select sysdate(), now() fecha_actual, curdate(), curtime();

select date_format(sysdate(), '%d');
select date_format(sysdate(), '%Y/%m/%d'); -- en mayusculas se ve màs chido 
select date_format(sysdate(), '%Y/%M/%D');

select date_format(sysdate(), '%j');

show variables like 'lc_time_names';

set lc_time_names = 'es_MX';

select nombre, fedita, date_format(fedita, '%a'), date_format(fedita, '%W'), 
date_format(fedita, '%M'),
date_format(fedita, '%u') 
-- w mayuscula todo el dia con a es abreviado en 3 letras, %u dia de la semana en la que estamos
-- %u mayuscula inicia en domingo
from alumnos;

select nombre, fedita, 
date_format(fedita, 'Cambio realizado el %W %d de %M del %Y') f_cambio
from alumnos;

select nombre, fedita, 
date_format(fedita, 'Hora: %H min: %i segundos: %s') f_cambio,
date_format(fedita, '%r') h12,
date_format(fedita, '%T') h24,
date_format(fedita, '%p') AMPM
from alumnos;

select date_format(fedita, '%Y') anio,
date_format(fedita, '%M') mes,
date_format(fedita, '%m') mesn,
count(*) nalu
from alumnos
group by date_format(fedita, '%Y'), date_format(fedita, '%M'), 
date_format(fedita, '%m')
order by 1,3;


select nombre, fedita
from alumnos
where date_format(fedita, '%Y') = '2016'
AND date_format(fedita, '%m') = '09';

select nombre, fedita,
YEAR(fedita) anio, MONTH(fedita) mes, DAY(fedita) dia, HOUR(fedita) hora, MINUTE(fedita) minutos,
SECOND(fedita) segundos
from alumnos;


select nombre, fedita,
DAYOFYEAR(fedita), DAYNAME(fedita),
DAYOFWEEK(fedita), -- comienza con 1 y en domingo
WEEKDAY(fedita), -- comienza en y en martes
MONTHNAME(fedita), WEEK(fedita),
QUARTER(fedita) trimestre
from alumnos; 

select distinct fedita,
EXTRACT(YEAR from fedita) ANIO,
EXTRACT(MONTH from fedita) MES,  -- DOS PARAMETROS
EXTRACT(DAY from fedita) DIA 
from alumnos;



select distinct fedita,
EXTRACT(DAY_HOUR from fedita) ANIO,
EXTRACT(DAY_MINUTE from fedita) diamin,  -- DOS PARAMETROS
EXTRACT(DAY_SECOND from fedita) diaseg ,
EXTRACT(HOUR_MINUTE from fedita) horamin ,
EXTRACT(HOUR_SECOND from fedita) horaseg ,
EXTRACT(MINUTE_SECOND from fedita) minseg 
from alumnos;

select DATE_ADD('2020-12-31 23:59:59', INTERVAL 1 SECOND) mas1seg,
DATE_ADD('2020-12-31 23:59:59', INTERVAL -1 SECOND) menos1seg,
DATE_ADD('2020-12-31 23:59:59', INTERVAL 1 MINUTE) mas1min,
DATE_ADD('2020-12-31 23:59:59', INTERVAL 1 HOUR) mas1hor,
DATE_ADD('2020-12-31 23:59:59', INTERVAL 1 DAY) mas1dia,
DATE_ADD('2020-12-31 23:59:59', INTERVAL 1 MONTH) mas1mes,
DATE_ADD('2020-12-31 23:59:59', INTERVAL 1 YEAR) mas1anio
from alumnos; 

select current_time() h_local, 
date_add(current_time(), INTERVAL -2 HOUR) htijuana,
date_sub(current_time(), INTERVAL 2 HOUR) htijuanasub
from alumnos;

select current_time() h_local, 
date_add(sysdate(), INTERVAL 2 QUARTER) mas2trim,
date_sub(sysdate(), INTERVAL 2 WEEK) menos2sem
from alumnos;

select distinct fedita elaboracion, date_add(fedita, INTERVAL 90 day) caduca
from alumnos; 

set @fc = '2020-03-13 15:23:45';

select @fc;

select datediff(now(), @fc) dias_sin_ir_a_la_fes;

select fedita, datediff(now(), fedita)
from alumnos
order by 2 DESC;

select datediff(now(), @fc) dias_sin_ir_a_la_fes, 
(datediff(now(), @fc) * 24) horas_sin_ir_a_la_fes,
((datediff(now(), @fc) * 24)*60) minutos_sin_ir_a_la_fes,
(((datediff(now(), @fc) * 24)*60)*60) horas_sin_ir_a_la_fes,
(datediff(now(), @fc) / 7) semanas_sin_ir_a_la_fes,
(datediff(now(), @fc) / 30) meses_sin_ir_a_la_fes,
(datediff(now(), @fc) / 365) anios_sin_ir_a_la_fes;


select from_days(366); -- cuanto tiempo ha pasado 

set @fc = '2001-12-28';
select @fc;
select from_days(datediff(now(), @fc)); -- determinado numero de dias y regresa una fecha

select 
CONCAT('TU EDAD: ',
YEAR(from_days(datediff(now(), @fc))), ' años ' ,
MONTH(from_days(datediff(now(), @fc))), ' meses y ' ,
DAY(from_days(datediff(now(), @fc))), ' dias'
) edad;

select date_format(from_days(datediff(now(), @fc)),
'TU EDAD: %y  años %m  meses y %d  dias') edad;










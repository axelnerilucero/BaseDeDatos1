-- 18 de junio DML
use test2409;

show tables;

select * from escritor;

desc escritor;

-- INSERT (insertar renglones en la base de datos para tener nuevos valores en la tabla)

INSERT INTO escritor VALUES
(NUll, 'CARLOS', 'MONSIVAIS', 'CDMX', 'monsi');

INSERT INTO escritor VALUES
(NULL, 'CARLOS', 'MONSIVAIS', 'CDMX', '');

INSERT INTO escritor VALUES
(NULL, 'OCTAVIO', 'PAZ', 'CDMX', 'paz');

INSERT INTO escritor VALUES
(2, 'GABRIEL', 'GARCIA MARQUEZ', NULL, NULL);

INSERT INTO escritor VALUES
(NULL, 'GABRIELA', NULL, NULL, NULL);

INSERT INTO escritor VALUES
(100, 'GABRIELA', 'MISTRAL', 'CDMX', 'mistral');

desc libro;

select * from libro;

INSERT INTO libro VALUES
(NULL, 1, 'Confrontaciones', NULL),
(NULL, 2, '100 años de soledad', NULL),
(NULL, 2, 'El amor en tiempos de colera', 'Texto');

-- ERROR (falta una columna)
INSERT INTO libro VALUES
(NULL, 101, 'El laberinto de la soledad');

INSERT INTO libro VALUES
(NULL, 101, 'El laberinto de la soledad','');

select * from escritor;

-- NO LO UEDE COLOCARPORQUE NO EXISTE EL ESCRITOR 1101
INSERT INTO libro VALUES
(NULL, 1101, 'El mono gramatico','');

INSERT INTO libro VALUES
(NULL, 101, 'El mono gramatico','');

DELETE FROM escritor WHERE nombre = 'CARLOS';

UPDATE escritor SET id_escritor = 2000 WHERE id_escritor = 101;

INSERT INTO escritor VALUES
(NULL, 'CARLOS', 'FUENTES', 'CDMX', 'fuentes');

CREATE TABLE escritor_tmo like escritor;

-- AXEL URIEL NERI LUCERO 
-- CREACION DE UNA TABLA TEMPORAL PARA VER PORQUE EL WHERE NOS SALVARÍA
INSERT INTO escritor_tmo
SELECT * FROM escritor;

select * from escritor_tmo;

UPDATE escritor_tmo SET nombre = 'PATITO 23';

DELETE FROM escritor_tmo;
UPDATE escritor_tmo SET ALIAS = 'PATITO 23';

DROP TABLE escritor_tmo;

-- AQUI SE TERMINO ESA PRUEBA


-- 21 de junio
desc escritor;

select * from escritor;

show index from escritor;

ALTER TABLE escritor DROP KEY uq_alias;

INSERT INTO escritor (id_escritor, nombre, apellidos) VALUES
(NULL, 'JUAN', 'RULFO'),
(NULL, 'INES','DE LA CRUZ');


INSERT INTO escritor (nombre, apellidos) 
VALUES
('MARIANO', 'AZUELA'), ('ELENA', 'Poniatowska');

INSERT INTO escritor (alias, nombre, direccion, apellidos) VALUES
('JAVI', 'JAVIER', 'MEXICO', 'VILLAULRUTIA');

-- error de consistencia de datos

INSERT INTO escritor VALUES
(NULL, 'Javi', 'JAVIER', 'MEXICO', 'VILLAULRUTIA');

select * from escritor;

INSERT INTO escritor SET 
nombre = 'MANUEL',
apellidos = 'ACUÑA',
direccion = 'MX',
alias = 'macuña';



-- Aqui es para agregar los datos desde un archivo csv utilizando la ruta
LOAD DATA LOCAL INFILE
'C:\\Users\\VICTOR\\axelnerilucero\\Base de Datos\\escritores.csv'
INTO TABLE escritor
FIELDS TERMINATED BY ','
ENCLOSED BY ''
LINES TERMINATED BY '\r\n';

-- aqui se ve si esta encendido o apagado
show variables like '%local%';

-- aqui se cambia
set global local_infile = 1;

select * from escritor;

UPDATE  escritor SET  
nombre = 'ISSAC', apellidos = 'ASIMOV', direccion = 'NA', ALIAS = 'YoRobot' 
WHERE id_escritor = 2006;

UPDATE escritor SET alias = 'SIN DATO' WHERE ALIAS != 'NA';

UPDATE escritor SET direccion = 'MEX' WHERE id_escritor >= 2004;


UPDATE escritor SET ALIAS = 'NO SE', direccion = 'AMERICA' 
WHERE id_escritor >= 2000 AND id_escritor <= 2005;


select * from escritor WHERE ALIAS = 'SIN DATO';
DELETE FROM escritor WHERE ALIAS = 'SIN DATO';

select * from libro;

-- 23 de junio

use test2409;













































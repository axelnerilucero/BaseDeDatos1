-- DDL
create database if not exists test2409;

use test2409;

CREATE TABLE escritor (
id_escritor INT NOT NULL auto_increment, 
nombre VARCHAR(30) NOT NULL, 
apellidos VARCHAR(40) NOT NULL,
 PRIMARY KEY(id_escritor)
) ENGINE=InnoDB;

show tables;
drop table escritor;

CREATE TABLE escritor (
id_escritor INT NOT NULL auto_increment, 
nombre VARCHAR(30) NOT NULL, 
apellidos VARCHAR(40) NOT NULL,
direccion VARCHAR(100) NULL,
ALIAS VARCHAR(30) NULL DEFAULT 'NA',
 PRIMARY KEY(id_escritor)
) ENGINE=InnoDB;

CREATE TABLE libro( 
	id_libro INT NOT NULL auto_increment PRIMARY KEY,
    id_escritor INT NOT NULL,
    titulo VARCHAR(100),
    contenido TEXT NULL,
    FOREIGN KEY(id_escritor) REFERENCES escritor(id_escritor)
    ON DELETE CASCADE ON UPDATE CASCADE
);
show tables;

show index from libro;
show columns from escritor; 
desc escritor;
describe escritor; 

show create table escritor;

CREATE TABLE `escritor` (
  `id_escritor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `ALIAS` varchar(30) DEFAULT 'NA',
  PRIMARY KEY (`id_escritor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE escritor2 LIKE escritor;
 show tables;
 
 -- AXEL URIEL NERI LUCERO
 CREATE TEMPORARY TABLE escritor3 LIKE escritor;

select * from escritor3;

show tables;

use test2409;

-- 16 de junio
show index from escritor;

desc escritor2; 

CREATE UNIQUE INDEX uq_alias ON escritor(ALIAS);

ALTER TABLE escritor ADD INDEX in_nombre (nombre, apellidos);

ALTER TABLE escritor DROP INDEX in_nombre;

desc libro;

ALTER TABLE escritor2 MODIFY id_escritor INT NOT NULL;

ALTER TABLE escritor2 DROP PRIMARY KEY;
-------
desc escritor2; 
ALTER TABLE escritor2 
MODIFY id_escritor INT NOT NULL auto_increment,
ADD PRIMARY KEY(id_escritor);

ALTER TABLE escritor2 ADD ciudad VARCHAR(30) NOT NULL;

ALTER TABLE escritor2
CHANGE apellidos apellido_paterno VARCHAR(50) NOT NULL,
ADD  apellido_materno VARCHAR(50) NOT NULL AFTER apellido_paterno;

ALTER TABLE escritor2 ADD cd VARCHAR(30) NOT NULL FIRST;

ALTER TABLE escritor2
CHANGE ciudad ciudad VARCHAR(50) NOT NULL;

desc escritor2; 

ALTER TABLE escritor2
MODIFY ciudad VARCHAR(50) NOT NULL;

ALTER TABLE escritor2 DROP COLUMN cd;

ALTER TABLE escritor2 
MODIFY ciudad VARCHAR(50) NOT NULL AFTER direccion;


show index from libro; 

SELECT
  TABLE_NAME,
  COLUMN_NAME,
  CONSTRAINT_NAME,   
  REFERENCED_TABLE_NAME,
  REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
  REFERENCED_TABLE_SCHEMA = 'test2409'
	AND REFERENCED_TABLE_NAME = 'escritor';
    
-- AXEL URIEL NERI LUCERO    
    
RENAME TABLE escritor2 TO escritor_dos;    
 
 show tables;
 
show tables from test1606; 

CREATE DATABASE test1606;

RENAME TABLE test2409.escritor_dos TO test1606.escritor_dos;
    
CREATE TABLE escritor_dos LIKE test1606.escritor_dos;

desc escritor_dos;

DROP TABLE test1606.escritor_dos;

DROP DATABASE test1606;

use test2409;

show tables;









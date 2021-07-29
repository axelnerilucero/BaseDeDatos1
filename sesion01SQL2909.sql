-- Intro al SQL

/*
Axel
*/

show databases;

CREATE DATABASE test2409;

USE test2409;

show tables;

show tables in information_schema;

show tables from information_schema;

use information_schema;

show tables;

show columns from TABLES;

show columns from VIEWS; 

show columns from information_schema.VIEWS; 

show index from information_schema.VIEWS; 

show variables;

select version();

show variables like '%basedir%';

show variables like '%datadir%';


CREATE DATABASE libros;
-- Axel Uriel Neri lucero 
CREATE TABLE libros.escritor (
id_escritor INT NOT NULL auto_increment, 
nombre VARCHAR(30) NOT NULL, 
apellidos VARCHAR(40) NOT NULL,
 PRIMARY KEY(id_escritor)
) ENGINE=InnoDB;

Drop database libros;

show tables from sys;

-- select * from sys.hot_summary;






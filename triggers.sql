USE colegio2409;

DELIMITER // 
DROP TRIGGER IF EXISTS bi_curso //
CREATE TRIGGER bi_curso 
BEFORE INSERT ON cursos 
FOR EACH ROW 
BEGIN  
	if(left(NEW.nombre, 5)) <> 'curso' THEN
		set NEW.nombre = concat('CURSO', NEW.nombre);
    end if;
    set NEW.nombre = upper(NEW.nombre);
    set NEW.abreviatura = upper(NEW.abreviatura);
END // -- NEW.algo datos que lleguen a la insercion

select trigger_name, event_manipulation, event_object_table, action_statement, trigger_schema
from information_schema.triggers
where trigger_schema = 'colegio2409';

-- AXEL URIEL NERI LUCERO

insert into cursos values
('C100', 'escolar 2019-2020', 'ce 19-20', '2019-07-31 00:00:00', '2000-07-30 00:00:00'),
('C200', 'escolar 2020-2021', 'ce 20-21', '2020-07-31 00:00:00', '2000-07-30 00:00:00');

select * from cursos; 

-- v2 Trigger
DELIMITER // 
DROP TRIGGER IF EXISTS bi_curso //
CREATE TRIGGER bi_curso 
BEFORE INSERT ON cursos 
FOR EACH ROW 
BEGIN  
	if(left(NEW.nombre, 5)) <> 'curso' THEN
		set NEW.nombre = concat('CURSO', NEW.nombre);
    end if;
    set NEW.nombre = upper(NEW.nombre);
    set NEW.abreviatura = upper(NEW.abreviatura);
    
    if(DATEDIFF(NEW.ffin, NEW.finicio) < 240) then 
		signal sqlstate'45000' -- codigo de error
        set message_text = 'Fecha final fuera de rango'; -- mensaje del codigo de error
	end if;
END // -- NEW.algo datos que lleguen a la insercion

delete from cursos where id_curso in('C300', 'C400');

insert into cursos values
('C300', 'escolar 2021-2022', 'ce 21-22', '2019-07-31 00:00:00', '2000-07-30 00:00:00'),
('C400', 'escolar 2022-2023', 'ce 222-23', '2020-07-31 00:00:00', '2000-07-30 00:00:00');

insert into cursos values
('C300', 'escolar 2021-2022', 'ce 21-22', '2021-07-31 00:00:00', '2022-07-30 00:00:00'),
('C400', 'escolar 2022-2023', 'ce 222-23', '2022-07-31 00:00:00', '2023-07-30 00:00:00'),
('C301', 'escolar 2021-2022', 'ce 21-22', '2021-07-31 00:00:00', '2022-07-30 00:00:00'),
('C402', 'escolar 2022-2023', 'ce 222-23', '2022-07-31 00:00:00', '2023-07-30 00:00:00');

select * from cursos;

drop table if exists bitacora;
create table bitacora(
	id int not null auto_increment primary key,
    fecha datetime not null,
    usuario varchar(50) not null,
    tabla varchar(50) not null,
    accion text null
);
show tables;
select * from bitacora;

DELIMITER // 
DROP TRIGGER IF EXISTS ad_curso //
CREATE TRIGGER ad_curso 
AFTER DELETE ON cursos 
FOR EACH ROW 
BEGIN  
	INSERT INTO bitacora VALUES (null, sysdate(), user(), 'cursos',
	concat_ws('¦', 'ELIMINACION DE CURSO', OLD.id_curso, OLD.nombre, 
    OLD.abreviatura, OLD.finicio, OLD.ffin));
END // 

-- Error Code: 1054. Unknown column 'inicio' in 'OLD'
select trigger_name, event_manipulation, event_object_table, action_statement, trigger_schema
from information_schema.triggers
where trigger_schema = 'colegio2409';

DELETE FROM cursos WHERE id_curso >= 'C100';
select * from bitacora;
-- se eliminaron 8 porque agregue mas cursos 



select c.*, DATEDIFF(ffin, finicio)
from cursos c;

-- Axel Uriel Neri Lucero

DELIMITER // 
DROP TRIGGER IF EXISTS bu_curso //
CREATE TRIGGER bu_curso 
BEFORE UPDATE ON cursos 
FOR EACH ROW 
BEGIN  
	if(DATEDIFF(NEW.ffin, NEW.finicio) < 360) then 
		set new.ffin = date_add(old.finicio, interval 1 year);
    end if;
    set NEW.nombre = upper(NEW.nombre);
    set NEW.abreviatura = upper(NEW.abreviatura);
    
    INSERT INTO bitacora VALUES (null, sysdate(), user(), 'cursos',
    concat_ws('/', 'UPDATE', OLD.id_curso, OLD.nombre, OLD.abreviatura, OLD.finicio, OLD.ffin, '=>',
    NEW.id_curso, NEW.nombre, NEW.abreviatura, NEW.finicio, NEW.ffin));
END // 

update cursos set ffin = '2001-07-30 00:00:00',
abreviatura = replace(abreviatura, 'CE', 'ci') ,
nombre = replace(nombre, 'CURSO', 'ciclo') 
where id_curso >= 'C100';


insert into cursos values
('C100','escolar 2021-2022','ce 21-22','2021-07-31 00:00:00','2022-06-28 00:00:00'),
('C200','escolar 2022-2023','ce 22-23','2022-07-31 00:00:00','2023-06-28 00:00:00');

Error Code: 1366. Incorrect string value: '\xE2\x97\x98C10...' for column 'accion' at row 1

select * from bitacora;
select * from cursos;

select trigger_name, event_manipulation, event_object_table, action_statement, trigger_schema
from information_schema.triggers
where trigger_schema = 'colegio2409';
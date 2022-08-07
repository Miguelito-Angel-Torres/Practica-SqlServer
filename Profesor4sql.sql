create database Senati
Use Senati

create table Alumno(
    id int primary key identity(1,1), -- identity(1,1) es un auto_incrementable primero va el indice y el segundo el incremento
    nombre varchar(100) not null,
    apellido varchar(100) not null,
	edad int 
)

insert into Alumno values
	('Miguel','Mallqui',20),
	('Angel','Torres',30)


select * from Alumno
drop table Alumno
--Agregar un campo(sexo) a la tabla
alter table Alumno add Sexo char(1)
-- Agregar datos en el nuevo campo Sexo

update Alumno set Sexo = 'M' where id=1
update Alumno set Sexo = 'F' where id=2

delete from Alumno  where id = 1


ALTER TABLE Alumno DROP COLUMN edad;

AlTER TABLE Alumno ADD FechaNacimiento date 

update Alumno set FechaNacimiento = '05-05-2012' where id=1
update Alumno set FechaNacimiento = '05-05-2012' where id=2


ALTER TABLE Alumno ALTER COLUMN nombre varchar(200);
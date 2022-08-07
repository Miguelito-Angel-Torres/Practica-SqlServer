create database BaseCrud

use BaseCrud

create table Alumnos(
	codigo char(10) primary key,
	Nombre varchar(50) not null,
	sexo char(1) not null,

)

select * from  Alumnos--listar

insert into Alumnos(codigo,Nombre,sexo) values ('A001','Lucas','M')--registrar

-- id int not null auto_increment primary key 
insert into Alumnos values --registrar
	('A002','Maria','F'),
	('A003','Juana','F'),
	('A004','Anabel','F'),
	 ('A005','Mario','M'),
	 ('A006','Miguel','M'),
	('A007','Ana','F'),
	('A008','Nory','F')
	


truncate table Alumnos

--CRUD(listar,registrar,actualizar,eliminar

--Mostrando datos de la tabla
select * from  Alumnos --listar

update Alumnos set Nombre='Miguel' , codigo = 'A8' where codigo = 'A005'--actualizar

delete from Alumnos where codigo = 'A002' -- eliminar

--Consultas

select * 
from Alumnos
where Nombre = 'Juana' and sexo = 'F'


--crear una consulta que muestre a todos los datos cuyo nombre empieze con D
select * 
from Alumnos
where Nombre like 'J%'


create proc sp_listar_Alumnos
as
select * from Alumnos order by codigo
go


--Busqueda de Clientes:

create proc sp_buscar_Alumnos
-- Agregar una Varaible
@nombre varchar(50)
as 
select codigo,Nombre,sexo from Alumnos where Nombre like @nombre + '%'




create proc sp_mant_Alumnos
--debemos que crear  una variable para cada dato de la tabla
@codigo char(10),
@Nombre varchar(50),
@sexo char(1) ,
@accion varchar(50) output --Mensaje (filtro)
as
if (@accion ='1')
begin 
	declare @codnuevo varchar(5), @
end
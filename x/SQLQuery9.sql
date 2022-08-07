
CREATE DATABASE Bibliotecaria2021

USE Bibliotecaria2021



CREATE SCHEMA GeneDistric

CREATE SCHEMA GenePhone

CREATE SCHEMA Person

CREATE SCHEMA Libro

CREATE SCHEMA Nacionalidad

CREATE SCHEMA Prestamo

CREATE SCHEMA Compra


select *
from sys.schemas

CREATE TABLE GeneDistric.Distritos(
	Id_dist int primary key not null,
	Nombre_dist varchar(40) not null
)



CREATE TABLE GenePhone.Tipotelefono(
	Id_TipTelefono int primary key not null,
	Nombre_TipTelefono varchar(50) not null
)



-- alter schema Production transfer tb_distritos


CREATE TABLE Person.Alumno(
	Id_Alum int primary key not null ,
	Nombre_Alum varchar(50) not null,
	Apellido_Alum varchar(50) not null,
	Dni_Alum char(8) not null,
	Direccion_Alum varchar(50) not null,
	Alum_Id_dist int not null foreign key references GeneDistric.Distritos(Id_dist)
	
)

CREATE TABLE Person.Telef_Alumn(
	Id_Alumn int  not null foreign key references Person.Alumno(Id_Alum),
	Telef_Alumn int not null,
	Alumn_Id_TipTelefono int not null foreign key references GenePhone.Tipotelefono(Id_TipTelefono))

CREATE TABLE Person.Corre_Alumn(
	Id_Alumn int not null foreign key references Person.Alumno(Id_Alum),
	Corre_Alumn varchar(50) not null)

--LIBROS
CREATE TABLE Nacionalidad.Autor(
	Id_Nacionalidad int not null primary key,
	Nacionalidad varchar(20) not null)

CREATE TABLE Libro.Autor(
	Id_Autor int not null primary key,
	Nombre_Autor varchar(50) not null,
	Apellido_Autor varchar(50) not null,
	Fecha_Nac_Autor date ,
	Autor_Id_Nacionalidad  int not null foreign key references Nacionalidad.Autor(Id_Nacionalidad))



CREATE TABLE Libro.Editorial(
	Id_Editorial int not null primary key,
	Editorial varchar(50) not null)

CREATE TABLE Libro.Genero(
	Id_Genero int not null primary key,
	Genero  varchar(50) not null)

CREATE TABLE Libro.Estado(
	Id_Estado int not null primary key,
	Estado varchar(50) not null,
	Precio float not null)


CREATE TABLE Libro.General(
	Id_Libro int not null primary key,
	Titulo_Libro varchar(50) not null,
	Libro_Id_Autor int not null foreign key references Libro.Autor(Id_Autor),
	Libro_Id_Editoral int not null foreign key references Libro.Editorial(Id_Editorial),
	Libro_Id_Genero int not null foreign key references Libro.Genero(Id_Genero),
	Libro_Id_Estado int not null foreign key references Libro.Estado(Id_Estado))

CREATE TABLE Person.Trabajador(
	Id_Trabajador int not null primary key,
	Nombre_Trabajador varchar(50) not null,
	Apellido_Trabajador varchar(50) not null,
	Genero_Trabajador char(1) not null,
	Dni_Trabajador char(8) not null,
	Direccion_Trabajador varchar(50) not null,
	Trabajador_Id_dist int not null foreign key references GeneDistric.distritos(Id_dist))


CREATE TABLE Person.Telef_Trabajador(
	Id_Trabajador int  not null foreign key references Person.Trabajador(Id_Trabajador),
	Telef_Trabajador int not null ,
	Trabajador_Id_TipTelefono int not null foreign key references GenePhone.Tipotelefono(Id_TipTelefono))

CREATE TABLE Person.Corre_Trabajador(
	Id_Trabajador int not null foreign key references Person.Trabajador(Id_Trabajador),
	Corre_Trabajador varchar(50) not null)

CREATE TABLE Person.Especialidad_Trabajador(
	Id_Especialidad int not null primary key,
	Especialidad varchar(50) not null)


CREATE TABLE Person.Jornada_Trabajador(
	Id_Trabajador int not null foreign key references Person.Trabajador(Id_Trabajador),
	Trabajador_Id_Especialidad int not null foreign key references Person.Especialidad_Trabajador(Id_Especialidad),
	Sueldo_Trabajador float not null,
	Frecuencia_Trabajador varchar(50) not null,
	Inicio_Trabajador date not null,
	Fin_Trabajador date not null,
	Entrada_Trabajador datetime not null,
	Salida_Trabajador datetime not null)

CREATE TABLE Prestamo.Libro(
	Prestamo_Id_Alum int not null foreign key references  Person.Alumno(Id_Alum),
	Prestamo_Id_Libro int not null foreign key references Libro.General(Id_Libro),
	Prestamo_Id_Trabajador int not null foreign key references Person.Trabajador(Id_Trabajador),
	Fecha_Prestamo datetime not null,
	Fecha_Devolucion datetime not null)

	alter table Prestamo.Libro add primary key(Prestamo_Id_Alum,Prestamo_Id_Libro ,Prestamo_Id_Trabajador)

CREATE TABLE Compra.TipoPago(
	Id_TipoPago int not null primary key,
	Nombre_TipoPago varchar(50) not null)




CREATE TABLE Compra.Libro(
	Compra_Id_Alum int not null foreign key references  Person.Alumno(Id_Alum),
	Compra_Id_Libro int not null foreign key references Libro.General(Id_Libro),
	Compra_Id_Trabajador int not null foreign key references Person.Trabajador(Id_Trabajador),
	Compra_Id_TipoPago int not null foreign key references Compra.TipoPago(Id_TipoPago),
	Fecha_Compra datetime not null)
	

	alter table Compra.Libro add primary key(Compra_Id_Alum,Compra_Id_Libro ,Compra_Id_Trabajador,Compra_Id_TipoPago)
	

select * from GeneDistric.Distritos

insert into GeneDistric.Distritos values
	(01,'Comas'),
	(02,'San Martin de Porres'),
	(03,'Callao'),
	(04,'Lima'),
	(05,'Los Olivos'),
	(06,'Lurin'),
	(07,'San Juan de Lurigancho'),
	(08,'Puente Piedra'),
	(09,'Carabayllo'),
	(010,'Chorrillos'),
	(011,'Santa Rosa'),
	(012,'Ate'),
	(013,'Ancon'),
	(014,'La Victoria'),
	(015,'Pueblo Libre')

select * from Person.Alumno
insert into Person.Alumno values
(1,'Miguel Angel','Mallqui Torres','12345678','Av.LasTorres 234',1),
(2,'Rosa Maria','Ferrel Cacerez','78945612','AV.LasMercedes 756',5),
(3,'Katy Ana','Lapriano Miralla','46512378','Av. LasManzanas 836',7),
(4,'Lucas Mario','Gamarra Guiterrez','75645678','Av.LosPinos 623',10),
(5,'Flor Sofia','Angela Rojas','32378978','Jr. Los incas 562',11),
(6,'Mia Nia','Duarte Rojas','61245678','Av. Surge 241',6),
(7,'Antonio Lucas','Dominguez Rojas','62345675','Av. Cantacallao 423',2)



insert into GenePhone.Tipotelefono values
	(1,'Celular'),
	(2,'Casa'),
	(3,'Oficina')


insert into Libro.Genero values
	(1,'Novela'),
	(2,'Poesia'),
	(3,'Politico'),
	(4,'Romance'),
	(5,'Tragedia'),
	(6,'Comedia'),
	(7,'Lirico'),
	(8,'Drama'),
	(9,'Cuento'),
	(10,'Mitos')
	
select * from Libro.Genero
select * from Person.Telef_Alumn

insert into Person.Telef_Alumn values
	(1,954621346,1),
	(2,967821356,3),
	(3,0224213146,2),
	(4,0256713146,2),
	(5,954656346,3),
	(6,0924414546,2),
	(7,994621356,1)

select * from Person.Corre_Alumn

insert into Person.Corre_Alumn values
	(1,'miguel123@gmail.com'),
	(2,'cacerez123@outlook.es'),
	(3,'Ana456x@gmail.com'),
	(4,'Luscasñs460@gmail.com'),
	(5,'Angela7894@gmail.com'),
	(6,'Niasqw@outlook.es'),
	(7,'Rojas@gmail.com')

select  *  from Libro.Editorial

insert into Libro.Editorial values
	(1,'Francisco de Robles'),
	(2,'Austral'),
	(3,'Antonio Blado'),
	(4,'Samuel'),
	(5,'Penguin Clasicos'),
	(6,'Alfaguara'),
	(7,'El Renacimiento'),
	(8,'S.L.U Espasa Libros'),
	(9,'Vicens-Vives'),
	(10,'Fundaci�n Virtual M.C.'),
	(11,'Anagrama'),
	(12,'Seix Barbal'),
	(13,'Mestas Editorial'),
	(14,'Nube Tinta'),
	(15,'Penguin Random House'),
	(16,'Alinaza Editorial'),
	(17,'Destino'),
	(18,'Spasa'),
	(19,'Catedra'),
	(20,'Baugry')

select * from Nacionalidad.Autor

insert into Nacionalidad.Autor values
	(1,'Española'),
	(2,'Ingles'),
	(3,'Peruano'),
	(4,'Colombiano'),
	(5,'Italiano'),
	(6,'Britanica'),
	(7,'Suizo'),
	(8,'Estadounidense'),
	(9,'Griego'),
	(10,'AlemAn')

select * from Libro.Autor

insert into Libro.Autor values
	(1,'Miguel','Cervantes','10-29-1547',1),
	(2,'Willian','Shakespeare','04-01-1564',2),
	(3,'Mario','Vargas','03-28-1936',3),
	(4,'Jorge','Issac','04-01-1837',4),
	(5,'Nicolas','Malquiavelo','05-03-1469',5),
	(6,'Tom','Sharpe','03-30-1928',2),
	(7,'Eduardo','Mendoza','01-11-1943',1),
	(8,'Evelyn','Waugh','10-28-1903',6),
	(9,'Jecques','Rousseu','06-10-1712',7),
	(10,'Johm','Green','08-24-1977',8),
	(11,'Emily','Bronte','07-30-1818',6),
	(12,'Gabriel','Garcia','03-06-1927',4),
	(13,'Neil','Gaiman','11-10-1960',2),
	(14,'Jose','Gomez','01-15-1962',1),
	(15,'Lope','De Vega','11-25-1562',1)

select  * from Libro.Estado

insert into Libro.Estado values
	(1,'Bueno',20.00),
	(2,'Regular',15.00),
	(3,'Viejo',10.00)

select *  from Libro.General

insert into Libro.General values
	(1,'Don Quijote',1,1,1,2),
	(2,'Romeo Julieta',2,2,4,1),
	(3,'La Galatea',1,3,1,3),
	(4,'El principe',5,1,7,1),
	(5,'Las Fiesta del Chivo',3,4,1,2),
	(6,'Maria',4,2,1,2),
	(7,'La ciudad de los Perros',3,5,1,2),
	(8,'Otelo',2,6,5,3),
	(9,'Macbeth',2,7,5,1),
	(10,'La Tierra de Cordova',1,8,2,3)


delete from Libro.General

select * from  Person.Trabajador

insert into Person.Trabajador values
	(1,'Ana','Ortega','F','78451235','Av.Carabayllo 156',5),
	(2,'Carolina','Torres','F','45481235','Av.LasMercedes 756',2),
	(3,'Amanda','Marillos','F','28789235','Av.LasTorres 489',1),
	(4,'Ana','Ferrel','F','88451255','Av.ElGirasol 1',4),
	(5,'Maria','Gamarra','F','78453535','Av.LosAmautas 15',8),
	(6,'Lucas','Diaz','M','18441239','Jr.LosIncas 16',10),
	(7,'Mario','Dominguez','M','38455735','Av.Micaela 56',6),
	(8,'Luigui','Cacerez','M','48541232','Jr.Piura 956',3),
	(9,'Johel','Torrez','M','58461231','Jr.Girasol 2',7),
	(10,'Katy','Diaz','F','18551135','Calle Inca 128',9),
	(11,'Dalila','Rojas','F','98459235','Calle Perla 789',2)


select  *  from Person.Corre_Trabajador

insert into Person.Telef_Trabajador values
	(1,956478945,1),
	(2,961145982,3),
	(3,984244941,1),
	(4,956478992,2),
	(5,989474945,3),
	(6,0654413446,2),
	(7,956445945,3),
	(8,0754213646,2),
	(9,986478912,3),
	(10,935475445,1),
	(11,957477946,1)

select *  from Person.Corre_Trabajador

insert into Person.Corre_Trabajador values
	(1,'ortega123@hotmail.com'),
	(2,'Carolina1@hotmail.com'),
	(3,'45678Aman@outlook.es'),
	(4,'Ferril@hotmail.com'),
	(5,'MarRam4567@hotmail.com'),
	(6,'Diaz789@outlook.es'),
	(7,'Mari98@hotmail.com'),
	(8,'Luigui78@hotmail.com'),
	(9,'Johel789@hotmail.com'),
	(10,'K1234@outlook.es'),
	(11,'Dal123@hotmail.com')

select *  from Person.Especialidad_Trabajador

insert into Person.Especialidad_Trabajador values
	(1,'Bibliotecario'),
	(2,'Seguridad'),
	(3,'Paginas Web'),
	(4,'Limpieza'),
	(5,'Coordinador'),
	(6,'Mantenimiento')
	
	
select * from Person.Jornada_Trabajador 

insert into Person.Jornada_Trabajador  values
	(1,1,3000.00,'Lunes-Sabado','2020-01-30 ','2021-08-30 ','2021-01-30 15:40:00.000','2021-01-30 12:00:00.000'),
	(2,2,1500.00,'Lunes-Sabado','2018-04-30','2021-10-2 ','2021-05-30 8:06:00.000','2021-05-30 12:15:00.000'),
	(3,3,5000.00,'Martes-Miercoles','2020-04-15 ','2021-04-15 ','2021-05-02 6:30:00.000','2021-05-02 12:15:00.000'),
	(4,4,1200.00,'Viernes-Sabado','2019-07-02 ','2022-09-07 ','2021-03-15 10:30:00.000','2021-03-15 12:30:00.000'),
	(5,5,4000.00,'Lunes-Miercoles','2020-04-01 ','2021-09-12 ','2021-02-01 12:30:00.000','2021-02-01 06:25:00.000'),
	(6,6,3500.00,'Miercoles-Sabado','2021-01-15 ','2021-10-22 ','2021-05-15 8:30:00.000','2021-05-15 12:15:00.000'),
	(7,2,1500.00,'Lunes-Sabado','2020-02-02 ','2021-06-26 ','2021-03-20 12:30:00.000','2021-03-20 16:10:00.000'),
	(8,4,1200.00,'Martes-Jueves','2018-09-01 ','2021-08-02 ','2021-01-30 8:30:00.000','2021-01-30 6:15:00.000'),
	(9,3,5000.00,'Viernes-Sabado','2017-06-15 ','2021-10-03 ','2021-05-10 6:30:00.000','2021-05-10 6:00:00.000'),
	(10,1,4000.00,'Lunes-Martes','2015-08-15 ','2021-11-09 ','2021-05-01 7:30:00.000','2021-05-01 12:15:00.000'),
	(11,5,4000.00,'Miercoles-Sabado','2018-12-01 ','2022-07-16 ','2021-05-30 10:30:00.000','2021-05-30 1:30:00.000')

--delete from Person.Jornada_Trabajador 


-- agregar entresa y tabajadro

select *  from Libro.General
select *  from Prestamo.Libro
select * from Person.Alumno

insert into Prestamo.Libro values
	(1,1,1,'2021-01-15 ','2021-01-30 11:00:00.000'),
	(2,10,10,'2021-02-02 08:00:00.000','2021-03-25 12:00:00.000'),
	(3,8,10,'2021-03-15 15:20:00.000','2021-04-12 15:00:00.000'),
	(4,2,1,'2021-01-10 17:25:00.000','2021-02-15 10:00:00.000')
	

DELETE from Prestamo.Libro

select * from Compra.TipoPago

insert into Compra.TipoPago values
	(1,'Efectivo'),
	(2,'Tarjeta'),
	(3,'Paypel')

select * from Libro.General

select * from Compra.Libro

insert into Compra.Libro values
	(3,2,1,1,'2021-01-15 11:00:00.000'),
	(4,4,10,2,'2021-02-02 09:00:00.000'),
	(6,5,10,3,'2021-03-15 13:20:00.000'),
	(4,9,1,1,'2021-01-10 10:25:00.000'),
	(7,3,1,1,'2021-02-02 14:25:00.000'),
	(2,6,1,1,'2021-01-01 09:25:00.000')

delete from Compra.Libro

--Trigger a la  tb_Compra.Libro
select * from Logs_Compra

delete from Logs_Compra


create table Logs_Compra(Fecha date,Hora Time,Nombre varchar(100),Descripcion varchar(100))


create trigger tr_Compra_Insert
on Compra.Libro
after insert
as
Begin
print 'Se realizo acción de Insert '
set Nocount on 
insert into Logs_Compra(Fecha,Hora,Nombre,Descripcion)
select Getdate(),Sysdatetime(),@@SERVERNAME, Descripcion = 'Se Inserto  Información'
End

create trigger tr_Compra_Delete
on Compra.Libro
after delete
as
Begin
print 'Se realizo acción de Delete'
set Nocount on 
insert into Logs_Compra(Fecha,Hora,Nombre,Descripcion)
select Getdate(),Sysdatetime(),@@SERVERNAME, Descripcion = 'Se Delete  Información'
End

delete from Compra.Libro where Compra_Id_Alum = 3

create trigger tr_Compra_Update
on Compra.Libro
after update 
as
Begin
print 'Se realizo acción de Update'
set Nocount on 
insert into Logs_Compra(Fecha,Hora,Nombre,Descripcion)
select Getdate(),Sysdatetime(),@@SERVERNAME, Descripcion = 'Se Update  Información'
End

update  Compra.Libro set Compra_Id_Libro = 3 where Compra_Id_Alum = 6 


--

select *  from Person.Alumno

select tb1.Id_Alum,tb1.Nombre_Alum, tb1.Apellido_Alum ,tb1.Dni_Alum,tb1.Direccion_Alum ,tb2.Nombre_dist as 'Distrito'
into ##Base_Alumno
from Person.Alumno as tb1 join GeneDistric.Distritos as tb2
on(tb1.Alum_Id_dist = tb2.Id_dist)
order by tb1.Nombre_Alum asc

select * from ##Base_Alumno

drop table ##Base_Alumno


--CREACION DE UN VIEW (Permite algunas)
-- view -script
select *  from Person.Jornada_Trabajador

CREATE VIEW vw_Jornada_Trabajador as
select * 
from Person.Jornada_Trabajador as tb1
where tb1.Sueldo_Trabajador >= 2000

select *  from vw_Jornada_Trabajador



-- Empaquetados 
-- externo 
select tb1.Id_Trabajador,Nombre_Trabajador,Apellido_Trabajador ,
case tb1.Genero_Trabajador when 'M' then 'Masculino' when 'F' then 'Femenino' end  as 'Genero',
tb1.Dni_Trabajador,tb3.Especialidad,tb2.Sueldo_Trabajador

from Person.Trabajador tb1  join Person.Jornada_Trabajador as tb2
on(tb1.Trabajador_Id_dist = tb2.Id_Trabajador) join Person.Especialidad_Trabajador as tb3
on(tb2.Trabajador_Id_Especialidad = tb3.Id_Especialidad) 
where Genero_Trabajador  = 'F'


exec sp_Trabajador 'F'


select *  from Person.Trabajador
select *  from Person.Jornada_Trabajador

--interno

select tb1.Id_Trabajador ,tb3.Nombre_Trabajador,tb3.Apellido_Trabajador, tb2.Especialidad,tb1.Sueldo_Trabajador,
case when tb1.Sueldo_Trabajador <=1500 then 'Pago Bajo' when tb1.Sueldo_Trabajador  <=3000 then 'Pago Normal' when tb1.Sueldo_Trabajador <=6000 then 'Pago Destacado' end as 'Observación'
from Person.Jornada_Trabajador as tb1  join Person.Especialidad_Trabajador as tb2
on(tb1.Trabajador_Id_Especialidad = tb2.Id_Especialidad) join Person.Trabajador as tb3
on(tb1.Id_Trabajador = tb3.Id_Trabajador)
where Sueldo_Trabajador between '4000' and '5000'


exec sp_sueldo 
--externo
select *  from Person.Jornada_Trabajador

select tb1.Id_Trabajador ,tb3.Nombre_Trabajador,tb3.Apellido_Trabajador, tb2.Especialidad,tb1.Sueldo_Trabajador
into Fin_Trabajo
from Person.Jornada_Trabajador as tb1  join Person.Especialidad_Trabajador as tb2
on(tb1.Trabajador_Id_Especialidad = tb2.Id_Especialidad) join Person.Trabajador as tb3
on(tb1.Id_Trabajador = tb3.Id_Trabajador)
where   Fin_Trabajador  like '2021-08-30'


exec sp_Fin_Trabajo '2021-08-30'

select  * from  Fin_Trabajo

-- drop exec 

-- rellenadas
select * from Libro.General

select tb1.Id_Libro,tb1.Titulo_Libro,concat_ws(' ' ,tb2.Nombre_Autor,tb2.Apellido_Autor)  as 'Nombre Completo',tb3.Editorial,
tb4.Genero,tb5.Estado,tb5.Precio
from  Libro.General as tb1 join Libro.Autor as  tb2
on(tb1.Libro_Id_Autor = tb2.Id_Autor) join Libro.Editorial as tb3
on(tb1.Libro_Id_Editoral = tb3.Id_Editorial) join  Libro.Genero as tb4
on(tb1.Libro_Id_Genero = tb4.Id_Genero) join Libro.Estado as tb5
on(tb1.Libro_Id_Estado = tb5.Id_Estado) 

--trabajador

select * from Person.Jornada_Trabajador

select *  from Person.Trabajador


select tb1.Id_Trabajador,CONCAT_WS(' ',tb2.Nombre_Trabajador,tb2.Apellido_Trabajador) as 'Nombre Completo',
tb2.Dni_Trabajador,case tb2.Genero_Trabajador when 'M' then 'Masculino' when 'F' then 'Femenino' end  as 'Genero_Trabajador',tb1.Sueldo_Trabajador,tb1.Frecuencia_Trabajador,tb1.Inicio_Trabajador,tb1.Fin_Trabajador,
tb1.Entrada_Trabajador,tb1.Salida_Trabajador
from Person.Jornada_Trabajador as  tb1 join  Person.Trabajador as tb2
on(tb1.Id_Trabajador = tb2.Id_Trabajador)

-- Prestamo

select * from Prestamo.Libro

select *  from Person.Especialidad_Trabajador

select Concat_ws(' ' ,tb2.Nombre_Alum,tb2.Apellido_Alum) as 'Nombre Alumno' , tb2.Dni_Alum,
tb4.Titulo_Libro,CONCAT_WS(' ',tb3.Nombre_Trabajador,tb3.Apellido_Trabajador ) as ' Nombre Trabajador', tb5.Especialidad,
tb1.Fecha_Prestamo,tb1.Fecha_Devolucion
from Prestamo.Libro as tb1 join Person.Alumno as tb2
on(tb1.Prestamo_Id_Alum = tb2.Id_Alum) join Person.Trabajador as tb3
on(tb1.Prestamo_Id_Trabajador = tb3.Id_Trabajador) join Libro.General as tb4
on(tb1.Prestamo_Id_Libro = tb4.Id_Libro)  join Person.Especialidad_Trabajador as tb5
on(tb3.Id_Trabajador = tb5.Id_Especialidad)

select  *  from Compra.Libro

select CONCAT_WS(' ' ,tb2.Nombre_Alum,tb2.Apellido_Alum) as 'Nombre Alumno' , tb2.Dni_Alum,tb3.Titulo_Libro,
concat_ws(' ' ,tb4.Nombre_Trabajador,tb4.Apellido_Trabajador) as 'Nombre Trabajador',tb7.Especialidad,tb6.Precio,tb5.Nombre_TipoPago,
tb1.Fecha_Compra
from Compra.Libro as tb1  join  Person.Alumno as tb2
on(tb1.Compra_Id_Libro = tb2.Id_Alum) join  Libro.General as tb3
on(tb1.Compra_Id_Libro = tb3.Id_Libro) join Person.Trabajador as  tb4
on(tb1.Compra_Id_Trabajador = tb4.Id_Trabajador) join Compra.TipoPago as tb5
on(tb1.Compra_Id_TipoPago = tb5.Id_TipoPago) join Libro.Estado as tb6
on(tb3.Libro_Id_Estado = tb6.Id_Estado) join Person.Especialidad_Trabajador as tb7
on(tb4.Id_Trabajador = tb7.Id_Especialidad)

--Cantidad de Alumnos
select COUNT(*) as 'Cantidad' from Person.Alumno
select COUNT(*) as 'Cantidad Libro' from Libro.General
select COUNT(*) as  'Cantidad Trabajadores' from Person.Trabajador

--Cons criterios

select concat_ws(' ' ,tb1.Nombre_Trabajador,tb1.Apellido_Trabajador) as ' Nombre Completo',tb2.Nombre_dist
from Person.Trabajador as tb1 join GeneDistric.Distritos as  tb2
on(tb1.Trabajador_Id_dist = tb2.Id_dist)
where  tb2.Nombre_dist like 'C%'


select concat_ws(' ' ,tb1.Nombre_Trabajador,tb1.Apellido_Trabajador) as ' Nombre Completo',Corre_Trabajador
from Person.Trabajador as tb1 join Person.Corre_Trabajador as tb2
on(tb1.Id_Trabajador = tb2.Id_Trabajador)
where Corre_Trabajador like '%hotmail%'  -- outlook

select tb2.Titulo_Libro, COUNT (*)  as 'CANTIDAD DE LIBROS PRESTADOS'
from Prestamo.Libro as tb1 join Libro.General as tb2
on (tb1.Prestamo_Id_Libro= tb2.Id_Libro)
group by tb2.Titulo_Libro

select *
from Person.Jornada_Trabajador
where DAY(Fin_Trabajador) >=20 and DAY(Fin_Trabajador) <=23

-- Tiempo_Prestamo
select concat(tb1.Prestamo_Id_Alum,tb1.Prestamo_Id_Libro,tb1.Prestamo_Id_Trabajador) as 'Codigo_Tiempo_Prestamo',
day(tb1.Fecha_Prestamo) as 'DIA' , MONTH(tb1.Fecha_Prestamo) as 'MES' , YEAR(tb1.Fecha_Prestamo) as 'AÑOS'
from Prestamo.Libro as tb1

select concat(tb1.Prestamo_Id_Alum,tb1.Prestamo_Id_Libro,tb1.Prestamo_Id_Trabajador) as 'Codigo_Tiempo_Devolucion',
day(tb1.Fecha_Devolucion) as 'DIA' , MONTH(tb1.Fecha_Devolucion) as 'MES' , YEAR(tb1.Fecha_Devolucion) as 'AÑOS'
from Prestamo.Libro as tb1




select * from Prestamo.Libro


select  *  from Person.Jornada_Trabajador

select *
from(
select row_number() over (order by Id_Libro desc ) as Contador,tb1.Id_Libro,tb1.Titulo_Libro,concat_ws(' ',tb2.Nombre_Autor,tb2.Apellido_Autor) as 'Nombre_Completo_Autor',tb3.Editorial,tb4.Genero,tb5.Estado
from Libro.General  as tb1 join Libro.Autor as tb2
on(tb1.Libro_Id_Autor = tb2.Id_Autor) join Libro.Editorial as tb3
on(tb1.Libro_Id_Editoral = tb3.Id_Editorial) join Libro.Genero as tb4
on(tb1.Libro_Id_Genero = tb4.Id_Genero) join Libro.Estado as tb5
on(tb1.Libro_Id_Genero = tb5.Id_Estado)) as a
where Contador like 5

select *  from Libro.General


--Alumnos x 
select tb1.Nombre_Alum, COUNT(*) as 'Cantidad de Libro'
from Person.Alumno as tb1 join Prestamo.Libro as tb2
on(tb1.Id_Alum = tb2.Prestamo_Id_Alum)
group by tb1.Nombre_Alum

select *  from Prestamo.Libro

select * from Libro.AUTOR 

select tb1.Id_Autor,CONCAT_WS(' ' ,tb1.Nombre_Autor,tb1.Apellido_Autor) as 'Nombre Completo' ,
tb1.Fecha_Nac_Autor,tb2.Nacionalidad
from Libro.Autor as tb1 join Nacionalidad.Autor as tb2
on(tb1.Autor_Id_Nacionalidad = tb2.Id_Nacionalidad)






select Id_Trabajador,convert(decimal(5,2),month(tb1.Fin_Trabajador)/tb1.Sueldo_Trabajador) as 'x'
from Person.Jornada_Trabajador as tb1





--Copia de Seguridad
Backup database Bibliotecaria2021
to disk = 'C:\Users\Usuario\Desktop\xs.txt'

--agregando columna a la tabla
alter table GeneDistric.Distritos add fecha  date;
--alteramos el nombre de una colummna dentro de la tabla
alter table GeneDistric.Distritos alter column fecha varchar(10);
--eliminar una columna 
alter table GeneDistric.Distritos  drop column fecha;

select * from GeneDistric.Distritos
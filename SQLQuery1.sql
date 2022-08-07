--Sentencia de DDL(Crear.Modificar,Borrar BD,Tablas)
-- Data Definition Language(Lenguaje de definicion de datos)
-- Crear una BD 

create database bd_matricula 
go 
-- para finalizar el comando

use bd_matricula -- en uso (Poner en uso la base de datos)
go

-- id int not null auto_increment primary key 

create table tb_distrito(
    codigo_distrito char(5) not null primary key,  -- que no puede estar vacio-- tenemos el char y el varchar para texto, char cuando tiene una longitud fija de caractes.
    nombre_distritos varchar(40) not null 
)
go


create table tb_carrera(
    codigo_carrera char(5) not null,
    nombre_carrera varchar(40) not null,
    duracion_carrera integer
)
go

alter table tb_carrera add primary key(codigo_carrera)
go

-- Llave Forranea(Foreign key)
create table tb_alumno(
    codigo_alumno  char(5) not null primary key,
    nombre varchar(25) not null,
    apellido varchar(25) not null,
    dni char(8) not null,
    fecha_nac date,
    genero char(1),
    direccion varchar(50),
    alumno_codigo_distrito char(5) not null foreign key references tb_distrito(codigo_distrito), --puede ser el mismo tipo el campo que se comnuca
    telefono varchar(11),
    correo varchar(50)

)
go

create table tb_curso(
    codigo_curso char(5) not null,
    nombre_curso varchar(40) not null,
    curso_codigo_carrera char(5) not null 
)
go

alter table tb_curso add primary key(codigo_curso)
go

alter table tb_curso add  foreign key(curso_codigo_carrera) 
references tb_carrera(codigo_carrera)
go


-- drop database bd_ go (Para eliminar todo)
--drop table tb_  go 


-- startuml 
-- workbench  (Son para hacer modelados)

create table tb_especialidad(
	codigo_esp char(5) not null primary key,
	descripcion_especi varchar(40) not null
)
go



create table tb_docente(
    codigo_docente  char(5) not null primary key,
    nombre varchar(25) not null,
    apellido varchar(25) not null,
    dni char(8) not null,
    fecha_nac date,
    genero char(1),
    direccion varchar(50),
    docente_codigo_distrito char(5) not null foreign key references tb_distrito(codigo_distrito), --puede ser el mismo tipo el campo que se comnuca
    telefono varchar(11),
    correo varchar(50),
	docente_codigo_especialidad char(5) not null foreign key references tb_especialidad(codigo_esp)

)
go

--Tabla de Seccion
create table tb_seccion(
	codigo_seccion char(5) not null primary key,
	descripcion varchar(15) not null
)
go
-- Crear tabla de Seccion por Alumno
create table tb_seccion_poralumno(
	spa_codigo_seccion char(5) not null,
	spa_codigo_alumno char(5) not null,
	fecha_matricula date,
	estada char(1)
)
go

alter table tb_seccion_poralumno add primary key (spa_codigo_seccion,spa_codigo_alumno) -- combinacion de los dos para una llave primaria 

go

alter table tb_seccion_poralumno add foreign key(spa_codigo_seccion)references tb_seccion(codigo_seccion)

go

alter table tb_seccion_poralumno add foreign key(spa_codigo_alumno)references tb_alumno(codigo_alumno)

go


create table tb_seccion_pordocente(
	spd_codigo_seccion char(5) not null,
	spd_codigo_curso char(5) not null,
	spd_codigo_docente char(5) not null,
	frecuencia varchar(20),
	fecha_ini date,
	fecha_fin date
	
)
go


alter table tb_seccion_pordocente add primary key (spd_codigo_seccion,spd_codigo_curso,spd_codigo_docente) -- combinacion de los tress para una llave primaria 

go

alter table tb_seccion_pordocente add foreign key(spd_codigo_seccion)references tb_seccion(codigo_seccion)

go

alter table tb_seccion_pordocente add foreign key(spd_codigo_curso)references tb_curso(codigo_curso)

go

alter table tb_seccion_pordocente add foreign key(spd_codigo_docente)references tb_docente(codigo_docente)

go

--Crear table Notas

create table tb_notas(
	nota_codigo_seccion char(5) not null,
	nota_codigo_alumno char(5) not null,
	nota_codigo_curso char(5)not null,
	parcial numeric(5,2), -- quiere decir 12345,00
	final numeric(5,2),
	proyecto numeric(5,2),
	fecha_registro date
	
)
go

alter table tb_notas add primary key (nota_codigo_seccion,nota_codigo_alumno,nota_codigo_curso) -- combinacion de los tress para una llave primaria 

go

alter table tb_notas add foreign key(nota_codigo_seccion)references tb_seccion(codigo_seccion)

go

alter table tb_notas add foreign key(nota_codigo_alumno)references tb_alumno(codigo_alumno)

go
alter table tb_notas add foreign key(nota_codigo_curso)references tb_curso(codigo_curso)

go


-- id int not null auto_increment primary key

------------------------------
--Sentencia DML(Seleccionar,Insertar,Actualizar,Eliminar Registro)
--Data Manipulacion Language(Lenguaje de maniputalcion de datos)

--Insertar registros
-- Tabla Distritos

--Forma 1
-- En esta forma se puede cambiar el orden 
-- ejemplo ('Lima','D0001')
insert into tb_distrito (codigo_distrito,nombre_distritos) -- primer y segundo  
values ('D0001' , 'Lima')
go

--Forma 2 

insert into tb_distrito values('D0002','Callao')
go

--Forma 3 
insert into tb_distrito values
('D0003','Los Olivos'),
('D0004','Comas'),
('D0005','San Martin de Porres')
go
insert into tb_distrito values 
('D0006','Barranco'),
('D0007','Bre�a'),
('D0008','Carabayllo'),
('D0009','Ate'),
('D0010','Miraflores'),
('D0011','Santa Rosa'),
('D0012','Surquillo'),
('D0013','Villa el Salvador'),
('D0014','Santiago de Surco'),
('D0015','Puente Piedra')
go

-- Recuperar o mostrar registros
select * from tb_distrito
go

-- Tabla de Alumnos
-- Insertar registros
select * from tb_alumno
go

insert into tb_alumno values
('A0001','Roxana','Castilla','45783256','10-15-2000','F',null,'D0001',null,'castillo@senati.pe')

go




insert into tb_alumno values -- (10)
('A0002','Maria','Torres','12457896','10-02-2000','F',null,'D0002','984578943','maria123@senati.pe'),
('A0003','Juan','Huamani','56892356','07-09-2002','M','Av.El Sol 251','D0004',null,'juan@senati.pe'),
('A0004','Lucas','Oscar','36985214','05-10-2001','M',null,'D0003','987653578',null),
('A0005','Ana','Mallqui','45612389','11-11-2003','F','Av.ElGiralsol 125','D0001','978544678','anamallqui@senati.pe')

go

insert into tb_alumno values
('A0006','Gustavo','Ruiz','65612259','05-09-2003','M','Av.LaFuente 100','D0001','978544678','anamallqui@senati.pe'),
('A0007','Juana','Sanchez','45612378','02-15-2000','F',null,'D0010',null,'juana@senati.pe'),
('A0008','Mario','Castro','95451259','10-02-2001','M','Av.Costa 189','D0012','997461257',null),
('A0009','Luigui','Castillo','25652259','05-09-2003','M','Av.LaFuente 100','D0001','978544678','anamallqui@senati.pe'),
('A0010','Gustavo','Ruiz','65612259','12-08-2000','M',null,'D0009','978544678','gustavo123@senati.pe'),
('A0011','Jesus','Miranda','25612269','01-12-2001','M','Av.LaPuente 160','D0007','978544328','jesus@senati.pe'),
('A0012','Flor','Soria','65522269','12-08-2002','F','Av.LosPinos 250','D0002','972244328','flor4578@senati.pe'),
('A0013','Luz','Franco','85522269','07-10-2001','F',null,'D0002','972244384',null),
('A0014','Rodrigo','D�az','75982269','09-04-2003','M','Av.Triangulo 050','D0004','972567432','rodrigos456@senati.pe'),
('A0015','Jairo','Rojas','25982165','10-10-2001','M',null,'D0015','989267432','jairo4578@senati.pe'),
('A0016','Cielo','Matos','96482165','02-20-2002','F',null,'D0012','999667538',null),
('A0017','Josue','Palomino','65982865','05-02-2000','M','Av.SantaRosa 123','D0010','915264532',null),
('A0018','Alex','Pinos','96985825','01-12-2000','M',null,'D0009','985252232','alex@senati.pe'),
('A0019','Rafael','Genebroso','85982565','04-02-2000','M','Av.PuenteChico 154','D0002','949252111',null)

go


--Tabla Secci�n
alter table tb_seccion alter column descripcion varchar(18) not null
go

select * from tb_seccion --(4 mas
go

insert into tb_seccion values
('S0001','PIAD-201 Grupo 1'), -- ingeniera 
('S0002','PIAD-202 Grupo 2'), -- desarrollo de sofware
('S0003','PSDS-201 Grupo 1'),
('S0004','PSDS-202 Grupo 2')
go


insert into tb_seccion values

('S0005', 'CGEU-301 Grupo 1'),--
('S0006', 'CGEU-302 Grupo 2'),
('S0007', 'SPSU-301 Grupo 1'),
('S0008', 'SPSU-302 Grupo 2')
go




--Tabla de Seccion por Alumno

select *  from tb_seccion_poralumno
go

--(8 reg.mas y 2 sin matricular

insert into tb_seccion_poralumno values

('S0001','A0001','03-20-2020','A'),
('S0001','A0002','03-28-2020','A'),
('S0001','A0003','03-11-2020','A'),
('S0002','A0004','03-04-2020','A'),
('S0002','A0005','03-08-2020','A'),
('S0003','A0006','03-15-2020','A'),
('S0003','A0007','03-01-2020','A'),
('S0004','A0008','03-18-2020','A'),
('S0004','A0009','03-20-2020','A'),
('S0005','A0010','03-05-2020','A'),
('S0005','A0011','03-09-2020','A'),
('S0006','A0018','03-22-2020','A'),
('S0006','A0013','03-08-2020','A'),
('S0007','A0019','03-09-2020','A'),
('S0007','A0015','03-15-2020','A'),
('S0008','A0016','03-08-2020','A'),
('S0008','A0017','03-11-2020','A')


go
--12 , 14


-- Tabla de carrera

select* from tb_carrera
go

insert into tb_carrera values
('C0001','Inteligencia Artificial',3),
('C0002','Desarrollo de Software',3),
('C0003','Administraci�n de Base de Datos',3)

go

-- Tabla de Curso  (completar los demas
select  * from tb_curso 
go

insert into tb_curso values

('CR001','Algoritmia con Python','C0001'),
('CR002','Lenguaje de Programaci�n con Java','C0001'),
('CR003','Desarrollo Web I','C0001'),
('CR004','Fundamentos de Programaci�n','C0002'),
('CR005','Tecnolog�as Web','C0002'),
('CR006','Base y Estructura de Datos','C0003'),
('CR007','Sistema Operativos','C0003')
go



-- Tabla de Notas

select * from tb_notas   

go

insert into tb_notas values
('S0001', 'A0001','CR001', 14.5, 16, 18, '07-15-2020'),
('S0001', 'A0002','CR001', 12, 16, 10, '07-15-2020'),
('S0001', 'A0003','CR001', 15, 13, 18, '07-15-2020'),
('S0001', 'A0001','CR002', 14.5, 16, 18, '07-15-2020'),
('S0001', 'A0002','CR002', 14, 16, 19, '07-15-2020'),
('S0001', 'A0003','CR002', 12, 15, 20, '07-15-2020'),
('S0002', 'A0004','CR001', 09, 19, 18, '07-15-2020'),
('S0002', 'A0005','CR001', 08, 15, 10, '07-15-2020'),
('S0002', 'A0004','CR002', 17, 13, 17, '07-15-2020'),
('S0002', 'A0005','CR002', 13, 08, 20, '07-15-2020'),
('S0002', 'A0004','CR003', 08, 17, 18, '07-15-2020'),
('S0002', 'A0005','CR003', 15, 20, 18, '07-15-2020')
go

insert into tb_notas values

('S0003','A0006','CR004',14.5,16,18,'07-15-2020'),
('S0003','A0007','CR004',14.5,16,18,'07-15-2020'),
('S0003','A0006','CR005',14.5,16,18,'07-15-2020'),
('S0003','A0007','CR005',14.5,16,18,'07-15-2020'),
('S0004','A0008','CR006',14.5,16,18,'07-15-2020'),
('S0004','A0009','CR006',14.5,16,18,'07-15-2020'),
('S0004','A0008','CR007',14.5,16,18,'07-15-2020'),
('S0004','A0009','CR007',14.5,16,18,'07-15-2020'),
('S0005','A0010','CR004',null,null,null,'07-15-2020'),
('S0005','A0011','CR004',12.5,12,14,'07-15-2020'),
('S0005','A0010','CR005',null,null,null,'07-15-2020'),
('S0005','A0011','CR005',14.5,16,18,'07-15-2020'),
('S0006','A0018','CR001',null,null,null,'07-15-2020'),
('S0006','A0013','CR001',15.5,12.5,15.5,'07-15-2020'),
('S0006','A0018','CR002',null,null,null,'07-15-2020'),
('S0006','A0013','CR002',17,18,19,'07-15-2020'),
('S0007','A0019','CR002',null,null,null,'07-15-2020'),
('S0007','A0015','CR002',14.5,16,18,'07-15-2020'),
('S0007','A0019','CR003',null,null,null,'07-15-2020'),
('S0007','A0015','CR003',14.5,16,18,'07-15-2020'),
('S0008','A0016','CR004',14.5,16,18,'07-15-2020'),
('S0008','A0017','CR004',14.5,16,18,'07-15-2020'),
('S0008','A0016','CR005',14.5,16,18,'07-15-2020'),
('S0008','A0017','CR005',14.5,16,18,'07-15-2020'),
('S0007','A0016','CR006',14.5,16,18,'07-15-2020'),
('S0007','A0017','CR006',14.5,16,18,'07-15-2020'),
('S0007','A0016','CR007',14.5,16,18,'07-15-2020'),
('S0007','A0017','CR007',14.5,16,18,'07-15-2020')

go
-- 12,14

--Tabla Especialidad
select * from tb_especialidad
go

insert into tb_especialidad values
('E0001','Ing_Sistemas'),
('E0002','Ing_Electronica'),
('E0003','Contador'),
('E0004','Economia'),
('E0005','Maquinas Pesadas'),
('E0006','Administaci�n de Empresas'),
('E0007','Ciencias de la Comunicaci�n'),
('E0008','Comercio Internacional'),
('E0009','Dise�o Gr�fico'),
('E0010','Gesti�n Empresarial'),
('E0011','Derecho'),
('E0012','Rob�tica'),
('E0013','Recursos Humanos'),
('E0014','Bellas Artes'),
('E0015','Arquitectura')
go

--truncate table tb_especialidad Para cambiar si fallamos
--go

select * from tb_docente 
go


insert into tb_docente values 
('D0001','Miguel','Poblete','12467894','01-15-1979','M','Av.LosPinos 292','D0001','945656846','miguel@gmail.com','E0005'),
('D0002','Andr�s','Silva','45678942','05-20-1975','M','Av.Bolivia 546','D0008','945895346','andres1245@gmail.com','E0008'),
('D0003','Cristiano','Fuentes','26478954','01-15-1974','M','Av.LaMar 894','D0009','945456846','cristiano45@gmail.com','E0012'),
('D0004','Ana','Flores','78945613','01-15-1982','F','Av.Sucre 254','D0012','945614587','ana897@gmail.com','E0001'),
('D0005','Eva','Reyes','25461276','01-15-1972','F','Av.Tacna 875','D0015','912695632','evareyes12@gmail.com','E0002'),
('D0006','Hugo','Castro','89456126','01-15-1983','M','Av.Universitaria 542','D0005','925655646','hugo456@gmail.com','E0007'),
('D0007','Luz','Molina','32146321','01-15-1981','F','Av.Ricado Palma 756','D0004','947562462','molina_12@gmail.com','E0010'),
('D0008','Sara','Vega','59546127','01-15-1972','F','Av.Sim�n Bolivar 478','D0009','959632346','vega_456@gmail.com','E0015'),
('D0009','Emma','Parra','91546782','01-15-1983','F','Av.Naranjal 213','D0012','925612598','ema_4567@gmail.com','E0014'),
('D0010','Gabriel','Romero','21479642','01-15-1985','M','Av.M�xico 125','D0014','955617865','gabriel457@gmail.com','E0008'),
('D0011','Isabel','Bravo','84216792','01-15-1981','F','Av.Abancay 564','D0011','945689566','isabel_456@gmail.com','E0003'),
('D0012','Jorge','Ortega','92465494','01-15-1978','M','Av.Venezuela 478','D0007','941542346','jorge124@gmail.com','E0005'),
('D0013','Isabel','Alvarado','82697894','01-15-1977','F','Av.Espa�a 785','D0010','925619846','alvarado_456@gmail.com','E0006'),
('D0014','Martina','S�ez','65412389','01-15-1971','F','Av.Miguel Grau 235','D0002','998412346','martina_saenz@gmail.com','E0009'),
('D0015','Eduardo','Donoso','85236974','01-15-1985','M','Av.Guardia Civil 452','D0003','984627346','donoso456@gmail.com','E0011')

go

select * from tb_seccion_pordocente
go

insert into tb_seccion_pordocente values 
('S0001','CR001','D0001','Lun-Mie','03-01-2020','11-30-2020')


go

insert into tb_seccion_pordocente values 
('S0001','CR002','D0001','Lun-Mie','03-01-2020','11-30-2020'),
('S0001','CR003','D0001','Lun-Mie','03-01-2020','11-30-2020'),
('S0002','CR003','D0002','Lun-Mie','03-01-2020','11-30-2020'),
('S0002','CR004','D0002','Lun-Mie','03-01-2020','11-30-2020')
go

insert into tb_seccion_pordocente values
('S0003','CR005','D0003','Lun-Mie','03-01-2020','11-30-2020'),
('S0003','CR004','D0003','Lun-Mie','03-01-2020','11-30-2020')

go

go
--Consultas
-- La instrucci�n select permite recuperar los registros(filas)
-- de una tabla

-- Lista toda la informaci�n  de la tabla de alumno

select * from tb_notas 
go
-- Listar algunos campos de la tabla alumno
select codigo_alumno,apellido,nombre,fecha_nac,alumno_codigo_distrito -- indicas que tablas deseas ver
from tb_alumno
go

select * from tb_alumno
go
-- Ordenar por un campo: apellido -- asc descendente -- desc descendete
select * from tb_alumno order by nombre asc
go

-- Ordenar por varios campos:genero de forma descendente y luego por apellido de forma ascendente
select * from tb_alumno order by genero asc,apellido desc -- el que madna es el primero
go

-- Usando del n�mero de orden del campo
select * from tb_alumno order by 6  asc,3 desc -- puedes poner el numero que es la columna
go

--Relaciones
-- iner join o join
-- tb1 inner join tb2 on(campo1 ==campo 2)
-- Listar codigo, apellido,nombre y nombre de distrito de las tablas alumno y distrito

-----------Tabla de descripcion del alumno-----------------
select codigo_alumno,apellido,nombre,fecha_nac,nombre_distritos ,genero
from tb_alumno inner join tb_distrito
on(alumno_codigo_distrito = codigo_distrito)
go

-- Listar de descripciones
-- as como
 -- select *  para ayuda
 select descripcion , fecha_matricula , estada

from tb_seccion_poralumno as tb1 join tb_seccion as tb2
on(tb1.spa_codigo_seccion = tb2.codigo_seccion)

go


-- Listar descripcion  de la seccion, nombre y apellido del alumno,
-- nombre del distrito,fecha de matricula y estado
-- de la tablas Seccion por alumno,Seccion , alumno y Distrito

--select nombre ,  fecha_matricula , estada 
--from tb_seccion_poralumno as tb1 join tb_alumno as tb2
--on(tb1.spa_codigo_alumno = tb2.codigo_alumno)
--go

------------------Tabla del alumno -----------------------------
select * from tb_seccion_poralumno
go
select * from tb_alumno

select descripcion , nombre,apellido,nombre_distritos ,fecha_matricula , estada ,dni

from tb_seccion_poralumno as tb1 join tb_seccion as tb2
on(tb1.spa_codigo_seccion = tb2.codigo_seccion) join tb_alumno as tb3
on(tb1.spa_codigo_alumno = tb3.codigo_alumno) join tb_distrito as tb4
on(tb3.alumno_codigo_distrito = tb4.codigo_distrito)
order by nombre_distritos asc , apellido asc
go



--------------Tabla de Docente (Hecho por m�)---------
select * from tb_seccion_pordocente
select * from tb_docente
select * from tb_curso
select * from tb_seccion

select descripcion , nombre ,apellido, dni, correo , genero, nombre_curso ,nombre_distritos ,nombre_carrera ,duracion_carrera
from tb_seccion_pordocente as tb1 join tb_seccion as tb2
on(tb1.spd_codigo_seccion = tb2.codigo_seccion) join tb_curso as tb3
on(tb1.spd_codigo_curso = tb3.codigo_curso) join tb_docente as tb4
on(tb1.spd_codigo_docente = tb4.codigo_docente) join tb_distrito as tb5
on(tb4.codigo_docente = tb5.codigo_distrito)  join tb_carrera as tb6
on (tb3.curso_codigo_carrera = tb6.codigo_carrera)

order by descripcion asc , nombre asc

go


---------------- Del profesor (Tabla del docente)-----------------

select * from tb_seccion_pordocente
go


select descripcion,nombre_curso,nombre,apellido,frecuencia,fecha_ini
from tb_seccion_pordocente as tb1 join tb_docente as tb2
on(tb1.spd_codigo_docente = tb2.codigo_docente) join tb_seccion tb3
on(tb1.spd_codigo_seccion = tb3.codigo_seccion) join tb_curso tb4
on(tb1.spd_codigo_curso = tb4.codigo_curso) 

go

-- Listar las notas 
select * from tb_notas
go

select * from tb_notas
go
select  parcial, final, proyecto , convert(decimal(5,2),0.4 * parcial + 0.4 * final + 0.2 * proyecto) as 'promedio' 
from tb_notas  -- as alias
go

-------------- Tabla de notas-------------------------

select parcial,final,proyecto ,convert(decimal(5,2),0.4 * parcial + 0.4 * final + 0.2 * proyecto) as 'promedio', descripcion,nombre,apellido,nombre_curso , nombre + ' ' + apellido as 'Nombre completo'  , concat(apellido,' '  , nombre , '   ' ,fecha_nac) as ' alumno'  
from tb_notas as tb1 join tb_seccion as tb2
on(tb1.nota_codigo_seccion = tb2.codigo_seccion) join tb_alumno tb3
on(tb1.nota_codigo_alumno = tb3.codigo_alumno) join tb_curso tb4
on(tb1.nota_codigo_curso = tb4.codigo_curso) --join tb_carrera tb5
--on(tb4.codigo_curso = tb5.codigo_carrera)

go
 select  * from tb_curso 
 go

-- Calcular el promedio : 40%(Parcial) 40%(Parcial) 20%(Parcial)

select  parcial, final, proyecto , convert(decimal(5,2),0.4 * parcial + 0.4 * final + 0.2 * proyecto) as 'promedio' 
from tb_notas  -- as alias
go



-- Mostrar nombre y apellido del alumno en un solo campo 


-- Forma 1
select  telefono ,apellido + ' ' +nombre as  'alumno' 
from tb_alumno
go

select * from tb_notas
go



-- Forma 2

select codigo_alumno , concat(apellido,' '  , nombre , '   ' ,fecha_nac) as ' alumno' -- para poner concatenar o unir
from tb_alumno
go



-- Funciones de agregado : count()( PARA CONTAR), suma()(PARA SUMAR) , avg()(PROMEDIAR) ,max()(MAXIMO VALOR) , min()(MINIMO VALOR)
-- Cantidad de alumnos


select count(*) as 'Cantidad' from  tb_alumno
go

select * from tb_notas
go

-- Cantidad de notas 
select count(*) as 'Cantidad' from tb_notas
go


-- Sumar todas las notas del parcial ,Final , proyecto
select   sum(parcial) as 'Cantidad de Parcial',
		 sum(final) as 'Cantidad de Final',
		 sum(proyecto) as 'Cantidad de Proyecto' from tb_notas
go


-- Promedio de las notas del parcial.final y proyecto
select   avg(parcial) as 'Promedio de Parcial',
		 avg(final) as 'Promedio de Final',
		 avg(proyecto) as 'Promedio de Proyecto' from tb_notas
go


-- Maxima y Minima nota del parcial
select   max(parcial) as 'Max Parcial' , (count(parcial))  , min(parcial) as 'Min Parcial',
		 max(final) as ' Max Final',min(final) as 'Min Final',
		 max(proyecto) as 'Max de Proyecto' , min(proyecto) as 'Max Final' 
		 from tb_notas
go






-- Consultas con criterios-------------
---Listar solo alumno varones       where campo operador valor
select * from tb_alumno where  genero = 'M'
go
-- Listar solo alumnos mujeres
select * from tb_alumno where genero = 'F'
go
-- Para encontar un caracter
select * from tb_alumno where direccion = 'Av.ElGiralsol 125'
go

-- Listar con los alumnos cuyo apellido inicia con la letra c
select * from tb_alumno
go  --% el porcen es cuando no sabes que viene

select * from tb_docente where apellido like 'A%'
go

select * from tb_docente where apellido like '%'
go

-- Listar los alumnos cuyo apellidos termina con s
select * from tb_docente where apellido like not '%s'
go

select * from tb_alumno where genero like 'F%' 
go
--Listar los alumnos cuyo correo sea de gmail(contenido)
select * from tb_docente where correo like '%gmail%'
go

-- Listar los docentes  cuyo apellido inicia con M o R

select * from tb_docente where apellido like 'M%' or apellido like 'R%' and genero like 'F'
go


-- Forma las rapidas
select * from tb_docente
where apellido like '[CR]%' and genero like 'M' and direccion  like 'Av.U%'
go

select * from tb_docente
where apellido like '%[os]'
go

select * from tb_alumno
-----------------------
--Listar codigo,apellido,nombre y nombre de distrito
-- de la tablas alumno,distrito,cuyo apellido inicie con 'H' o 'O'
--y su distrito termine en 2 's'

select codigo_alumno,apellido,nombre,fecha_nac,nombre_distritos ,genero
from tb_alumno as tb1 inner join tb_distrito as tb2
on(tb1.alumno_codigo_distrito = tb2.codigo_distrito)
where tb1.apellido like '[HO]%' and  tb2.nombre_distritos like '[Comas Los Olivos]%'--tb2.nombre_distritos in ('Comas','Los Olivos')   -- and tb1.fecha_nac like '2002%'--and tb1.nombre like 'Juan'
--Para encontrar a uno --
--where tb1.genero like 'F'  
go


----Listar las notas del parcial que sean superiores a 11

select * from tb_notas   
where parcial >11
go
-- listas las notas del proyecto a partir de 14
select * from tb_notas
where proyecto >= 14 and parcial >11  and final >=15
go
--
select * from tb_notas
where final >=14 and final <=16
go

--Forma corta (pero entre )
select * from tb_notas
where final between 14 and 16 -- between(entre)
go

--------------Listar las notas del curso con codigo 'CR001' Y 'CR002'
select * from tb_notas
where nota_codigo_curso in ('CR001','CR002')
go
--


-- Listar los docentes que viven en un distrito que inicia con 'L'
-- (SELECT ANIDADO)
select * from tb_docente
go
select * from tb_distrito
go

select * from tb_docente
where docente_codigo_distrito in 
(select codigo_distrito from tb_distrito where nombre_distritos like 'L%')
go

select * from tb_distrito
go
-- (select ---
select  tb1. *
from tb_docente as tb1 join tb_distrito as tb2
on(tb1.docente_codigo_distrito =tb2.codigo_distrito)
where tb2.nombre_distritos like 'L%'
go


-- Listar las notas de los cursos de la carrera de Ing.de SOf con Ia
select * from tb_curso
go
select * from tb_carrera
go
select * from tb_notas 
where  nota_codigo_curso in(select codigo_curso from tb_curso
where curso_codigo_carrera in(select codigo_carrera from tb_carrera
where nombre_carrera like 'Int%'))
go

go 
select codigo_carrera from tb_carrera
where nombre_carrera like 'Int%'
go

select * from tb_notas
go
-----------------------


select * from tb_curso
go

----------------fora 2

select tb1.* 
from tb_notas as tb1 join tb_curso as tb2
on(tb1.nota_codigo_curso = tb2.codigo_curso) join tb_carrera tb3
on(tb2.curso_codigo_carrera = tb3.codigo_carrera)
where tb3.nombre_carrera like 'Int%'
go



-------------

-- Mostrar las cantidad de damas
select count(*) 'Cantidad de Damas' from tb_alumno
where  genero = 'F'
go


select count(*) as 'Cantidad de Varones' from tb_alumno
where genero = 'M'
go
-- Mostar la cantidad de alumnos en el distritos del Callao
select  count(*) as 'Cantidad' from tb_alumno as tba join tb_distrito as tbd
on(tba.alumno_codigo_distrito =tbd.codigo_distrito)
where nombre_distritos ='Lima'
go


-- Mostar la cantidad de notas para los cursos de  IA

select * from tb_notas
go

select * from tb_curso
go

select * from tb_carrera
go

select count(*) as 'Cantidad de notas de IA'
from tb_notas as tb1 join tb_curso as tb2
on(tb1.nota_codigo_curso = tb2.codigo_curso) join tb_carrera as tb3
on(tb2.curso_codigo_carrera = codigo_carrera)
where nombre_carrera = 'Inteligencia Artificial'
 
go


---------------------------------
-- Del profesor Mostrar cantidad de Carrera de Inteligencia

select count(*) as 'Cantidad' 
from tb_notas as tb1 join tb_curso as tb2
on(tb1.nota_codigo_curso = tb2.codigo_curso) join tb_carrera tb3
on(tb2.curso_codigo_carrera = tb3.codigo_carrera)
where tb3.nombre_carrera like 'Int%'
go


--- Agrupar por  g�nero y mostar la cantidad 
select * from tb_docente
go

select genero,count(*) as 'Cantidad' from tb_docente  -- group by (agrupaor por 
group by  genero
go

-- Agrupar por especialidad  y mostrar  la caantidad 
select  descripcion_especi ,count(*)  as 'Cantidad'
from tb_docente as tb1 join tb_especialidad as tb2
on(tb1.docente_codigo_especialidad = tb2.codigo_esp)
group by  descripcion_especi
go 

select * from tb_especialidad
go
-- Cantidad de notas por cursos
select * from tb_notas
go
select * from tb_curso
go

select nombre_curso, count(*) as 'Cantidad'
from tb_notas as tb1 join tb_curso as tb2
on (tb1.nota_codigo_curso = tb2.codigo_curso)
group by nombre_curso
go

select nombre_curso ,count(*) as 'Cantidad'
from tb_notas as tb1 join tb_curso as tb2
on (tb1.nota_codigo_curso = tb2.codigo_curso)
group by nombre_curso
go

--------------------Mostrar la cantidad  de notas por curso
-- Mostrar el valor maximo y minimo  de las notas por curso
select nombre_curso  as 'Curso', max(parcial) as 'Maximo Parcial',min(parcial) as 'Minimo Parcial'
from tb_notas as tb1 join tb_curso as tb2
on(tb1.nota_codigo_curso = tb2.codigo_curso)
group by nombre_curso
go

-- Nivel de grupo

select nombre_curso  as 'Curso', max(parcial) as 'Maximo Parcial',min(parcial) as 'Minimo Parcial'
from tb_notas as tb1 join tb_curso as tb2
on(tb1.nota_codigo_curso = tb2.codigo_curso)
group by nombre_curso
having min(parcial) >=11  -- having es par acondiciones a nivel de grupo
go

select * from tb_notas
go

---Para manejos de fechas  (para la fecha que quieres)
-- Mostrar los alumnos que nacieron a partir del a�o 2000
select *
from tb_alumno
where fecha_nac >='2000-01-01'
go

select * 
from tb_alumno  -- year(a�o)  day (dia)-- month (meses)
where year (fecha_nac) >=10
go
-- Mostrar los alumnos que nacieron en el primer trimestre
select *
from tb_alumno
where month(fecha_nac) >=1 and month(fecha_nac)<=3
go

select *
from tb_alumno
where month(fecha_nac) between 1 and 3
go
select *
from tb_alumno
where month(fecha_nac) in(1,2,3)
go




----------------------------
--- Mostar los alumnos que nacieron  




--------Mostar los alumnos con el campo genero completo
-- case (varios casos) when(cuando es ) then(poner)
-- Primera variante:
select codigo_alumno,concat(apellido,' ',nombre) as 'Alumno',
	fecha_nac,
	case genero when 'M' then 'Masculino'
				when 'F' then 'Femenino' end as 'genero'
from tb_alumno
go
--- Segunda variante:
--Mostar una observacion seg�n el valor del proyecto
--* Desaprobado hasta 10.4
--* Aprobado hasta 14
--* Destacado hasta 18
--* Excelente hasta 20
-- Caso realizado por Mi
select concat(apellido,' ',nombre) as 'Alumno', proyecto,
			 case when proyecto <=10.4 then 'Desaprobado'
			 when proyecto <=14 then 'Aprobado'
			 when proyecto <=18 then 'Destacado'
			 when proyecto <=20 then 'Excelencia' 
			 else 'No tiene nota' end as 'Observaci�n' ,
			 case genero when 'M' then 'Masculino'
				when 'F' then 'Femenino' end as 'genero'

from tb_notas as tb1 join tb_alumno as tb2
on(tb1.nota_codigo_alumno = tb2.codigo_alumno)
go

select * from tb_curso
go
select * from tb_notas
go

select * from tb_carrera
go

select * from tb_seccion
go
-----


select descripcion as 'Seccion',concat(apellido,' ',nombre) as 'Nombre del Alumno',nombre_curso as 'Curso',  nombre_carrera as 'Carrera', proyecto as 'Proyecto',
		 case  when proyecto <=10.4 then 'Desaprobado'
			 when proyecto <=14 then 'Aprobado'
			 when proyecto <=18 then 'Destacado'
			 when proyecto <=20 then 'Excelencia' 
			 else 'No tiene nota' end as 'Observaci�n'
from tb_notas as  tb1 join tb_alumno as tb2
on(tb1.nota_codigo_alumno = tb2.codigo_alumno) join tb_curso as tb3
on(tb1.nota_codigo_curso = tb3.codigo_curso) join tb_carrera as tb4
on(tb3.curso_codigo_carrera = tb4.codigo_carrera) join tb_seccion as tb5
on(tb1.nota_codigo_seccion = tb5.codigo_seccion)
go


---Mostrar los alumnos cuya direccion es null  (es nulo)
select *  from tb_alumno
where   direccion is null
go

-- Mostar los alumnos que tienen una direccion (no es nulo)

select *  from tb_alumno
where direccion is not  null
go

-- right join o left join = singifica en que manda
select * 
from tb_alumno as tb1  left join tb_distrito as tb2 -- left que tome la condicion tb_alumno que esta a la izquierda
on(tb1.alumno_codigo_distrito = tb2.codigo_distrito)

go




select * from tb_alumno
go
-- Mostar los  distritos  donde  existen alumnos


select distinct  nombre_distritos as 'Distritos'
from tb_alumno as tb1   join tb_distrito as tb2 -- left que tome la condicion tb_alumno que esta a la izquierda
on(tb1.alumno_codigo_distrito = tb2.codigo_distrito)
go


-------------

select nombre_distritos as 'Distritos' 
from tb_alumno as tb1  right join tb_distrito as tb2 -- left que tome la condicion tb_alumno que esta a la izquierda
on(tb1.alumno_codigo_distrito = tb2.codigo_distrito)
where codigo_alumno is  null
go
-----Mostar las especialidades  sin docente 

select * from tb_docente
go

select * from tb_especialidad
go

select  descripcion_especi as ' Especialidad'
from tb_docente as tb1 right join tb_especialidad as tb2
on(tb1.docente_codigo_especialidad = tb2.codigo_esp)
where codigo_docente is    null
go


---------------------
--Relacionar curso y carrera
select codigo_curso,nombre_curso,nombre_carrera
from tb_curso as tb1 join tb_carrera as tb2
on(tb1.curso_codigo_carrera = tb2.codigo_carrera)
go

select * from tb_curso
go
---Obtener la edad del alumno
select *
from tb_alumno
go

select codigo_alumno,nombre,apellido,
		(year(getdate()) - year(fecha_nac)) as 'edad',genero
from tb_alumno
go

-----obtener los datos para D_tiempo desde tb_notas

select concat(nota_codigo_seccion,nota_codigo_alumno,nota_codigo_curso) as 'Codigo_Tiempo', 
	month(fecha_registro) as ' mes', year(fecha_registro) as 'a�os'
from tb_notas
go

select *
from tb_notas
go

------------Obtener los datos para H_notas desde tb_notas y sus relaciones
select nota_codigo_curso,nota_codigo_alumno,codigo_distrito,
		 concat(nota_codigo_seccion,nota_codigo_alumno,nota_codigo_curso) as 'Codigo_Tiempo',
		 (parcial * 0.4 + final *0.4 + proyecto * 0.2) as 'Promedio'
from tb_notas as tb1 join tb_curso as tb2
on(tb1.nota_codigo_curso = tb2.codigo_curso) join tb_alumno as tb3
on(tb1.nota_codigo_alumno = tb3.codigo_alumno) join tb_distrito as tb4
on(tb3.alumno_codigo_distrito = tb4.codigo_distrito)

go

select * 
from tb_notas
go


---DDL MODIIFICA LA TABLA  :  (CREATE ,ALTER .DROP ,RENAME(CAMBIO DE NOMBRE DE LA TABLA)
---DML MANIPULACION DE DATOS: (BULK INSERT(PARA EL VOLCADO DE INFORMACION DE UN ARCHIVO PLANO DE BD) DELETE INSERT UPDATE MERGE(SINCRONIZA LOS DATOS)TRUNCATE TABLE(DEJA VACIA UNA TABLA)
---DCL GRANT(ASIGNAR PRIVILEGIOS/PREMISOS) REVOKE(ELIMINAR LOS DERECHOS DE PERMISOS) USUARIOS Y PERFILES

drop procedure if exists sp_ActualizarUsuario;
delimiter //
create procedure sp_ActualizarUsuario(In nom nvarchar(100), pwd nvarchar(100), est bit, out respuesta varchar(100))
BEGIN
if (char_length(nom) = 0 or nom is null) then
set respuesta = 'Error en el nombre';
elseif (char_length(pwd) = 0 or pwd is null) then
set respuesta = 'Password inconrrecto';
elseif (est <0 or est >1) then
set respuesta = 'Estado inconrrecto';
else
update usuario set Passw = pwd, Estado = est where Nombre = nom;
set respuesta = 'Registro Actualizado';
end if;
END //
delimiter ;

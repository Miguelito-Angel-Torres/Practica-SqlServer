--Creacion de la base de datos Biblioteca
create database  bd_biblioteca
go

--Poner en uso la base de datos
use bd_biblioteca
go

--drop database bd_biblioteca
--go


--Crear tabla de distritos
create table tb_distrito(
	cod_distrito char (4) not null primary key,
	nom_distrito varchar (40) not null
)
go


--Crear la tabla de alumnos
create table tb_alumno(
	cod_alumno char (4) not null primary key,
	nombre varchar (25) not null,
	apellido varchar (25) not null,
	dni char (8) not null,
	direccion varchar (40) not null,
	alumno_cod_distrito char(4) not null foreign key  references tb_distrito(cod_distrito),
	telefono varchar (11) not null,
	correo varchar (40) not null
)
go

--Crear tabla de Nacionalidad
create table tb_nacionalidad(
	cod_nacionalidad char(4) not null primary key,
	nacionalidad varchar (15) not null
)
go

--Crear tabla de Genero



--Crear tabla de editorial
create table tb_editorial(
	cod_editorial char(4) not null primary key,
	editorial varchar (40) not null
)
go

--Crear tabla de autor
create table tb_autor(
	cod_autor char (4) not null primary key,
	nombre varchar (30) not null,
	apellido varchar (30) not null,
	fecha_nac date,
	autor_cod_nacionalidad char(4) not null foreign key references tb_nacionalidad(cod_nacionalidad)
)
go

--Crear tabla de libro
create table tb_libro(
	cod_libro char (4) not null primary key,
	titulo varchar (40) not null,
	libro_cod_autor char(4) not null foreign key references tb_autor(cod_autor),
	libro_cod_editorial char(4) not null foreign key references tb_editorial(cod_editorial),
	libro_cod_genero char(4) not null foreign key references tb_genero(cod_genero)
)
go

--Crear tabla de bibliotecarios

---------------------------------------
create table tb_bibliotecaria(
	cod_biblio char (4) not null primary key,
	bib_nombre varchar (30) not null,
	bib_apellido varchar (30) not null,
	bib_direccion varchar (40) not null,
	bib_telefono varchar (11) not null,
	biblio_cod_distrito char (4) not null foreign key references tb_distrito(cod_distrito), 
	bib_correo varchar (40) not null
)
go
-------------------------
--Crear tabla de horario
create table tb_jornada(
	jor_cod_biblio char(4) not null foreign key references tb_bibliotecaria(cod_biblio), 
	frecuencia  varchar(30) not null,
	inicio_trabajo date,
	fin_trabajo date,
	hora_entrada varchar(12) not null,
	hora_salida varchar (12) not null,
	turno char(1) not null
)
go

--alter table tb_jornada add primary key(jor_cod_biblio)
--go

--Crear tabala de prestamos
create table tb_prestamo(
	pres_cod_alumno char(4) not null foreign key references tb_alumno(cod_alumno),
	pres_cod_libro char(4) not null foreign key references tb_libro(cod_libro),
	pres_cod_biblio char(4) not null foreign key references tb_bibliotecaria(cod_biblio),
	fecha_prestamo date,
	fecha_devolucion date,
)
go

alter table tb_prestamo add primary key (pres_cod_alumno, pres_cod_libro, pres_cod_biblio) 
go


--------------------------------Insertar Registro-----------------------------------

-- Tabla de Registro

select * from tb_distrito
go

insert into tb_distrito values
('D001','Comas'),
('D002','San Martin de Porres'),
('D003','Callao'),
('D004','Lima'),
('D005','Los Olivos'),
('D006','Lur�n'),
('D007','San Juan de Lurigancho'),
('D008','Puente Piedra'),
('D009','Carabayllo'),
('D010','Chorrillos'),
('D011','Santa Rosa'),
('D012','Ate'),
('D013','Anc�n'),
('D014','La Victoria'),
('D015','Pueblo Libre')
go

-- Tabla de alumno
select * from tb_alumno
go

insert into tb_alumno values
('A001','Miguel','Mallqui','67246798','Av.LasTorres 234','D006','954576331','mMiki@gmail.com'),
('A002','Jarley','Freitas','95647489','AV.LasMercedes 756','D002','958654654','fJarley@gmail.com'),
('A003','Piero','Ferrel','71854200','Av.LasManzanas 836','D007','954362544','fPai@gmail.com'),
('A004','Antony','Briones','45620319','Av.LosPinos 623','D004','957482102','bAnto@gmail.com'),
('A005','Jhony','Castillanos','84520186','Av.LosRobles 691','D003','985412163','cJOOOy@gmail.com'),
('A006','Alex','Lapriano','71741264','Av.ElGirasol 019 ','D006','954215332','lAlex@gmail.com'),
('A007','Amanda','Miralla','28512465','Jr.LosAmautas 294','D007','962436429','AMAndarina@gmail.com'),
('A008','Carolina','Cacerez','98547123','Jr.Contisuyo 436','D001','960803044','cCaro@gmail.com'),
('A009','Antonio','Diaz','74851236','Jr.Tiahuanaco 854 ','D009','959169659','dAntos@gmail.com'),
('A010','Josue','Dominguez','85412369','Jr.Chim� 367','D010','957536274','dJosu@gmail.com'),
('A011','Jesus','Palomino','47125695','Av.CantaCallao 423','D002','955902889','pGsus@gmail.com'),
('A012','Flor','Miranda','75481268','Av.Surge 241','D012','954269504','MirFlor@gmail.com'),
('A013','Angela','Gamarra','98745638','Av.Micaela Garcia 236','D013','952636119','gAnge@gmail.com'),
('A014','Isabella','Duarte','74125848','Jr.LosIncas 562','D001','951002734','dIsa@gmail.com'),
('A015','Fabrizio','Rojas','14523556','Jr.Jamaica 732','D015','949369349','rFabi@gmail.com'),
('A016','Nia','Sifuentes','87452193','Av.Arcidres 361','D005','947735964','SiNia@gmail.com'),
('A017','Agustin','Galeno','53834691','Jr.Callao 258','D007','946102579','gAustiiin@gmail.com'),
('A018','Rafael','Cariano','50631752','Jr.Piura 256','D009','944469194','cRafa@gmail.com'),
('A019','Adrian','Betram','94548214','Calle LosGirasoles 541','D010','942835809','BelDrian@gmail.com'),
('A020','Sofia','Gutierrez','51514156','Calle Perales 724','D011','941202424','gSofi@gmail.com')
go

insert into tb_alumno values
('A021','Gura','Gawr','25612269','Av.LaPuerta 160','D008','978544328','GGura@outlook.es'),
('A022','Bianca','Soria','65522269','Av.LosPinos 250','D014','972244328','sBianca@outlook.es'),
('A023','Michael','Icaza','85522269','Av.ElCuadrado 450','D008','972244384','micT@outlook.es'),
('A024','Casandra','D�az','75982269','Av.Triangulo 050','D014','972567432','dCassy@outlook.es'),
('A025','Eleanor','Alanis','25982165','Jr.SantaLuzmila 789','D008','989267432','alElen@outlook.es')
go



------------------- Tabla de genero

select * from tb_genero
go

insert into tb_genero values
('G001','Novela'),
('G002','Poesia'),
('G003','Pol�tico'),
('G004','Romace'),
('G005','Tragedia'),
('G006','Comedia'),
('G007','Lirico'),
('G008','Drama'),
('G009','Cuento'),
('G010','Mitos')
go

-- Tabla de editorial----------------------------------------------
select * from tb_editorial
go

insert into tb_editorial values
('E001','Francisco de Robles'),
('E002','Austral'),
('E003','Antonio Blado'),
('E004','Samuel'),
('E005','Penguin Clasicos'),
('E006','Alfaguara'),
('E007','El Renacimiento'),
('E008','S.L.U Espasa Libros'),
('E009','Vicens-Vives'),
('E010','Fundaci�n Virtual M.C.'),
('E011','Anagrama'),
('E012','Seix Barbal'),
('E013','Mestas Editorial'),
('E014','Nube Tinta'),
('E015','Penguin Random House'),
('E016','Alinaza Editorial'),
('E017','Destino'),
('E018','Spasa'),
('E019','Catedra'),
('E020','Baugry')L
go

-- Tabla de Nacionalidad

select * from tb_nacionalidad
go

insert into tb_nacionalidad values
('N001','Espa�ola'),
('N002','Ingl�s'),
('N003','Peruano'),
('N004','Colombiano'),
('N005','Italiano'),
('N006','Britanica'),
('N007','Suizo'),
('N008','Estadounidense'),
('N009','Griego'),
('N010','Alem�n')
go

--Tabla de autorres---------------------------------

select * from tb_autor
go

insert into tb_autor values
('A001','Miguel','Cervantes','10-29-1547','N001'),
('A002','Willian','Shakespeare','04-01-1564','N002'),
('A003','Mario','Vargas','03-28-1936','N003')
go
----------
insert into tb_autor values
('A004','Jorge','Issac','04-01-1837','N004'),
('A005','Nicolas','Malquiavelo','05-03-1469','N005'),
('A006','Tom','Sharpe','03-30-1928','N002'),
('A007','Eduardo','Mendoza','01-11-1943','N001'),
('A008','Evelyn','Waugh','10-28-1903','N006'),
('A009','Jecques','Rousseu','06-10-1712','N007'),
('A010','Johm','Green','08-24-1977','N008'),
('A011','Emily','Bronte','07-30-1818','N006'),
('A012','Gabriel','Garcia','03-06-1927','N004'),
('A013','Neil','Gaiman','11-10-1960','N002'),
('A014','Jose','Gomez','01-15-1962','N001'),
('A015','Lope','De Vega','11-25-1562','N001')
go
--------------------------------------------------------------------


--Tabla de libros---------------------------

select * from tb_libro
go


insert into tb_libro values
('C001','Don Quijote de la Mancha','A001','E001','G001'),
('C002','Romeo Julieta','A002','E002','G004'),
('C003','La Galatea','A001','E003','G001'),
('C004','El principe','A005','E001','G007'),
('C005','Las Fiesta del Chivo','A003','E004','G001'),
('C006','Maria','A004','E002','G001'),
('C007','La Ciudad de los Perros','A003','E005','G001'),
('C008','Otelo','A002','E006','G005'),
('C009','Macbeth','A002','E007','G005'),
('C010','La tierra de C�rdova','A001','E008','G002'),
('C011','Wilt','A006','E009','G006'),
('C012','Sin Noticia de Gurb','A007','E010','G006'),
('C013','Noticia Bomba','A008','E009','G006'),
('C014','El Contraro Social','A009','E011','G003'),
('C015','Bajo a la Misma Estrella ','A010','E012','G004'),
('C016','Cumbres Borrascosas','A011','E014','G004'),
('C017','El amor en tiempo de C�lera','A012','E013','G001'),
('C018','Mitos Nordiscos','A013','E015','G010'),
('C019','Incondicional','A014','E016','G002'),
('C020','El perro del Hortelano','A015','E017','G008')
go

-- Tabla de Bibliotecarias---------------------------

--acamedae
select * from tb_bibliotecaria 
go


insert into tb_bibliotecaria values

('B001','Anna','Garcia','Av.Carabayllo 156','975475679','D005','gANNA@gmail.com'),
('B002','Marta','Ortega','Av.LasPalmeras 232','954231569','D004','oMart@gmail.com'),
('B003','Jose','Mendoza','Jr.LosAlisos512','954763211','D008','mJOss@gmail.com'),
('B004','Camila','Torres','Jr.Naranjal 456','975632102','D003','tCami@gmail.com'),
('B005','Beatriz','Huamani','Av.Universataria 123','974163210','D010','hBea@gmail.com'),
('B006','Luis','Lopez','Jr.PuenteChico 321','956146789','D012','Lopez123@gmail.com')

go

--Talblas de  Jornada-----------------------------------------
select * from tb_jornada
go

insert into tb_jornada values
('B001','Lunes-Martes','01-06-2020','12-20-2020','08:15:00a.m','12:00:00p.m','M'),
('B002','Martes-Miercoles','01-14-2020','12-29-2020','12:30:00p.m','07:15:00p.m','T'),
('B003','Miercoles-Jueves','01-01-2020','12-25-2020','08:10:00a.m','11:30:00a.m','M'),
('B004','Jueves-Viernes','01-09-2020','12-28-2020','01:02:00p.m','07:25:00p.m','T'),
('B005','Viernes-S�bado','01-04-2020','12-23-2020','08:10:00a.m','11:45:00a.m','M'),
('B006','Lunes-S�bado','01-19-2020','12-31-2020','01:30:00p.m','07:50:00p.m','T')
go

--Tablas de  prestamos------------------------------
select * from tb_prestamo
go

insert into tb_prestamo values

('A001','C001','B003','01-15-2020','02-20-2020'),
('A002','C002','B001','05-18-2020','06-22-2020'),
('A003','C009','B005','07-10-2020','08-13-2020'),
('A004','C004','B004','05-15-2020','10-09-2020'),
('A005','C005','B006','06-20-2020','07-18-2020'),
('A006','C006','B002','08-18-2020','09-15-2020'),
('A007','C007','B004','10-02-2020','11-05-2020'),
('A008','C008','B006','01-25-2020','02-22-2020'),
('A009','C014','B005','10-16-2020','11-20-2020'),
('A010','C012','B001','01-06-2020','02-03-2020'),
('A011','C019','B006','03-14-2020','04-18-2020'),
('A012','C018','B005','01-17-2020','02-21-2020'),
('A013','C013','B003','11-12-2020','12-16-2020'),
('A014','C017','B006','02-15-2020','03-21-2020'),
('A015','C020','B002','10-06-2020','11-10-2020'),
('A016','C016','B005','07-10-2020','08-10-2020')
go

--------------------------------

--Lista de alumno----------------------------------------

select * from tb_alumno
go

select cod_alumno,concat(nombre,' ' ,apellido) as ' Nombre del Alumno',dni,direccion,nom_distrito,telefono,correo
from tb_alumno as tb1 join tb_distrito as tb2
on(tb1.alumno_cod_distrito = tb2.cod_distrito)
go

-- Lista de autor--------------------------------------------
select * from tb_autor
go

select tb1.cod_autor,concat(tb1.nombre,' ' ,tb1.apellido) as ' Nombre del Autor',tb1.fecha_nac as 'Fecha de Nacimiento',tb2.nacionalidad
from tb_autor as tb1  join tb_nacionalidad as tb2
on(tb1.autor_cod_nacionalidad = tb2.cod_nacionalidad)
go

--Lista de Libro--------------------------------------------

select * from tb_libro
go

select cod_libro,titulo,concat(nombre , ' ' ,apellido) as 'Nombre del Autor', editorial,genero
from tb_libro as tb1 join tb_autor as tb2
on(tb1.libro_cod_autor = tb2.cod_autor) join tb_editorial as tb3
on(tb1.libro_cod_editorial = tb3.cod_editorial) join tb_genero as tb4
on(tb1.libro_cod_genero = tb4.cod_genero)
go

--Lista de bibliotecaria

select * from tb_bibliotecaria
go

select cod_biblio,concat(bib_nombre, ' ', bib_apellido) as 'Nombre Completo',bib_direccion as 'Direcci�n',bib_telefono as 'Telefono',nom_distrito as 'Distrito',bib_correo as 'Correo'
from tb_bibliotecaria as tb1 join tb_distrito as tb2
on(tb1.biblio_cod_distrito = tb2.cod_distrito)
go


--Jornada
select * from  tb_jornada
go

select cod_biblio,concat(bib_nombre, ' ', bib_apellido) as 'Nombre Completo',frecuencia,inicio_trabajo,fin_trabajo,hora_entrada,hora_salida,turno
from tb_jornada as tb1 join tb_bibliotecaria as tb2
on(tb1.jor_cod_biblio = tb2.cod_biblio)
go

-- Lista de Prestamo

select * from tb_prestamo
go

select cod_alumno,concat(nombre , ' ' ,apellido) as 'Nombre del Alumno',titulo,concat(bib_nombre, ' ', bib_apellido ) as 'Nombre del Bibliotecario',fecha_prestamo,fecha_devolucion
from tb_prestamo as tb1 join tb_alumno as tb2
on(tb1.pres_cod_alumno = tb2.cod_alumno) join tb_libro as tb3
on(tb1.pres_cod_libro = tb3.cod_libro) join tb_bibliotecaria as tb4
on(tb1.pres_cod_biblio = tb4.cod_biblio) --join tb_jornada as tb5
--on(tb4.cod_biblio = tb5.jor_cod_biblio)
go
---------------------------------ASAS
--------------------------------
-- Cantidad de Alumnos
select count(*) as 'Cantidad de Alumnos' from tb_alumno
go
-- Cantidad de Libros
select count(*) as 'Cantidad de Libros' from tb_libro
go
-- Cantidad de Bibliotecarios

select count(*) as 'Cantidad de Bibliotecarias' from tb_bibliotecaria
go
-- Jornada-------------------
select max(hora_entrada) as 'Max hora entrada',
	  min(hora_salida) as 'Min hora salida'
from tb_jornada

----------------Consultar con criterios---

select * from tb_alumno
go
-------------
select cod_alumno, concat(nombre,' ' ,apellido) as 'Nombre Completo' , nom_distrito
from tb_alumno as tb1 join tb_distrito as tb2
on (tb1.alumno_cod_distrito = tb2.cod_distrito)
where tb2.nom_distrito like 'C%'   -- '%C'  
go
-------------
select * from tb_distrito
go
-- Cantidad de alumnos por Distritos
select nom_distrito  as 'Distritos',count(*) as 'Cantidad de alumnos x Distritos'
from tb_alumno as tb1 join tb_distrito as tb2
on(tb1.alumno_cod_distrito = tb2.cod_distrito)
group by nom_distrito
go
--
select * from tb_alumno
go
----- Gmail

select cod_alumno,concat(nombre,' ' ,apellido) as ' Nombre del Alumno',dni,direccion,nom_distrito,telefono,correo
from tb_alumno as tb1 join tb_distrito as tb2
on(tb1.alumno_cod_distrito = tb2.cod_distrito)
where correo like '%outlook%' -- '%gmail%'
go
---

select count(*) as 'Cantidad de Alumnos que usan (Gmail)'
from tb_alumno 
where correo like '%gmail%' --'%outlook%'
go

------
select concat(nombre,' ',apellido) as ' Nombre del Autor',nacionalidad as 'Nacionalidad'
from tb_autor as tb1 join tb_nacionalidad as tb2
on (tb1.autor_cod_nacionalidad = tb2.cod_nacionalidad)
where nacionalidad like 'Espa�ola' -- 'Ingl�s
go
--
select concat(nombre,' ',apellido) as ' Nombre del Autor',nacionalidad as 'Nacionalidad'
from tb_autor as tb1 join tb_nacionalidad as tb2
on (tb1.autor_cod_nacionalidad = tb2.cod_nacionalidad)
where nacionalidad like 'Ingl�s'
go
---
select nacionalidad,count(*) as 'Cantidad del Autor '
from tb_autor as tb1 join tb_nacionalidad as tb2
on(tb1.autor_cod_nacionalidad = tb2.cod_nacionalidad)
group by nacionalidad
go

----
select *  from tb_prestamo 
go

select * from tb_libro
go

select titulo,count(*) as 'Cantidad del Libros prestados '
from tb_prestamo as tb1 join tb_libro as tb2
on(tb1.pres_cod_libro = tb2.cod_libro)
group by titulo
go
------------------------------
select * from tb_libro
go
select cod_libro,titulo,concat(nombre , ' ' ,apellido) as 'Nombre del Autor', editorial,genero
from tb_libro as tb1 join tb_autor as tb2
on(tb1.libro_cod_autor = tb2.cod_autor) join tb_editorial as tb3
on(tb1.libro_cod_editorial = tb3.cod_editorial) join tb_genero as tb4
on(tb1.libro_cod_genero = tb4.cod_genero)
where tb4.genero like 'Novela'
go
-----------------------------














--select cod_biblio,
--from tb_jornada as tb1 join tb_bibliotecaria as tb2
--on(tb1.jor_cod_biblio = tb2.cod_biblio)

--go

select  *  from tb_bibliotecaria
go

-- Tabla de tb_prestamos

select * from tb_prestamo
go

select pres_cod_alumno,concat(nombre,' ',apellido) as 'Nombre del alumno',titulo,bib_nombre,fecha_prestamo,fecha_devolucion
from tb_prestamo as tb1 join tb_alumno as tb2
on(tb1.pres_cod_alumno = tb2.cod_alumno) join tb_libro as tb3
on(tb1.pres_cod_libro = tb3.cod_libro) join tb_bibliotecaria as tb4
on(tb1.pres_cod_biblio = tb4.cod_biblio)
go


--select codigo_alumno , concat(apellido,' '  , nombre , '   ' ,fecha_nac) as ' alumno' -- para poner concatenar o unir
--from tb_alumno
--go






-- Cantidad de Libros
--Cantidad de Alumnos
--Cantidad de Bibliotecarios
select count(*) as 'Cantidad de libros' from  tb_libro
go
select count(*) as 'Cantidad de alumnos' from  tb_alumno
go
select count(*) as 'Cantidad de alumnos' from  tb_bibliotecaria
go

select max(hora_entrada) as 'Max hora entrada',
	  min(hora_salida) as 'Min hora salida'
from tb_jornada


----------------------------
select * from tb_libro
go

select * from tb_editorial
go
-- Editorial que no tiene los libros
select   editorial 
from tb_libro as tb1 right join tb_editorial as tb2
on(tb1.libro_cod_editorial = tb2.cod_editorial)
where cod_libro is  null  -- is not null
go

--
select * from tb_autor
go
select * from tb_libro
go

select  concat(nombre,' ' , apellido) as 'Nombre' 
from tb_libro as tb1 right join tb_autor as tb2
on(tb1.libro_cod_autor = tb2.cod_autor)
where cod_libro is  not  null  -- is not null
go

------------------
--- Autors que no tiene esas nacionalidad 

select  nacionalidad
from tb_autor as tb1 right join tb_nacionalidad as tb2
on(tb1.autor_cod_nacionalidad = tb2.cod_nacionalidad)
where cod_autor is null -- is not null
go

select * from tb_nacionalidad
go

--- 
-- distritos que no  hay bibliotecarias
select  nom_distrito
from tb_bibliotecaria as tb1 right join tb_distrito as tb2
on(tb1.biblio_cod_distrito = tb2.cod_distrito)
where cod_biblio is null -- is not null
go
select * from tb_distrito
go

-- Turnos ------------

select jor_cod_biblio,concat(bib_nombre,' ' , bib_apellido) as 'Nombre Completo',frecuencia,hora_entrada,hora_salida,bib_correo,
	
	case turno when 'M' then 'Ma�ana'
				when 'T' then 'Tarde' end as 'Turnos'
from tb_jornada as tb1 join tb_bibliotecaria as tb2
on(tb1.jor_cod_biblio = tb2.cod_biblio) 
go

select * from tb_bibliotecaria
go

---
select * from tb_jornada
go

select *
from tb_jornada
where day(fin_trabajo) >=20 and day(fin_trabajo)<=23
go
--------------------- Dw_Biblioteca
-------D_Libro---
select cod_libro, titulo,concat(nombre,' ' , apellido) as 'Nombre del Autor' , genero
from tb_libro as tb1 join tb_autor as tb2
on(tb1.libro_cod_autor = tb2.cod_autor) join  tb_genero as tb3
on(tb1.libro_cod_genero = tb3.cod_genero)
go

---D_Alumno
select cod_alumno,concat(nombre,' ' , apellido) as 'Nombre del Alumno',dni,nom_distrito
from tb_alumno as tb1 join tb_distrito as tb2
on(tb1.alumno_cod_distrito = tb2.cod_distrito)
go

---D_Tiempo_Prestamo
select concat(pres_cod_alumno,pres_cod_libro,pres_cod_biblio) as 'Codigo_Tiempo_Prestamo',
	day(fecha_prestamo) as 'Dia' , month(fecha_prestamo) as 'mes', year(fecha_prestamo) as ' A�os'
from tb_prestamo
go


select *  from tb_prestamo
go

--D_Tiempo_Devolucion
select concat(pres_cod_alumno,pres_cod_libro,pres_cod_biblio) as 'Codigo_Tiempo_Devoluci�n',
	day(fecha_devolucion) as 'Dia' , month(fecha_devolucion) as 'mes', year(fecha_devolucion) as ' A�os'
from tb_prestamo
go

-- D_Bibliotecaria
select cod_biblio,concat(bib_nombre,' ' , bib_apellido) as 'Nombre del Bibliotecarios',bib_correo,bib_telefono,nom_distrito

from tb_bibliotecaria as tb1 join tb_distrito as tb2
on(tb1.biblio_cod_distrito = tb2.cod_distrito)
go

-- H_Prestamo
select cod_libro,cod_alumno,cod_biblio,
	concat(pres_cod_alumno,pres_cod_libro,pres_cod_biblio) as 'Codigo_Tiempo_Prestamo',
	concat(pres_cod_alumno,pres_cod_libro,pres_cod_biblio) as 'Codigo_Tiempo_Devoluci�n'
	
from tb_prestamo as tb1 join tb_libro  as tb2 
on(tb1.pres_cod_libro = tb2.cod_libro) join tb_alumno as tb3
on(tb1.pres_cod_alumno = tb3.cod_alumno) join tb_distrito as tb4
on(tb3.alumno_cod_distrito = tb4.cod_distrito) join tb_bibliotecaria as tb5
on(tb1.pres_cod_biblio = tb5.cod_biblio)
go

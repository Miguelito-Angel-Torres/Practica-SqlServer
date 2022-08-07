select * 
into #rb_Alumno2
from ##Base_Alumno

select *  from #rb_Alumno2

select *
into #rb_Alumno1
from ##Base_Alumno

truncate table #rb_Alumno1
select * from #rb_Alumno1

--Merge() INSETAR INFORMACION A OTRA TABLA
Merge #rb_Alumno1 as tb1 -- Destino
Using #rb_Alumno2 as tb2-- Origen
on(tb2.Nombre_Alum = tb1.Nombre_Alum)
WHEN NOT MATCHED 
THEN INSERT VALUES(tb2.Id_Alum,tb2.Nombre_Alum,tb2.Apellido_Alum,tb2.Dni_Alum,tb2.Direccion_Alum,tb2.Distrito);


--IMPORTAR DE MI EXCEL A BASE DE DATOS CON BUK INSERT 

BULK INSERT 
#rb_Alumno1
--from 'C:\Users\Usuario\Downloads\Libro2m.txt'
from 'C:\Users\Usuario\Documents\SQL Server Management Studio\x\Libro2m.txt'
with (Firstrow = 2)


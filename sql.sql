use gestion
select * from PRODUCTOS

SELECT sum(precio) from PRODUCTOS


update PRODUCTOS set PRECIO=500.00 where [CÓDIGO ARTÍCULO] = 'AR27'

select COUNT(SECCIÓN) from PRODUCTOS

select COUNT([NOMBRE ARTÍCULO]) as Cantidad_Registros from PRODUCTOS

select AVG([PRECIO]) from PRODUCTOS
select AVG(precio) from PRODUCTOS WHERE [PAÍS DE ORIGEN] = 'china'
select MAX(precio) from PRODUCTOS
select min(precio) from PRODUCTOS
select MAX(precio) from PRODUCTOS where [PAÍS DE ORIGEN] = 'china'


select * from PRODUCTOS
where PRECIO>(select AVG(precio) from PRODUCTOS where [PAÍS DE ORIGEN] = 'china')



select * from PRODUCTOS where PRECIO<(select MIN(precio) from PRODUCTOS where [PAÍS DE ORIGEN] = 'china')

declare @minchinos int
set @minchinos = (select MIN(precio)from PRODUCTOS where [PAÍS DE ORIGEN] = 'china')
select * from PRODUCTOS where PRECIO<@minchinos

declare @saludos varchar(50)
set @saludos = 'Hola'
print @saludos


select * from PRODUCTOS order by PRECIO desc

select * from PRODUCTOS order by SECCIÓN


create function suma(@n1 int ,@n2 int)
returns int 
as
begin
declare @s int
set @s = @n1 + @n2
return @s
end

select dbo.suma(10,10)

create function positivo(@num int)
returns varchar(100)
as
begin
declare @mensaje varchar(50)
if @num >0
begin
set @mensaje = 'Este numero es positivo'
end
if @num <0
begin
set @mensaje = 'Este numero es negativo'
end
return @mensaje
end

select dbo.positivo(10)

drop function if exists pares; 
create function pares(@num int)
returns varchar(100)
as
begin
declare @mensaje varchar(50)
if (@num % 2 = 0) 
begin
set @mensaje = 'Este numero es par'
end
else 
begin
set @mensaje = 'Este numero es impar'
end
return @mensaje
end

select dbo.pares(10)



drop function if exists pares; 
create function primos(@num int)
returns varchar(100)
as
begin
declare @mensaje varchar(50)
set contador =  0
for i in range(1,@num+1):
	 if (@num % i = 0)
		set contador = contador +1
if contador = 2
begin
set @mensaje = 'Este numero es par'
end
else 
begin
set @mensaje = 'Este numero es impar'
end
return @mensaje
end

select dbo.primos(10)


create function primo(@num int)
returns varchar(50)
as
begin
declare @cont int
declare @i int
declare @resto int
declare @mensaje varchar(50)

if @num>1
begin
set @cont=0
set @i=2

	while @i<@num and @cont=0
		begin
		set @resto=@num%@i
		
		if @resto=0
		begin
		set @cont=@cont+1
		end
		set @i=@i+1
		end
	if @cont=0
	begin
	set @mensaje='es numero primo'
	end
	else
	begin
	set @mensaje='no es numero primo'
	end
end
else
begin
set @mensaje='no es numreo primo'
end

return @mensaje
end

select dbo.primo(5)



create function Factorial(@num int)
returns int
as
begin
declare @i int = 1

 while @num>1
 begin
  set @i = @num *  @i
  set @num=@num-1
  end

return @i
end

select dbo.Factorial(1)
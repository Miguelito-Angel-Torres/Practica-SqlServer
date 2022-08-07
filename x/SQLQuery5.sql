-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE sp_Trabajador
@Genero varchar(20)
AS
SET NOCOUNT ON 
BEGIN
	select tb1.Id_Trabajador,Nombre_Trabajador,Apellido_Trabajador ,
	case tb1.Genero_Trabajador when 'M' then 'Masculino' when 'F' then 'Femenino' end  as 'Genero',
	 tb1.Dni_Trabajador,tb3.Especialidad,tb2.Sueldo_Trabajador

	from Person.Trabajador tb1  join Person.Jornada_Trabajador as tb2
	on(tb1.Trabajador_Id_dist = tb2.Id_Trabajador) join Person.Especialidad_Trabajador as tb3
	on(tb2.Trabajador_Id_Especialidad = tb3.Id_Especialidad) 
	where Genero_Trabajador  = @Genero
END
GO

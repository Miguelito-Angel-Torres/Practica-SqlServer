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
CREATE PROCEDURE  sp_Fin_Trabajo
@fecha1 date
AS
set nocount on 
BEGIN
	Truncate table Fin_Trabajo
	insert into  Fin_Trabajo
	select tb1.Id_Trabajador ,tb3.Nombre_Trabajador,tb3.Apellido_Trabajador, tb2.Especialidad,tb1.Sueldo_Trabajador
	 --into Fin_Trabajo
	 from Person.Jornada_Trabajador as tb1  join Person.Especialidad_Trabajador as tb2
	 on(tb1.Trabajador_Id_Especialidad = tb2.Id_Especialidad) join Person.Trabajador as tb3
	 on(tb1.Id_Trabajador = tb3.Id_Trabajador)
	 where   Fin_Trabajador  like @fecha1
	
END
GO

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
CREATE PROCEDURE sp_Employee2

-- DESPUES DEL ASS SON PARAMETROS INTERNOS 
AS
DECLARE @Fecha Date 
set @Fecha=CAST(GETDATE() AS  date )
BEGIN
	select * 
	from HumanResources.Employee as a
	where a.HireDate = @Fecha

END
GO

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
AlTER PROCEDURE sp_Employee3
@fecha1 date,
@fecha2 date
AS

SET NOCOUNT ON 
BEGIN
	TRUNCATE TABLE Employee_Borrador
	INSERT INTO Employee_Borrador
	select BusinessEntityID,NationalIDNumber,LoginID,HireDate ,JobTitle
	--INTO Employee_Borrador
	from HumanResources.Employee
	where  HireDate between @fecha1 and @fecha2
	
END
GO

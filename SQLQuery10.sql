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
-- Create date: <2021.05.20,,>
-- Description:	<filtrado>
-- =============================================
-- CREATE
-- ALTER
ALTER PROCEDURE sp_Employee
@Marital varchar(10)
AS
BEGIN
	select a.BusinessEntityID,a.NationalIDNumber,a.LoginID,a.JobTitle,a.MaritalStatus
	from HumanResources.Employee as a 
	where a.MaritalStatus =@Marital
END
GO


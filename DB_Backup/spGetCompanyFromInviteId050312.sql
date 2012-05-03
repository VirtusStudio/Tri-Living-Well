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
-- Author:		David Bowers
-- Create date: 5/3/2012
-- Description:	Given a user's company invite 
-- request return company id and name
-- =============================================
CREATE PROCEDURE spGetCompanyFromInviteId 
	-- Add the parameters for the stored procedure here
	@inviteid int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select
		dbo.tbl_CompanyInfo.intCompanyId,
		dbo.tbl_CompanyInfo.strCompanyName,
		dbo.tbl_CompanyRequestedUsersList.strEmpFirstName,
		dbo.tbl_CompanyRequestedUsersList.strEmpLastName,
		dbo.tbl_CompanyRequestedUsersList.strEmpEmail
from	dbo.tbl_CompanyRequestedUsersList,dbo.tbl_CompanyInfo
where	dbo.tbl_CompanyInfo.intCompanyId=dbo.tbl_CompanyRequestedUsersList.intCompanyId
and		dbo.tbl_CompanyRequestedUsersList.intCompanyRequestedUsersListId=@inviteid;

END
GO

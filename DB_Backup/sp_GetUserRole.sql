USE [TLW]
GO
/****** Object:  StoredProcedure [dbo].[sp_type]    Script Date: 04/16/2012 13:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].spMem_GET_UserRole 
@UserEmail varchar(100)
AS

select u.*,r.rolename from aspnet_Users as u

inner join aspnet_UsersInRoles as uir on u.Userid= uir.userid

inner join aspnet_Roles as r on uir.roleid = r.roleid

where username=@UserEmail

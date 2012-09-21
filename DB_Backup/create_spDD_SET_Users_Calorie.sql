USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spDD_SET_Users_Calorie]    Script Date: 09/19/2012 23:48:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDD_SET_Users_Calorie]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spDD_SET_Users_Calorie]
GO

/****** Object:  StoredProcedure [dbo].[spDD_SET_Users_Calorie]    Script Date: 08/05/2012 14:11:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].spDD_SET_Users_Calorie
@USER_ID varchar(100),
@CALORIE int
AS

declare @havecalorie int
select @havecalorie = COUNT(USER_ID) FROM DD_USERS WHERE USER_ID=@USER_ID
if @havecalorie > 0

UPDATE DD_USERS SET CALORIE_NUMBER=@CALORIE WHERE USER_ID=@USER_ID

else 

declare @now datetime
set @now = getdate()

INSERT INTO DD_USERS 
(
	CALORIE_NUMBER, DATE_MODIFIED
)
VALUES
(
	@CALORIE, @now
)
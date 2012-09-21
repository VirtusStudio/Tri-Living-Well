USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionUserInfoGet]    Script Date: 09/20/2012 16:52:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutritionUserInfoGet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutritionUserInfoGet]
GO

USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionUserInfoGet]    Script Date: 09/20/2012 16:52:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spNutritionUserInfoGet]  
	@USERID varchar(100)
AS
	
BEGIN
	SELECT *
	FROM [dbo].[USER_INFO] 
	WHERE USER_ID=@USERID
END

GO



USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionBodyFatCalculatorGetBaseline]    Script Date: 09/20/2012 08:07:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutritionBodyFatCalculatorGetBaseline]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutritionBodyFatCalculatorGetBaseline]
GO

USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionBodyFatCalculatorGetBaseline]    Script Date: 09/20/2012 08:07:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spNutritionBodyFatCalculatorGetBaseline]  
	@USERID varchar(100)
	
AS

	SELECT *
	FROM [dbo].[tbl_PersonalSummary] 
	WHERE guidUserId=@USERID
	AND intPersonalSummaryId=(SELECT MIN(intPersonalSummaryId) FROM [dbo].[tbl_PersonalSummary] WHERE guidUserId=@USERID) 

GO



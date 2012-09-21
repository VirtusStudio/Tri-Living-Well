USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionBodyFatCalculatorGetGetFirst]    Script Date: 09/18/2012 01:54:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutritionBodyFatCalculatorGetFirst]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutritionBodyFatCalculatorGetGetFirst]
GO

USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionBodyFatCalculatorGetGetFirst]    Script Date: 09/18/2012 01:54:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		David Bowers
-- Create date: 09/15/2012
-- Description:	Baseline for personal summary
-- (scorecard)
-- =============================================
CREATE PROCEDURE [dbo].[spNutritionBodyFatCalculatorGetGetFirst]  
	@USERID varchar(100)
AS

	SELECT *
	FROM [dbo].[tbl_PersonalSummary] 
	WHERE guidUserId=@USERID
	AND intPersonalSummaryId=(SELECT MIN(intPersonalSummaryId) FROM [dbo].[tbl_PersonalSummary] WHERE guidUserId=@USERID) 


GO



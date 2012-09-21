USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionBodyFatCalculatorGetLast]    Script Date: 09/18/2012 01:54:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutritionBodyFatCalculatorGetLast]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutritionBodyFatCalculatorGetLast]
GO

USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionBodyFatCalculatorGetLast]    Script Date: 09/18/2012 01:54:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spNutritionBodyFatCalculatorGetLast]  
	@USERID varchar(100),
	@DATESELECTED varchar(100)
AS
	
	DECLARE @FROMSTRING varchar(100)
	SET @FROMSTRING = @DATESELECTED + ' 00:00:00'
	
	DECLARE @TOSTRING varchar(100)
	SET @TOSTRING = @DATESELECTED + ' 11:59:59'
	
	declare @FROM datetime
	set @FROM = CONVERT(datetime, @FROMSTRING, 101)
	
	declare @TO datetime
	set @TO = CONVERT(datetime, @TOSTRING, 101)
	
	SELECT *
	FROM [dbo].[tbl_PersonalSummary] 
	WHERE guidUserId=@USERID 
	AND dtCreatedOn >= @FROM
	AND dtCreatedOn <= @TO
	AND intPersonalSummaryId=(SELECT MAX(intPersonalSummaryId) FROM [dbo].[tbl_PersonalSummary] WHERE guidUserId=@USERID) 

GO



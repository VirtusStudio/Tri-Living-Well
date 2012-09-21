USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionFoodJournalGet]    Script Date: 09/20/2012 01:56:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutritionFoodJournalGet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutritionFoodJournalGet]
GO

USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionFoodJournalGet]    Script Date: 09/20/2012 01:56:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spNutritionFoodJournalGet]
	@USERID varchar(100),
	@FROMDATE varchar(100),
	@TODATE varchar(100)
	
AS 

	DECLARE @FROMSTRING varchar(100)
	SET @FROMSTRING = @FROMDATE + ' 00:00:00'
	
	DECLARE @TOSTRING varchar(100)
	SET @TOSTRING = @TODATE + ' 11:59:59'
	
	declare @FROM datetime
	set @FROM = CONVERT(datetime, @FROMSTRING, 101)
	
	declare @TO datetime
	set @TO = CONVERT(datetime, @TOSTRING, 101)


BEGIN 
    SET NOCOUNT ON
	SELECT * FROM [dbo].[tbl_FoodIntakeLog] WHERE dtFoodIntakeDate>=@FROM AND dtFoodIntakeDate<=@TO
END


GO



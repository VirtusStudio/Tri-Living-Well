USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionFoodJournalNotesGet]    Script Date: 09/20/2012 02:00:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutritionFoodJournalNotesGet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutritionFoodJournalNotesGet]
GO

USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionFoodJournalNotesGet]    Script Date: 09/20/2012 02:00:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spNutritionFoodJournalNotesGet]  
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
	
BEGIN
	SELECT *
	FROM [dbo].[tbl_FoodIntakeLogNotes] 
	WHERE guidUserId=@USERID
	AND dtFoodIntakeDate >= @FROM
	AND dtFoodIntakeDate <= @TO
END



GO



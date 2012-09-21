USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionFoodJournalNotesSet]    Script Date: 09/19/2012 14:54:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutritionFoodJournalNotesSet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutritionFoodJournalNotesSet]
GO

USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionFoodJournalNotesSet]    Script Date: 09/19/2012 14:54:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spNutritionFoodJournalNotesSet]        
	@USERID varchar(100),
	@LOGDATE varchar(100),
	@NOTES varchar(500)

AS 

	declare @D datetime
	set @D = CONVERT(datetime, @LOGDATE, 101)


BEGIN 
    SET NOCOUNT ON
	IF exists(SELECT intFoodIntakeLogNotesId FROM [dbo].[tbl_FoodIntakeLogNotes] WHERE guidUserId=@USERID AND dtFoodIntakeDate=@D)
		BEGIN
			UPDATE [dbo].[tbl_FoodIntakeLogNotes] SET
			guidUserId=@USERID,
			dtFoodIntakeDate=@D,
			strNotes=@NOTES
			WHERE guidUserId=@USERID AND dtFoodIntakeDate=@D
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[tbl_FoodIntakeLogNotes]
				(
					guidUserId,
					dtFoodIntakeDate,
					strNotes
				)
			VALUES
				(
					@USERID,
					@D,
					@NOTES
				)
		END
END

GO



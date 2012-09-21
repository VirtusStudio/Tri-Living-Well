USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionFoodJournalSetByDate]    Script Date: 09/19/2012 04:28:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutritionFoodJournalSetByDate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutritionFoodJournalSetByDate]
GO

USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionFoodJournalSetByDate]    Script Date: 09/19/2012 04:28:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spNutritionFoodJournalSetByDate]        
	@FOODINTAKELOGID int,
	@MEALID int,
	@USERID varchar(100),
	@LOGDATE varchar(100),
	@MILKDETAILS varchar(100),
	@FRUITDETAILS varchar(100),
	@VEGETABLEDETAILS varchar(100),
	@STARCHDETAILS varchar(100),
	@PROTEINDETAILS varchar(100),
	@FATDETAILS varchar(100)

AS 
BEGIN 
    SET NOCOUNT ON
	IF exists(SELECT intFoodIntakeLogId FROM [dbo].[tbl_FoodIntakeLog] WHERE intFoodIntakeLogId = @FOODINTAKELOGID)
		BEGIN
			UPDATE [dbo].[tbl_FoodIntakeLog] SET
					strFATDetails=@FATDETAILS,
					intMealId=@MEALID,
					strProteinDetails=@PROTEINDETAILS,
					strStarchDetails=@STARCHDETAILS,
					strVegetablesDetails=@VEGETABLEDETAILS,
					strFruitDetails=@FRUITDETAILS,
					strMilkDetails=@MILKDETAILS,
					guidUserId=@USERID,
					dtFoodIntakeDate=@LOGDATE
			WHERE intFoodIntakeLogId=@FOODINTAKELOGID
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[tbl_FoodIntakeLog]
				(
					intMealId,
					strFATDetails,
					strProteinDetails,
					strStarchDetails,
					strVegetablesDetails,
					strFruitDetails,
					strMilkDetails,
					guidUserId,
					dtFoodIntakeDate,
					dtCreatedOn
				)
			VALUES
				(
					@MEALID,
					@FATDETAILS,
					@PROTEINDETAILS,
					@STARCHDETAILS,
					@VEGETABLEDETAILS,
					@FRUITDETAILS,
					@MILKDETAILS,
					@USERID,
					@LOGDATE,
					GETDATE()
				)
		END
END

GO



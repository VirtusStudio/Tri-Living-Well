USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionBodyFatCalculatorSetByDate]    Script Date: 09/18/2012 01:46:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutritionBodyFatCalculatorSetByDate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutritionBodyFatCalculatorSetByDate]
GO

USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionBodyFatCalculatorSetByDate]    Script Date: 09/18/2012 01:46:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spNutritionBodyFatCalculatorSetByDate]        
	@PERSONALSUMMARYID int,
	@WEIGHT decimal,
	@WAIST decimal,
	@NECK decimal,
	@HIPS decimal,
	@USERID varchar(100),
	@DATESELECTED varchar(100)
AS 

	declare @D datetime
	set @D = CONVERT(datetime, @DATESELECTED, 101)

BEGIN 
    SET NOCOUNT ON
	BEGIN
		INSERT INTO [dbo].[tbl_PersonalSummary]
			(
				decWeight,
				decWaist,
				decNeck,
				decHips,
				guidUserId,
				dtCreatedOn
			)
		VALUES
			(
				@WEIGHT,
				@WAIST,
				@NECK,
				@HIPS,
				@USERID,
				@D
			)
	END
END
GO



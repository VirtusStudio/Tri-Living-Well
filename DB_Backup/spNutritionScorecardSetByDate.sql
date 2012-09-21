USE [TLW]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutritionScorecardSetByDate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutritionScorecardSetByDate]
GO
CREATE PROCEDURE [dbo].[spNutritionScorecardSetByDate]        
	@PERSONALSUMMARYID int,
	@WEIGHT decimal,
	@WAIST decimal,
	@BMI decimal,
	@FAT decimal,
	@WAIST_HEIGHT decimal,
	@WAIST_HIP decimal,
	@USERID varchar(100),
	@DATE_SELECTED varchar(100)
	
AS 

	declare @D datetime
	set @D = CONVERT(datetime, @DATE_SELECTED, 101)
	
	
BEGIN 
    SET NOCOUNT ON
	IF exists(SELECT intPersonalSummaryId FROM [dbo].[tbl_PersonalSummary] WHERE intPersonalSummaryId = @PERSONALSUMMARYID)
		BEGIN
			UPDATE [dbo].[tbl_PersonalSummary] SET
					decWeight=@WEIGHT,
					decWaist=@WAIST,
					decBMI=@BMI,
					decBodyFATPercentage=@FAT,
					decWaistToHeight=@WAIST_HEIGHT,
					decWaistToHip=@WAIST_HIP,
					guidUserId=@USERID,
					dtModifiedOn=@D
			WHERE intPersonalSummaryId=@PERSONALSUMMARYID
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[tbl_PersonalSummary]
				(
					decWeight,
					decWaist,
					decBMI,
					decBodyFATPercentage,
					decWaistToHeight,
					decWaistToHip,
					guidUserId,
					dtCreatedOn
				)
			VALUES
				(
					@WEIGHT,
					@WAIST,
					@BMI,
					@FAT,
					@WAIST_HEIGHT,
					@WAIST_HIP,
					@USERID,
					@D
				)
		END
END
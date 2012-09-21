USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionGetBodyFatRanges]    Script Date: 09/20/2012 16:52:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutritionGetBodyFatRanges]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutritionGetBodyFatRanges]
GO

USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionGetBodyFatRanges]    Script Date: 09/20/2012 16:52:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spNutritionGetBodyFatRanges]  
	@GENDER varchar(1),
	@AGE int
AS
	
BEGIN
	SELECT *
	FROM [dbo].[NutritionBodyFat] 
	WHERE Gender = @GENDER
	AND AgeMin <= @AGE
    AND AgeMax >= @AGE
END

GO



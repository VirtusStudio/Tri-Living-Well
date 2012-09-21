USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionGetHealthyWeightRanges]    Script Date: 09/20/2012 16:52:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutritionGetHealthyWeightRanges]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutritionGetHealthyWeightRanges]
GO

USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionGetHealthyWeightRanges]    Script Date: 09/20/2012 16:52:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spNutritionGetHealthyWeightRanges]  
	@HEIGHT int
AS
	
BEGIN
	SELECT *
	FROM [dbo].[NutritionHealthyWeight] 
	WHERE Height=@HEIGHT
END

GO



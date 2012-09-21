USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionFoodSearch]    Script Date: 09/19/2012 23:48:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutritionFoodSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutritionFoodSearch]
GO

USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionFoodSearch]    Script Date: 09/19/2012 23:48:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spNutritionFoodSearch]        
	@FOODTYPE varchar(100)
AS
	DECLARE @Temp TABLE    
	(        
		Product varchar(50) NULL,
		Type varchar(100) NULL,
		Starch numeric(4, 2) NULL,
		Protein numeric(4, 2) NULL,
		Fats numeric(4, 2) NULL,
		PortionSize numeric(4, 2) NULL,
		PortionMeasure varchar(20) NULL
	) 
BEGIN 
    SET NOCOUNT ON
	INSERT INTO @Temp
        SELECT Product,Type,0.00,0.00,0.00,PortionSize,PortionMeasure
        FROM NutritionVegetables 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'
        
    INSERT INTO @Temp
        SELECT Product,Type,Starch,0.00,0.00,PortionSize,PortionMeasure
		FROM [dbo].[NutritionStarchVegetables] 
		WHERE Product LIKE '%' + @FOODTYPE + '%' 
		OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,Starch,0.00,0.00,PortionSize,PortionMeasure
		FROM [dbo].[NutritionStarchVegetables] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,Starch,0.00,Fats,PortionSize,PortionMeasure
		FROM [dbo].[NutritionStarchSnacks] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,Starch,0.00,0.00,PortionSize,PortionMeasure
		FROM [dbo].[NutritionStarchGrains] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,Starch,0.00,Fats,PortionSize,PortionMeasure
		FROM [dbo].[NutritionStarchFats] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,Starch,0.00,Fats,PortionSize,PortionMeasure
		FROM [dbo].[NutritionStarchDesserts] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,Starch,0.00,Fats,PortionSize,PortionMeasure
		FROM [dbo].[NutritionStarchCreamyDesserts] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,Starch,0.00,0.00,PortionSize,PortionMeasure
		FROM [dbo].[NutritionStarchCereals] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,Starch,0.00,0.00,PortionSize,PortionMeasure
		FROM [dbo].[NutritionStarchBreads] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,Starch,0.00,Protein,PortionSize,PortionMeasure
		FROM [dbo].[NutritionStarchBeans] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,Starch,0.00,Fats,PortionSize,PortionMeasure
		FROM [dbo].[NutritionSnacksCrackers] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,Starch,0.00,Fats,PortionSize,PortionMeasure
		FROM [dbo].[NutritionSnacksCookies] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,Starch,0.00,Fats,PortionSize,PortionMeasure
		FROM [dbo].[NutritionSnacksChips] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,Starch,0.00,Fats,PortionSize,PortionMeasure
		FROM [dbo].[NutritionSnacksCandy] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,Starch,0.00,Fats,PortionSize,PortionMeasure
		FROM [dbo].[NutritionSnacksCakes] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,Starch,0.00,Fats,PortionSize,PortionMeasure
		FROM [dbo].[NutritionSnacksBreakfastBars] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,0.00,Protein,Fats,PortionSize,PortionMeasure
		FROM [dbo].[NutritionProteinVeal] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,0.00,Protein,Fats,PortionSize,PortionMeasure
		FROM [dbo].[NutritionProteinShellfish] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,0.00,Protein,Fats,PortionSize,PortionMeasure
		FROM [dbo].[NutritionProteinPoultry] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,0.00,Protein,Fats,PortionSize,PortionMeasure
		FROM [dbo].[NutritionProteinPork] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,0.00,Protein,Fats,PortionSize,PortionMeasure
		FROM [dbo].[NutritionProteinOther] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,0.00,Protein,Fats,PortionSize,PortionMeasure
		FROM [dbo].[NutritionProteinLamb] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,0.00,Protein,Fats,PortionSize,PortionMeasure
		FROM [dbo].[NutritionProteinFish] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,0.00,Protein,Fats,PortionSize,PortionMeasure
		FROM [dbo].[NutritionProteinEggs] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,0.00,Protein,Fats,PortionSize,PortionMeasure
		FROM [dbo].[NutritionProteinCheese] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,0.00,Protein,Fats,PortionSize,PortionMeasure
		FROM [dbo].[NutritionProteinBeef] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	INSERT INTO @Temp
        SELECT Product,Type,Starch,Protein,Fats,PortionSize,PortionMeasure
		FROM [dbo].[NutritionMilk] 
        WHERE Product LIKE '%' + @FOODTYPE + '%' 
        OR Type LIKE '%' + @FOODTYPE + '%'

	SELECT [Product],[Type],[Starch],[Fats],[Protein],[PortionSize],[PortionMeasure] FROM @Temp

END


GO



USE [TLW]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_Fruit]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_Fruit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_Fruit]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_FruitJuice]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_FruitJuice]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_FruitJuice]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_Milk]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_Milk]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_Milk]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_ProteinBeef]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_ProteinBeef]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_ProteinBeef]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_ProteinCheese]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_ProteinCheese]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_ProteinCheese]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_ProteinEggs]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_ProteinEggs]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_ProteinEggs]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_ProteinFish]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_ProteinFish]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_ProteinFish]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_ProteinLamb]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_ProteinLamb]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_ProteinLamb]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_ProteinOther]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_ProteinOther]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_ProteinOther]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_ProteinPork]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_ProteinPork]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_ProteinPork]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_ProteinPoultry]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_ProteinPoultry]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_ProteinPoultry]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_ProteinShellfish]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_ProteinShellfish]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_ProteinShellfish]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_ProteinVeal]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_ProteinVeal]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_ProteinVeal]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_SnacksBreakfastBars]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_SnacksBreakfastBars]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_SnacksBreakfastBars]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_SnacksCakes]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_SnacksCakes]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_SnacksCakes]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_SnacksCandy]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_SnacksCandy]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_SnacksCandy]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_SnacksChips]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_SnacksChips]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_SnacksChips]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_SnacksCookies]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_SnacksCookies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_SnacksCookies]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_SnacksCrackers]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_SnacksCrackers]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_SnacksCrackers]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_StarchBeans]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_StarchBeans]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_StarchBeans]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_StarchBreads]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_StarchBreads]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_StarchBreads]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_StarchCereals]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_StarchCereals]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_StarchCereals]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_StarchCreamyDesserts]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_StarchCreamyDesserts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_StarchCreamyDesserts]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_StarchDesserts]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_StarchDesserts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_StarchDesserts]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_StarchFats]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_StarchFats]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_StarchFats]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_StarchGrains]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_StarchGrains]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_StarchGrains]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_StarchSnacks]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_StarchSnacks]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_StarchSnacks]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_StarchVegetables]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_StarchVegetables]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_StarchVegetables]
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_Vegetables]    Script Date: 08/16/2012 13:43:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutrition_Get_Vegetables]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutrition_Get_Vegetables]
GO
/****** Object:  Table [dbo].[NutritionFruit]    Script Date: 08/16/2012 13:42:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionFruit]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionFruit]
GO
/****** Object:  Table [dbo].[NutritionFruitJuice]    Script Date: 08/16/2012 13:42:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionFruitJuice]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionFruitJuice]
GO
/****** Object:  Table [dbo].[NutritionMilk]    Script Date: 08/16/2012 13:42:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionMilk]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionMilk]
GO
/****** Object:  Table [dbo].[NutritionProteinBeef]    Script Date: 08/16/2012 13:42:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionProteinBeef]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionProteinBeef]
GO
/****** Object:  Table [dbo].[NutritionProteinCheese]    Script Date: 08/16/2012 13:42:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionProteinCheese]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionProteinCheese]
GO
/****** Object:  Table [dbo].[NutritionProteinEggs]    Script Date: 08/16/2012 13:42:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionProteinEggs]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionProteinEggs]
GO
/****** Object:  Table [dbo].[NutritionProteinFish]    Script Date: 08/16/2012 13:42:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionProteinFish]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionProteinFish]
GO
/****** Object:  Table [dbo].[NutritionProteinLamb]    Script Date: 08/16/2012 13:42:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionProteinLamb]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionProteinLamb]
GO
/****** Object:  Table [dbo].[NutritionProteinOther]    Script Date: 08/16/2012 13:42:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionProteinOther]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionProteinOther]
GO
/****** Object:  Table [dbo].[NutritionProteinPork]    Script Date: 08/16/2012 13:42:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionProteinPork]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionProteinPork]
GO
/****** Object:  Table [dbo].[NutritionProteinPoultry]    Script Date: 08/16/2012 13:42:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionProteinPoultry]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionProteinPoultry]
GO
/****** Object:  Table [dbo].[NutritionProteinShellfish]    Script Date: 08/16/2012 13:42:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionProteinShellfish]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionProteinShellfish]
GO
/****** Object:  Table [dbo].[NutritionProteinVeal]    Script Date: 08/16/2012 13:42:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionProteinVeal]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionProteinVeal]
GO
/****** Object:  Table [dbo].[NutritionSnacksBreakfastBars]    Script Date: 08/16/2012 13:42:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionSnacksBreakfastBars]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionSnacksBreakfastBars]
GO
/****** Object:  Table [dbo].[NutritionSnacksCakes]    Script Date: 08/16/2012 13:42:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionSnacksCakes]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionSnacksCakes]
GO
/****** Object:  Table [dbo].[NutritionSnacksCandy]    Script Date: 08/16/2012 13:42:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionSnacksCandy]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionSnacksCandy]
GO
/****** Object:  Table [dbo].[NutritionSnacksChips]    Script Date: 08/16/2012 13:42:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionSnacksChips]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionSnacksChips]
GO
/****** Object:  Table [dbo].[NutritionSnacksCookies]    Script Date: 08/16/2012 13:42:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionSnacksCookies]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionSnacksCookies]
GO
/****** Object:  Table [dbo].[NutritionSnacksCrackers]    Script Date: 08/16/2012 13:42:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionSnacksCrackers]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionSnacksCrackers]
GO
/****** Object:  Table [dbo].[NutritionStarchBeans]    Script Date: 08/16/2012 13:42:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionStarchBeans]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionStarchBeans]
GO
/****** Object:  Table [dbo].[NutritionStarchBreads]    Script Date: 08/16/2012 13:42:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionStarchBreads]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionStarchBreads]
GO
/****** Object:  Table [dbo].[NutritionStarchCereals]    Script Date: 08/16/2012 13:42:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionStarchCereals]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionStarchCereals]
GO
/****** Object:  Table [dbo].[NutritionStarchCreamyDesserts]    Script Date: 08/16/2012 13:42:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionStarchCreamyDesserts]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionStarchCreamyDesserts]
GO
/****** Object:  Table [dbo].[NutritionStarchDesserts]    Script Date: 08/16/2012 13:42:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionStarchDesserts]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionStarchDesserts]
GO
/****** Object:  Table [dbo].[NutritionStarchFats]    Script Date: 08/16/2012 13:42:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionStarchFats]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionStarchFats]
GO
/****** Object:  Table [dbo].[NutritionStarchGrains]    Script Date: 08/16/2012 13:42:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionStarchGrains]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionStarchGrains]
GO
/****** Object:  Table [dbo].[NutritionStarchSnacks]    Script Date: 08/16/2012 13:42:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionStarchSnacks]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionStarchSnacks]
GO
/****** Object:  Table [dbo].[NutritionStarchVegetables]    Script Date: 08/16/2012 13:42:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionStarchVegetables]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionStarchVegetables]
GO
/****** Object:  Table [dbo].[NutritionVegetables]    Script Date: 08/16/2012 13:42:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionVegetables]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionVegetables]
GO
/****** Object:  Table [dbo].[NutritionVegetables]    Script Date: 08/16/2012 13:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionVegetables](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Vegetable] [numeric](4, 3) NULL,
	[PortionSize] [numeric](4, 3) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionVegetables] ([Id], [Product], [Vegetable], [PortionSize], [PortionMeasure]) VALUES (1, N'Vegetables, cooked', CAST(1.000 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionVegetables] ([Id], [Product], [Vegetable], [PortionSize], [PortionMeasure]) VALUES (2, N'Vegateables, raw', CAST(1.000 AS Numeric(4, 3)), CAST(1.000 AS Numeric(4, 3)), N'cup')
/****** Object:  Table [dbo].[NutritionStarchVegetables]    Script Date: 08/16/2012 13:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionStarchVegetables](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Starch] [numeric](4, 3) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionStarchVegetables] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (20, N'Baked Beans', N'', CAST(1.500 AS Numeric(4, 3)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchVegetables] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (21, N'Corn', N'', CAST(1.000 AS Numeric(4, 3)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchVegetables] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (22, N'Mixed Vegetables', N'With corn, peas or pasta', CAST(1.000 AS Numeric(4, 3)), CAST(1.00 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchVegetables] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (23, N'Peas', N'Green', CAST(1.000 AS Numeric(4, 3)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchVegetables] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (24, N'Potato', N'Baked/Boiled', CAST(1.000 AS Numeric(4, 3)), CAST(3.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionStarchVegetables] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (25, N'Potato', N'Mashed', CAST(1.000 AS Numeric(4, 3)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchVegetables] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (26, N'Squash', N'Winter', CAST(1.000 AS Numeric(4, 3)), CAST(1.00 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchVegetables] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (27, N'Yam / Sweet Potato', N'', CAST(1.000 AS Numeric(4, 3)), CAST(1.00 AS Numeric(4, 2)), N'cup')
/****** Object:  Table [dbo].[NutritionStarchSnacks]    Script Date: 08/16/2012 13:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionStarchSnacks](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Starch] [numeric](4, 2) NULL,
	[Fats] [numeric](4, 2) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionStarchSnacks] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (28, N'Animal Crackers', N'', CAST(1.00 AS Numeric(4, 2)), NULL, CAST(8.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionStarchSnacks] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (29, N'Graham Crackers', N'', CAST(1.00 AS Numeric(4, 2)), NULL, CAST(3.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionStarchSnacks] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (30, N'Matzoh', N'', CAST(1.00 AS Numeric(4, 2)), NULL, CAST(0.75 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionStarchSnacks] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (31, N'Melba Toast', N'', CAST(1.00 AS Numeric(4, 2)), NULL, CAST(4.00 AS Numeric(4, 2)), N'slices')
INSERT [dbo].[NutritionStarchSnacks] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (32, N'Oyster Crackers', NULL, CAST(1.00 AS Numeric(4, 2)), NULL, CAST(24.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionStarchSnacks] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (33, N'Popcorn, low-fat', N'Microwave', CAST(1.00 AS Numeric(4, 2)), NULL, CAST(3.00 AS Numeric(4, 2)), N'cups')
INSERT [dbo].[NutritionStarchSnacks] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (34, N'Pretzels, twists', NULL, CAST(1.00 AS Numeric(4, 2)), NULL, CAST(0.75 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionStarchSnacks] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (35, N'Rice Cakes', N'4" ', CAST(1.00 AS Numeric(4, 2)), NULL, CAST(2.00 AS Numeric(4, 2)), N'cakes')
INSERT [dbo].[NutritionStarchSnacks] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (36, N'Saltine Crackers', NULL, CAST(1.00 AS Numeric(4, 2)), NULL, CAST(6.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionStarchSnacks] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (37, N'Snack Chips, fat free', NULL, CAST(1.00 AS Numeric(4, 2)), NULL, CAST(0.75 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionStarchSnacks] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (38, N'Crackers', N'Whole Wheat', CAST(1.00 AS Numeric(4, 2)), NULL, CAST(0.75 AS Numeric(4, 2)), N'oz')
/****** Object:  Table [dbo].[NutritionStarchGrains]    Script Date: 08/16/2012 13:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionStarchGrains](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Starch] [numeric](4, 3) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionStarchGrains] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (16, N'Bulgur', N'', CAST(1.000 AS Numeric(4, 3)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchGrains] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (17, N'Couscous', N'', CAST(1.500 AS Numeric(4, 3)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchGrains] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (18, N'Pasta', N'Cooked', CAST(1.000 AS Numeric(4, 3)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchGrains] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (19, N'Rice', N'White/Brown', CAST(1.500 AS Numeric(4, 3)), CAST(0.50 AS Numeric(4, 2)), N'cup')
/****** Object:  Table [dbo].[NutritionStarchFats]    Script Date: 08/16/2012 13:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionStarchFats](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Starch] [numeric](4, 2) NULL,
	[Fat] [numeric](4, 2) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (1, N'Biscuits', N'2 1/2" ', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'biscuit')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (2, N'Chow Mein Noodles', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (3, N'Corn Bread', N'3" x 3" x 3/4"', CAST(1.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'serving')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (4, N'Crackers', N'Ritz', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(6.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (5, N'Croutons', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (6, N'French Fries', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(20.00 AS Numeric(4, 2)), N'fries')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (7, N'Granola', N'Regular', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(0.25 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (8, N'Muffin', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.50 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (9, N'Pancake', N'4"', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'pancakes')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (10, N'Popcorn', N'Microwave', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(3.00 AS Numeric(4, 2)), N'cups')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (11, N'Sandwich Crackers', N'Cheese, Peanut Butter', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(3.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (12, N'Stuffing, bread', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(0.33 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (13, N'Taco Shell', N'6"', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'shells')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (14, N'Tortilla, small', N'Flour', CAST(1.50 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'tortilla')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (15, N'Tortilla, large', N'Flour', CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'tortilla')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (16, N'Waffle', N'4 1/4"', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'waffle')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (17, N'Crackers', N'Whole Wheat', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
/****** Object:  Table [dbo].[NutritionStarchDesserts]    Script Date: 08/16/2012 13:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionStarchDesserts](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Starch] [numeric](4, 2) NULL,
	[Fat] [numeric](4, 2) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (1, N'Angel Food Cake', N'Unfrosted', CAST(1.50 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'1/2 slice')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (2, N'Brownie, small', N'Unfrosted, 2" x 2"', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'brownie')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (3, N'Cake', N'Unfrosted, 2" x 2"', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'slice')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (4, N'Cake', N'Frosted, 2" x 2"', CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'slice')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (5, N'Cookie', N'Fat-free', CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'cookies')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (6, N'Cookie Sandwich', N'Cream-filled', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'cookies')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (7, N'Doughnut', N'Plain', CAST(1.50 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'doughnut')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (8, N'Doughnut', N'Glazed', CAST(2.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'doughnut')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (9, N'Gingersnaps', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)), CAST(3.00 AS Numeric(4, 2)), N'cookies')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (10, N'Granola Bar', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'bar')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (11, N'Granola Bar', N'Fat-free', CAST(1.00 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'bar')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (12, N'Pie', N'Fruit', CAST(2.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'small slice')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (13, N'Pie', N'Pumpkin, Custard', CAST(1.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'small slice')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (14, N'Vanilla Wafers', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)), CAST(5.00 AS Numeric(4, 2)), N'wafers')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (15, N'Fruit Juice Bars', N'100% Juice', CAST(1.00 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'bar')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (16, N'Fruit Spreads', N'100% Juice', CAST(1.00 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'tbsp')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (17, N'Ice Cream', N'Non-fat', CAST(1.00 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (18, N'Ice Cream', N'Regular', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (19, N'Pudding, regular', N'1% Milk', CAST(2.00 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (20, N'Pudding, sugar-free', N'1% Milk', CAST(1.00 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (21, N'Sherbet', N'Sorbet', CAST(2.00 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (22, N'Frozen Yogurt', N'Low-fat', CAST(1.00 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fat], [PortionSize], [PortionMeasure]) VALUES (23, N'Frozen Yogurt', N'Haagen-Daas', CAST(1.50 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), N'cup')
/****** Object:  Table [dbo].[NutritionStarchCreamyDesserts]    Script Date: 08/16/2012 13:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionStarchCreamyDesserts](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Starch] [numeric](4, 2) NULL,
	[Fat] [numeric](4, 2) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NutritionStarchCereals]    Script Date: 08/16/2012 13:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionStarchCereals](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Starch] [numeric](4, 3) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionStarchCereals] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (39, N'Cereal', N'Bran', CAST(1.000 AS Numeric(4, 3)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchCereals] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (40, N'Cereals', N'Regular', CAST(1.000 AS Numeric(4, 3)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchCereals] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (41, N'Grape Nuts', NULL, CAST(1.000 AS Numeric(4, 3)), CAST(0.25 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchCereals] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (42, N'Grits', NULL, CAST(1.000 AS Numeric(4, 3)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchCereals] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (43, N'Mueslix', NULL, CAST(1.000 AS Numeric(4, 3)), CAST(0.25 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchCereals] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (44, N'Puffed Cereal', NULL, CAST(1.000 AS Numeric(4, 3)), CAST(1.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchCereals] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (45, N'Shredded Wheat', NULL, CAST(1.000 AS Numeric(4, 3)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchCereals] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (46, N'Cereal', N'Sugar-frosted', CAST(1.000 AS Numeric(4, 3)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchCereals] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (47, N'Wheat Germ', NULL, CAST(1.000 AS Numeric(4, 3)), CAST(3.00 AS Numeric(4, 2)), N'tbsp')
/****** Object:  Table [dbo].[NutritionStarchBreads]    Script Date: 08/16/2012 13:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionStarchBreads](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Starch] [numeric](4, 3) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionStarchBreads] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (1, N'Bagel', N'Lender''s', CAST(2.000 AS Numeric(4, 3)), CAST(1.00 AS Numeric(4, 2)), N'bagel')
INSERT [dbo].[NutritionStarchBreads] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (2, N'Bagel', N'Deli', CAST(3.500 AS Numeric(4, 3)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionStarchBreads] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (3, N'Bread', N'Reduced Calorie', CAST(1.000 AS Numeric(4, 3)), CAST(2.00 AS Numeric(4, 2)), N'slices')
INSERT [dbo].[NutritionStarchBreads] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (4, N'Bread', N'White/Whole Wheat/Etc.', CAST(1.000 AS Numeric(4, 3)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionStarchBreads] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (5, N'Bread Sticks', N'8" x 1/2"', CAST(2.000 AS Numeric(4, 3)), CAST(1.00 AS Numeric(4, 2)), N'stick')
INSERT [dbo].[NutritionStarchBreads] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (6, N'English Muffin', N'', CAST(2.000 AS Numeric(4, 3)), CAST(1.00 AS Numeric(4, 2)), N'muffin')
INSERT [dbo].[NutritionStarchBreads] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (7, N'Hot Dog Bun', N'', CAST(2.000 AS Numeric(4, 3)), CAST(2.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionStarchBreads] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (8, N'Hamburger Bun', N'', CAST(2.000 AS Numeric(4, 3)), CAST(2.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionStarchBreads] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (9, N'Lite Bun', N'', CAST(1.000 AS Numeric(4, 3)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionStarchBreads] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (10, N'Pita', N'6"', CAST(2.000 AS Numeric(4, 3)), CAST(2.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionStarchBreads] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (11, N'Raisin Bread', N'', CAST(1.000 AS Numeric(4, 3)), CAST(1.00 AS Numeric(4, 2)), N'slice')
INSERT [dbo].[NutritionStarchBreads] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (12, N'Roll', N'Plain', CAST(1.000 AS Numeric(4, 3)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionStarchBreads] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (13, N'Tortilla', N'6" Corn', CAST(1.000 AS Numeric(4, 3)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionStarchBreads] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (14, N'Tortilla', N'6" Flour', CAST(1.000 AS Numeric(4, 3)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionStarchBreads] ([Id], [Product], [Type], [Starch], [PortionSize], [PortionMeasure]) VALUES (15, N'Waffle', N'4 1/2" Square', CAST(1.000 AS Numeric(4, 3)), CAST(1.00 AS Numeric(4, 2)), N'waffle')
/****** Object:  Table [dbo].[NutritionStarchBeans]    Script Date: 08/16/2012 13:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionStarchBeans](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Starch] [numeric](4, 2) NULL,
	[Protein] [numeric](4, 2) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionStarchBeans] ([Id], [Product], [Type], [Starch], [Protein], [PortionSize], [PortionMeasure]) VALUES (1, N'Beans', N'Garbanzo, Pinto, Kidney', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchBeans] ([Id], [Product], [Type], [Starch], [Protein], [PortionSize], [PortionMeasure]) VALUES (2, N'Peas', N'Split, Black-eyed', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchBeans] ([Id], [Product], [Type], [Starch], [Protein], [PortionSize], [PortionMeasure]) VALUES (3, N'Lentils', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), N'cup')
/****** Object:  Table [dbo].[NutritionSnacksCrackers]    Script Date: 08/16/2012 13:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionSnacksCrackers](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Starch] [numeric](4, 2) NULL,
	[Fats] [numeric](4, 2) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionSnacksCrackers] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (29, N'Cheese Nips', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(20.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionSnacksCrackers] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (30, N'Goldfish', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(45.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionSnacksCrackers] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (31, N'HiHo Crackers', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(6.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionSnacksCrackers] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (32, N'Ritz Bitz', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(40.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionSnacksCrackers] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (33, N'Ritz Crackers', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(6.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionSnacksCrackers] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (34, N'Triscuits', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(6.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionSnacksCrackers] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (35, N'Wasa Crackers', NULL, CAST(1.00 AS Numeric(4, 2)), NULL, CAST(2.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionSnacksCrackers] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (36, N'Wheat Thins', NULL, CAST(1.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(18.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionSnacksCrackers] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (37, N'Wheatables', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(24.00 AS Numeric(4, 2)), N'crackers')
/****** Object:  Table [dbo].[NutritionSnacksCookies]    Script Date: 08/16/2012 13:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionSnacksCookies](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Starch] [numeric](4, 2) NULL,
	[Fats] [numeric](4, 2) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionSnacksCookies] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (17, N'Oatmeal Raisin Cookies', N'Archway', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(3.00 AS Numeric(4, 2)), N'cookies')
INSERT [dbo].[NutritionSnacksCookies] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (18, N'Chips Ahoy Cookies', NULL, CAST(1.50 AS Numeric(4, 2)), CAST(1.50 AS Numeric(4, 2)), CAST(3.00 AS Numeric(4, 2)), N'cookies')
INSERT [dbo].[NutritionSnacksCookies] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (19, N'Chocolate Chip Cookies', N'Entenmann''s', CAST(1.00 AS Numeric(4, 2)), CAST(1.50 AS Numeric(4, 2)), CAST(3.00 AS Numeric(4, 2)), N'cookies')
INSERT [dbo].[NutritionSnacksCookies] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (20, N'Fig Newtons', NULL, CAST(1.50 AS Numeric(4, 2)), NULL, CAST(2.00 AS Numeric(4, 2)), N'cookies')
INSERT [dbo].[NutritionSnacksCookies] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (21, N'Pecan Sandies', N'Keebler', CAST(1.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'cookies')
INSERT [dbo].[NutritionSnacksCookies] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (22, N'Gingersnaps', N'Nabisco', CAST(1.50 AS Numeric(4, 2)), NULL, CAST(4.00 AS Numeric(4, 2)), N'cookies')
INSERT [dbo].[NutritionSnacksCookies] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (23, N'Nilla Wafers', NULL, CAST(1.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(8.00 AS Numeric(4, 2)), N'wafers')
INSERT [dbo].[NutritionSnacksCookies] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (24, N'Nutter Butter', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'cookies')
INSERT [dbo].[NutritionSnacksCookies] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (25, N'Oreos', NULL, CAST(1.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(3.00 AS Numeric(4, 2)), N'cookies')
INSERT [dbo].[NutritionSnacksCookies] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (26, N'Chocolate Chip Cookies', N'Snackwell', CAST(1.50 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(13.00 AS Numeric(4, 2)), N'cookies')
INSERT [dbo].[NutritionSnacksCookies] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (27, N'Teddy Grahams', NULL, CAST(1.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(25.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionSnacksCookies] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (28, N'Vienna Fingers', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'cookies')
/****** Object:  Table [dbo].[NutritionSnacksChips]    Script Date: 08/16/2012 13:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionSnacksChips](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Starch] [numeric](4, 2) NULL,
	[Fats] [numeric](4, 2) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionSnacksChips] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (29, N'Cheese Nips', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(20.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionSnacksChips] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (30, N'Goldfish', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(45.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionSnacksChips] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (31, N'HiHo Crackers', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(6.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionSnacksChips] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (32, N'Ritz Bitz', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(40.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionSnacksChips] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (33, N'Ritz Crackers', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(6.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionSnacksChips] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (34, N'Triscuits', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(6.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionSnacksChips] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (35, N'Wasa Crackers', NULL, CAST(1.00 AS Numeric(4, 2)), NULL, CAST(2.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionSnacksChips] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (36, N'Wheat Thins', NULL, CAST(1.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(18.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionSnacksChips] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (37, N'Wheatables', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(24.00 AS Numeric(4, 2)), N'crackers')
/****** Object:  Table [dbo].[NutritionSnacksCandy]    Script Date: 08/16/2012 13:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionSnacksCandy](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Starch] [numeric](4, 2) NULL,
	[Fats] [numeric](4, 2) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionSnacksCandy] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (38, N'3 Musketeers', N'2.13 oz ', CAST(2.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'bar')
INSERT [dbo].[NutritionSnacksCandy] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (39, N'Baby Ruth', N'2 oz', CAST(2.50 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'bar')
INSERT [dbo].[NutritionSnacksCandy] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (40, N'Butterfingers', N'2 oz', CAST(2.50 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'bar')
INSERT [dbo].[NutritionSnacksCandy] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (41, N'Butterfingers BBs', NULL, CAST(2.00 AS Numeric(4, 2)), CAST(1.50 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionSnacksCandy] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (42, N'Charleston Chew', NULL, CAST(2.50 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionSnacksCandy] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (43, N'Good & Plenty', N'1.4 oz', CAST(1.50 AS Numeric(4, 2)), NULL, CAST(1.00 AS Numeric(4, 2)), N'bar')
INSERT [dbo].[NutritionSnacksCandy] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (44, N'Junior Mints', N'1.6 oz', CAST(2.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'bar')
INSERT [dbo].[NutritionSnacksCandy] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (45, N'Krackel', N'2.6 oz', CAST(2.50 AS Numeric(4, 2)), CAST(4.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'bar')
INSERT [dbo].[NutritionSnacksCandy] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (46, N'M & Ms', N'Almond, 1.5 oz', CAST(1.50 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'bag')
INSERT [dbo].[NutritionSnacksCandy] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (47, N'M & Ms', N'Peanut, 1.5 oz', CAST(1.50 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'bag')
INSERT [dbo].[NutritionSnacksCandy] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (48, N'M & Ms', N'Plain, 1.5 oz', CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'bag')
INSERT [dbo].[NutritionSnacksCandy] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (49, N'Marshmallows', NULL, CAST(1.00 AS Numeric(4, 2)), NULL, CAST(5.00 AS Numeric(4, 2)), N'marshmallows')
INSERT [dbo].[NutritionSnacksCandy] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (50, N'Milky Way', N'2.15 oz', CAST(2.50 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'bar')
INSERT [dbo].[NutritionSnacksCandy] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (51, N'Peppermint Patty', NULL, CAST(2.00 AS Numeric(4, 2)), NULL, CAST(1.00 AS Numeric(4, 2)), N'patty')
INSERT [dbo].[NutritionSnacksCandy] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (52, N'Raisinets', NULL, CAST(2.00 AS Numeric(4, 2)), CAST(1.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'box')
INSERT [dbo].[NutritionSnacksCandy] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (53, N'Reese''s Peanut Butter Cup', NULL, CAST(1.50 AS Numeric(4, 2)), CAST(3.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'cups')
INSERT [dbo].[NutritionSnacksCandy] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (54, N'Rolo', N'1.9 oz', CAST(2.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'bar')
INSERT [dbo].[NutritionSnacksCandy] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (55, N'Skittles', N'1.5 oz', CAST(2.00 AS Numeric(4, 2)), NULL, CAST(1.00 AS Numeric(4, 2)), N'bag')
INSERT [dbo].[NutritionSnacksCandy] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (56, N'Snickers', N'2.07 oz', CAST(2.00 AS Numeric(4, 2)), CAST(2.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'bar')
INSERT [dbo].[NutritionSnacksCandy] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (57, N'Tootsie Rolls', NULL, CAST(2.00 AS Numeric(4, 2)), NULL, CAST(6.00 AS Numeric(4, 2)), N'rolls')
INSERT [dbo].[NutritionSnacksCandy] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (58, N'Twix', NULL, CAST(2.00 AS Numeric(4, 2)), CAST(2.50 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'pieces')
INSERT [dbo].[NutritionSnacksCandy] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (59, N'Twizzlers', NULL, CAST(1.50 AS Numeric(4, 2)), NULL, CAST(4.00 AS Numeric(4, 2)), N'pieces')
INSERT [dbo].[NutritionSnacksCandy] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (60, N'Whatchamacallit', N'1.7 oz ', CAST(2.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'bar')
INSERT [dbo].[NutritionSnacksCandy] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (61, N'Whoppers', N'1.4 oz', CAST(2.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'box')
/****** Object:  Table [dbo].[NutritionSnacksCakes]    Script Date: 08/16/2012 13:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionSnacksCakes](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Starch] [numeric](4, 2) NULL,
	[Fats] [numeric](4, 2) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionSnacksCakes] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (62, N'Butterscotch Krimpets', NULL, CAST(1.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'cakes')
INSERT [dbo].[NutritionSnacksCakes] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (63, N'Devil Dogs', NULL, CAST(1.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'package')
INSERT [dbo].[NutritionSnacksCakes] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (64, N'Ding Dongs', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'package')
INSERT [dbo].[NutritionSnacksCakes] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (65, N'Funny Bones', NULL, CAST(2.50 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'cakes')
INSERT [dbo].[NutritionSnacksCakes] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (66, N'HoHos', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'package')
INSERT [dbo].[NutritionSnacksCakes] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (67, N'Ring Dings', NULL, CAST(2.50 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'cakes')
INSERT [dbo].[NutritionSnacksCakes] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (68, N'Sno Balls', NULL, CAST(1.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'package')
INSERT [dbo].[NutritionSnacksCakes] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (69, N'Tastycake Koffee Kake', NULL, CAST(2.50 AS Numeric(4, 2)), CAST(1.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'package')
INSERT [dbo].[NutritionSnacksCakes] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (70, N'Twinkies', NULL, CAST(2.50 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'twinkies')
INSERT [dbo].[NutritionSnacksCakes] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (71, N'Yankee Doodles', NULL, CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'cakes')
INSERT [dbo].[NutritionSnacksCakes] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (72, N'Yodels', NULL, CAST(2.00 AS Numeric(4, 2)), CAST(2.50 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'cakes')
INSERT [dbo].[NutritionSnacksCakes] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (62, N'Butterscotch Krimpets', NULL, CAST(1.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'cakes')
INSERT [dbo].[NutritionSnacksCakes] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (63, N'Devil Dogs', NULL, CAST(1.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'package')
INSERT [dbo].[NutritionSnacksCakes] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (64, N'Ding Dongs', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'package')
INSERT [dbo].[NutritionSnacksCakes] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (65, N'Funny Bones', NULL, CAST(2.50 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'cakes')
INSERT [dbo].[NutritionSnacksCakes] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (66, N'HoHos', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'package')
INSERT [dbo].[NutritionSnacksCakes] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (67, N'Ring Dings', NULL, CAST(2.50 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'cakes')
INSERT [dbo].[NutritionSnacksCakes] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (68, N'Sno Balls', NULL, CAST(1.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'package')
INSERT [dbo].[NutritionSnacksCakes] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (69, N'Tastycake Koffee Kake', NULL, CAST(2.50 AS Numeric(4, 2)), CAST(1.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'package')
INSERT [dbo].[NutritionSnacksCakes] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (70, N'Twinkies', NULL, CAST(2.50 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'twinkies')
INSERT [dbo].[NutritionSnacksCakes] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (71, N'Yankee Doodles', NULL, CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'cakes')
INSERT [dbo].[NutritionSnacksCakes] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (72, N'Yodels', NULL, CAST(2.00 AS Numeric(4, 2)), CAST(2.50 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'cakes')
/****** Object:  Table [dbo].[NutritionSnacksBreakfastBars]    Script Date: 08/16/2012 13:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionSnacksBreakfastBars](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Starch] [numeric](4, 2) NULL,
	[Fats] [numeric](4, 2) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionSnacksBreakfastBars] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (1, N'Nutrigrain Bar', NULL, CAST(2.50 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'bar')
INSERT [dbo].[NutritionSnacksBreakfastBars] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (2, N'Pop Tart', NULL, CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'pop tart')
INSERT [dbo].[NutritionSnacksBreakfastBars] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (3, N'Rice Krispie Treat', NULL, CAST(1.00 AS Numeric(4, 2)), NULL, CAST(1.00 AS Numeric(4, 2)), N'treat')
INSERT [dbo].[NutritionSnacksBreakfastBars] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (4, N'Snackwell Bar', NULL, CAST(2.00 AS Numeric(4, 2)), NULL, CAST(1.00 AS Numeric(4, 2)), N'bar')
/****** Object:  Table [dbo].[NutritionProteinVeal]    Script Date: 08/16/2012 13:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionProteinVeal](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Protein] [numeric](4, 2) NULL,
	[Fats] [numeric](4, 2) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionProteinVeal] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (57, N'Veal Cutlet', N'Ground', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinVeal] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (58, N'Veal Chop', N'Lean', CAST(1.00 AS Numeric(4, 2)), NULL, CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinVeal] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (59, N'Veal Roast', NULL, CAST(1.00 AS Numeric(4, 2)), NULL, CAST(1.00 AS Numeric(4, 2)), N'oz')
/****** Object:  Table [dbo].[NutritionProteinShellfish]    Script Date: 08/16/2012 13:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionProteinShellfish](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Protein] [numeric](4, 2) NULL,
	[Fats] [numeric](4, 2) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionProteinShellfish] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (54, N'Clam, Crab, Lobster', NULL, CAST(1.00 AS Numeric(4, 2)), NULL, CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinShellfish] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (55, N'Imitation Shellfish', NULL, CAST(1.00 AS Numeric(4, 2)), NULL, CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinShellfish] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (56, N'Scallops, Shrimp', NULL, CAST(1.00 AS Numeric(4, 2)), NULL, CAST(1.00 AS Numeric(4, 2)), N'oz')
/****** Object:  Table [dbo].[NutritionProteinPoultry]    Script Date: 08/16/2012 13:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionProteinPoultry](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Protein] [numeric](4, 2) NULL,
	[Fats] [numeric](4, 2) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionProteinPoultry] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (46, N'Chicken', N'White Meat', CAST(1.00 AS Numeric(4, 2)), NULL, CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinPoultry] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (47, N'Chicken', N'Dark Meat', CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinPoultry] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (48, N'Chicken', N'Ground', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinPoultry] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (49, N'Chicken', N'Fried', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinPoultry] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (50, N'Cornish Hen', N'Skin-free', CAST(1.00 AS Numeric(4, 2)), NULL, CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinPoultry] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (51, N'Turkey', N'White Meat', CAST(1.00 AS Numeric(4, 2)), NULL, CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinPoultry] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (52, N'Turkey', N'Dark Meat', CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinPoultry] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (53, N'Turkey', N'Ground', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
/****** Object:  Table [dbo].[NutritionProteinPork]    Script Date: 08/16/2012 13:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionProteinPork](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Protein] [numeric](4, 2) NULL,
	[Fats] [numeric](4, 2) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionProteinPork] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (38, N'Candadian Bacon', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinPork] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (39, N'Pork', N'Ground', CAST(1.00 AS Numeric(4, 2)), CAST(1.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinPork] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (40, N'Ham', N'Fresh', CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinPork] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (41, N'Ham', N'Boiled, Canned, Cured', CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinPork] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (42, N'Pork Loin Chop', N'Center Cut', CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinPork] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (43, N'Pork Loin Chop', N'Top Cut', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinPork] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (44, N'Pork Loin Chop', N'Cutlet', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinPork] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (45, N'Pork Sausage', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
/****** Object:  Table [dbo].[NutritionProteinOther]    Script Date: 08/16/2012 13:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionProteinOther](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Protein] [numeric](4, 2) NULL,
	[Fats] [numeric](4, 2) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionProteinOther] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (60, N'Bacon', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.50 AS Numeric(4, 2)), CAST(3.00 AS Numeric(4, 2)), N'slices')
INSERT [dbo].[NutritionProteinOther] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (61, N'Hot Dog', N'Non-fat', CAST(1.00 AS Numeric(4, 2)), NULL, CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinOther] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (62, N'Hot Dog', N'Low-fat', CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(1.50 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinOther] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (63, N'Hot Dog', N'Turkey, Chicken', CAST(1.00 AS Numeric(4, 2)), CAST(1.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinOther] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (64, N'Hot Dog', N'Beef, Pork, Combo', CAST(1.00 AS Numeric(4, 2)), CAST(2.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinOther] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (65, N'Liver', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinOther] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (66, N'Peanut Butter', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(3.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'tbsp')
INSERT [dbo].[NutritionProteinOther] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (67, N'Processed Meat', N'Non-fat', CAST(1.00 AS Numeric(4, 2)), NULL, CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinOther] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (68, N'Sausage', N'Non-fat', CAST(1.00 AS Numeric(4, 2)), NULL, CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinOther] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (69, N'Sausage', N'Low-fat', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinOther] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (70, N'Sausage', N'Regular', CAST(1.00 AS Numeric(4, 2)), CAST(1.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinOther] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (71, N'Soy Milk', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionProteinOther] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (72, N'Tempeh', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(0.25 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionProteinOther] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (73, N'Tofu', N'Firm', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(4.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinOther] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (74, N'Tofu', N'Silken ', CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(5.00 AS Numeric(4, 2)), N'oz')
/****** Object:  Table [dbo].[NutritionProteinLamb]    Script Date: 08/16/2012 13:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionProteinLamb](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Protein] [numeric](4, 2) NULL,
	[Fats] [numeric](4, 2) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionProteinLamb] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (34, N'Lamb Chop', NULL, CAST(1.00 AS Numeric(4, 2)), NULL, CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinLamb] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (35, N'Lamb', N'Ground', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinLamb] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (36, N'Lamb', N'Rib Roast', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinLamb] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (37, N'Lamb', N'Roast', CAST(1.00 AS Numeric(4, 2)), NULL, CAST(1.00 AS Numeric(4, 2)), N'oz')
/****** Object:  Table [dbo].[NutritionProteinFish]    Script Date: 08/16/2012 13:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionProteinFish](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Protein] [numeric](4, 2) NULL,
	[Fats] [numeric](4, 2) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionProteinFish] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (25, N'Catfish', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinFish] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (26, N'Cod, Flounder, Haddock', NULL, CAST(1.00 AS Numeric(4, 2)), NULL, CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinFish] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (27, N'Fired Fish', N'Any  Type', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinFish] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (28, N'Salmon', N'Fresh', CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinFish] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (29, N'Salmon', N'Canned', CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(0.25 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionProteinFish] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (30, N'Trout', NULL, CAST(1.00 AS Numeric(4, 2)), NULL, CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinFish] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (31, N'Tuna', N'Fresh', CAST(1.00 AS Numeric(4, 2)), NULL, CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinFish] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (32, N'Tuna', N'Canned in Water, 2 oz', CAST(2.00 AS Numeric(4, 2)), NULL, CAST(0.25 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionProteinFish] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (33, N'Tuna', N'Canned in Oil, 2 oz', CAST(2.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(0.25 AS Numeric(4, 2)), N'cup')
/****** Object:  Table [dbo].[NutritionProteinEggs]    Script Date: 08/16/2012 13:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionProteinEggs](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Protein] [numeric](4, 2) NULL,
	[Fats] [numeric](4, 2) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionProteinEggs] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (22, N'Egg', N'White Only', CAST(1.00 AS Numeric(4, 2)), NULL, CAST(2.00 AS Numeric(4, 2)), N'eggs')
INSERT [dbo].[NutritionProteinEggs] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (23, N'Egg', N'Substitutes', CAST(1.00 AS Numeric(4, 2)), NULL, CAST(0.25 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionProteinEggs] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (24, N'Egg', N'Whole', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'egg')
/****** Object:  Table [dbo].[NutritionProteinCheese]    Script Date: 08/16/2012 13:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionProteinCheese](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Protein] [numeric](4, 2) NULL,
	[Fats] [numeric](4, 2) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionProteinCheese] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (11, N'Cheese', N'Non-fat', CAST(1.00 AS Numeric(4, 2)), NULL, CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinCheese] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (12, N'Cheese', N'Low-fat', CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinCheese] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (13, N'Cheese', N'Regular', CAST(1.00 AS Numeric(4, 2)), CAST(1.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinCheese] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (14, N'Cottage Cheese', N'Non-fat', CAST(1.00 AS Numeric(4, 2)), NULL, CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinCheese] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (15, N'Cottage Cheese', N'Regular', CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinCheese] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (16, N'Feta Cheese', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(0.25 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionProteinCheese] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (17, N'Mozzarella', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinCheese] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (18, N'Nonfat Cheese', NULL, CAST(1.00 AS Numeric(4, 2)), NULL, CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinCheese] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (19, N'Parmesan', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'tbsp')
INSERT [dbo].[NutritionProteinCheese] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (20, N'Ricotta', N'Skim Milk', CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(0.25 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionProteinCheese] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (21, N'Ricotta', N'Whole Milk', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(0.25 AS Numeric(4, 2)), N'cup')
/****** Object:  Table [dbo].[NutritionProteinBeef]    Script Date: 08/16/2012 13:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionProteinBeef](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Protein] [numeric](4, 2) NULL,
	[Fats] [numeric](4, 2) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionProteinBeef] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (1, N'Flank Steak', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinBeef] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (2, N'Ground Beef', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinBeef] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (3, N'Ground Beef', N'Other', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinBeef] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (4, N'Meatloaf', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinBeef] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (5, N'Prime Rib', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinBeef] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (6, N'Roast', N'Rib, Chuck, Rump', CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinBeef] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (7, N'Round', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinBeef] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (8, N'Sirloin', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinBeef] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (9, N'Steak', N'T-bone, Porterhouse, Cubed', CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionProteinBeef] ([Id], [Product], [Type], [Protein], [Fats], [PortionSize], [PortionMeasure]) VALUES (10, N'Tenderloin', N'Filet Mignon', CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
/****** Object:  Table [dbo].[NutritionMilk]    Script Date: 08/16/2012 13:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionMilk](
	[Id] [int] NOT NULL,
	[Product] [varchar](50) NOT NULL,
	[Milk] [numeric](4, 3) NULL,
	[Starch] [numeric](4, 3) NULL,
	[Fat] [numeric](4, 3) NULL,
	[Protein] [numeric](4, 3) NULL,
	[PortionSize] [numeric](4, 3) NOT NULL,
	[PortionMeasure] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionMilk] ([Id], [Product], [Milk], [Starch], [Fat], [Protein], [PortionSize], [PortionMeasure]) VALUES (1, N'Skim Milk', CAST(1.000 AS Numeric(4, 3)), NULL, NULL, NULL, CAST(8.000 AS Numeric(4, 3)), N'oz')
INSERT [dbo].[NutritionMilk] ([Id], [Product], [Milk], [Starch], [Fat], [Protein], [PortionSize], [PortionMeasure]) VALUES (2, N'1% Milk', CAST(1.000 AS Numeric(4, 3)), NULL, CAST(0.500 AS Numeric(4, 3)), NULL, CAST(8.000 AS Numeric(4, 3)), N'oz')
INSERT [dbo].[NutritionMilk] ([Id], [Product], [Milk], [Starch], [Fat], [Protein], [PortionSize], [PortionMeasure]) VALUES (3, N'2% Milk', CAST(1.000 AS Numeric(4, 3)), NULL, CAST(1.000 AS Numeric(4, 3)), NULL, CAST(8.000 AS Numeric(4, 3)), N'oz')
INSERT [dbo].[NutritionMilk] ([Id], [Product], [Milk], [Starch], [Fat], [Protein], [PortionSize], [PortionMeasure]) VALUES (4, N'Whole Milk', CAST(1.000 AS Numeric(4, 3)), NULL, CAST(1.500 AS Numeric(4, 3)), NULL, CAST(8.000 AS Numeric(4, 3)), N'oz')
INSERT [dbo].[NutritionMilk] ([Id], [Product], [Milk], [Starch], [Fat], [Protein], [PortionSize], [PortionMeasure]) VALUES (5, N'Chocolate Milk (skim)', CAST(1.000 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), NULL, NULL, CAST(8.000 AS Numeric(4, 3)), N'oz')
INSERT [dbo].[NutritionMilk] ([Id], [Product], [Milk], [Starch], [Fat], [Protein], [PortionSize], [PortionMeasure]) VALUES (6, N'1% Chocolate Milk', CAST(1.000 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), NULL, CAST(8.000 AS Numeric(4, 3)), N'oz')
INSERT [dbo].[NutritionMilk] ([Id], [Product], [Milk], [Starch], [Fat], [Protein], [PortionSize], [PortionMeasure]) VALUES (7, N'LActaid Milk (skim)', CAST(1.000 AS Numeric(4, 3)), NULL, NULL, NULL, CAST(8.000 AS Numeric(4, 3)), N'oz')
INSERT [dbo].[NutritionMilk] ([Id], [Product], [Milk], [Starch], [Fat], [Protein], [PortionSize], [PortionMeasure]) VALUES (8, N'Nonfat Dray Milk Powder', CAST(1.000 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), NULL, CAST(1.000 AS Numeric(4, 3)), CAST(0.330 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionMilk] ([Id], [Product], [Milk], [Starch], [Fat], [Protein], [PortionSize], [PortionMeasure]) VALUES (9, N'Plain Low-Fat Yogurt', CAST(1.000 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), NULL, CAST(8.000 AS Numeric(4, 3)), N'oz')
INSERT [dbo].[NutritionMilk] ([Id], [Product], [Milk], [Starch], [Fat], [Protein], [PortionSize], [PortionMeasure]) VALUES (10, N'Vanilla Yogurt', CAST(1.000 AS Numeric(4, 3)), CAST(1.500 AS Numeric(4, 3)), NULL, CAST(1.000 AS Numeric(4, 3)), CAST(8.000 AS Numeric(4, 3)), N'oz')
INSERT [dbo].[NutritionMilk] ([Id], [Product], [Milk], [Starch], [Fat], [Protein], [PortionSize], [PortionMeasure]) VALUES (11, N'Fruit Yogurt', CAST(1.000 AS Numeric(4, 3)), CAST(1.500 AS Numeric(4, 3)), NULL, CAST(1.000 AS Numeric(4, 3)), CAST(8.000 AS Numeric(4, 3)), N'oz')
/****** Object:  Table [dbo].[NutritionFruitJuice]    Script Date: 08/16/2012 13:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionFruitJuice](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[FruitJuice] [numeric](4, 3) NULL,
	[PortionSize] [numeric](4, 3) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionFruitJuice] ([Id], [Product], [FruitJuice], [PortionSize], [PortionMeasure]) VALUES (1, N'Apple Juice/Cider', CAST(1.000 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruitJuice] ([Id], [Product], [FruitJuice], [PortionSize], [PortionMeasure]) VALUES (2, N'Cranberry Juice Cocktail', CAST(1.000 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruitJuice] ([Id], [Product], [FruitJuice], [PortionSize], [PortionMeasure]) VALUES (3, N'Cranberry Juice Cocktail, light', CAST(1.000 AS Numeric(4, 3)), CAST(1.000 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruitJuice] ([Id], [Product], [FruitJuice], [PortionSize], [PortionMeasure]) VALUES (4, N'Fruit Juice Blends, 100% Juice', CAST(1.000 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruitJuice] ([Id], [Product], [FruitJuice], [PortionSize], [PortionMeasure]) VALUES (5, N'Grape Juice', CAST(1.000 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruitJuice] ([Id], [Product], [FruitJuice], [PortionSize], [PortionMeasure]) VALUES (6, N'Grapefruit Juice', CAST(1.000 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruitJuice] ([Id], [Product], [FruitJuice], [PortionSize], [PortionMeasure]) VALUES (7, N'Orange Juice', CAST(1.000 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruitJuice] ([Id], [Product], [FruitJuice], [PortionSize], [PortionMeasure]) VALUES (8, N'Pineapple Juice', CAST(1.000 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruitJuice] ([Id], [Product], [FruitJuice], [PortionSize], [PortionMeasure]) VALUES (9, N'Prune Juice', CAST(1.000 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), N'cup')
/****** Object:  Table [dbo].[NutritionFruit]    Script Date: 08/16/2012 13:42:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionFruit](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Fruit] [numeric](4, 3) NULL,
	[PortionSize] [numeric](4, 3) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (1, N'Apple, unpeeled, small', CAST(1.000 AS Numeric(4, 3)), CAST(4.000 AS Numeric(4, 3)), N'oz')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (2, N'Applesauce, unsweetened', CAST(1.000 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (3, N'Applesauce, sweetened', CAST(1.500 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (4, N'Apricots, whole, fresh', CAST(1.000 AS Numeric(4, 3)), CAST(5.500 AS Numeric(4, 3)), N'oz')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (5, N'Apricots, canned', CAST(1.000 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (6, N'Apricots, dried', CAST(1.000 AS Numeric(4, 3)), CAST(8.000 AS Numeric(4, 3)), N'halves')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (7, N'Banana, small', CAST(1.000 AS Numeric(4, 3)), CAST(4.000 AS Numeric(4, 3)), N'oz')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (8, N'Blackberries', CAST(1.000 AS Numeric(4, 3)), CAST(0.750 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (9, N'Blueberries', CAST(1.000 AS Numeric(4, 3)), CAST(0.750 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (10, N'Cantaloupe, small', CAST(1.000 AS Numeric(4, 3)), CAST(1.000 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (11, N'Cherries, sweet', CAST(1.000 AS Numeric(4, 3)), CAST(3.000 AS Numeric(4, 3)), N'oz')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (12, N'Dates', CAST(1.000 AS Numeric(4, 3)), CAST(3.000 AS Numeric(4, 3)), N'dates')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (13, N'Figs, fresh', CAST(1.000 AS Numeric(4, 3)), CAST(3.500 AS Numeric(4, 3)), N'oz')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (14, N'Figs, dried', CAST(1.000 AS Numeric(4, 3)), CAST(1.500 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (15, N'Fruit cocktail', CAST(1.000 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), N' cup')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (16, N'Grapefruit, large', CAST(1.000 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), N'grapefruit')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (17, N'Grapes, small', CAST(1.000 AS Numeric(4, 3)), CAST(3.000 AS Numeric(4, 3)), N'oz')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (18, N'Honeydew Melon', CAST(1.000 AS Numeric(4, 3)), CAST(1.000 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (19, N'Kiwi', CAST(1.000 AS Numeric(4, 3)), CAST(3.500 AS Numeric(4, 3)), N'oz')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (20, N'Mandarin Orange, canned', CAST(1.000 AS Numeric(4, 3)), CAST(0.750 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (21, N'Mango, small', CAST(1.000 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (22, N'Nectarine, small', CAST(1.000 AS Numeric(4, 3)), CAST(5.000 AS Numeric(4, 3)), N'oz')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (23, N'Orange, small', CAST(1.000 AS Numeric(4, 3)), CAST(6.500 AS Numeric(4, 3)), N'oz')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (24, N'Papaya', CAST(1.000 AS Numeric(4, 3)), CAST(8.000 AS Numeric(4, 3)), N'oz')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (25, N'Peach, fresh', CAST(1.000 AS Numeric(4, 3)), CAST(6.000 AS Numeric(4, 3)), N'oz')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (26, N'Peaches, canned', CAST(1.000 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (27, N'Pear, fresh', CAST(1.000 AS Numeric(4, 3)), CAST(4.000 AS Numeric(4, 3)), N'oz')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (28, N'Peaches, canned', CAST(1.000 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (29, N'Pear, fresh', CAST(1.000 AS Numeric(4, 3)), CAST(4.000 AS Numeric(4, 3)), N'oz')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (30, N'Pear, canned', CAST(1.000 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (31, N'Pineapple, fresh', CAST(1.000 AS Numeric(4, 3)), CAST(0.750 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (32, N'Pineapple, canned', CAST(1.000 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (33, N'Plums, small', CAST(1.000 AS Numeric(4, 3)), CAST(5.000 AS Numeric(4, 3)), N'oz')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (34, N'Plums, canned', CAST(1.000 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (35, N'Plums, dried', CAST(1.000 AS Numeric(4, 3)), CAST(3.000 AS Numeric(4, 3)), N'plums')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (36, N'Raisins', CAST(1.000 AS Numeric(4, 3)), CAST(2.000 AS Numeric(4, 3)), N'tbsp')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (37, N'Raspberries', CAST(1.000 AS Numeric(4, 3)), CAST(1.000 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (38, N'Strawberries, whole', CAST(1.000 AS Numeric(4, 3)), CAST(1.250 AS Numeric(4, 3)), N'cup')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (39, N'Tangerines, small', CAST(1.000 AS Numeric(4, 3)), CAST(8.000 AS Numeric(4, 3)), N'oz')
INSERT [dbo].[NutritionFruit] ([Id], [Product], [Fruit], [PortionSize], [PortionMeasure]) VALUES (40, N'Watermelon, cubes', CAST(1.000 AS Numeric(4, 3)), CAST(1.250 AS Numeric(4, 3)), N'cup')
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_Vegetables]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_Vegetables]
AS

SELECT vegetables.*  
FROM NutritionVegetables vegetables
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_StarchVegetables]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_StarchVegetables]
AS

SELECT starch.*  
FROM NutritionStarchVegetables starch
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_StarchSnacks]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_StarchSnacks]
AS

SELECT starch.*  
FROM NutritionStarchSnacks starch
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_StarchGrains]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_StarchGrains]
AS

SELECT starch.*  
FROM NutritionStarchGrains starch
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_StarchFats]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_StarchFats]
AS

SELECT starchFats.*  
FROM NutritionStarchFats starchFats
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_StarchDesserts]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_StarchDesserts]
AS

SELECT starch.*  
FROM NutritionStarchDesserts starch
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_StarchCreamyDesserts]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_StarchCreamyDesserts]
AS

SELECT starch.*  
FROM NutritionStarchCreamyDesserts starch
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_StarchCereals]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_StarchCereals]
AS

SELECT starch.*  
FROM NutritionStarchCereals starch
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_StarchBreads]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_StarchBreads]
AS

SELECT starch.*  
FROM NutritionStarchBreads starch
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_StarchBeans]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_StarchBeans]
AS

SELECT beans.*  
FROM NutritionStarchBeans beans
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_SnacksCrackers]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_SnacksCrackers]
AS

SELECT snacks.*  
FROM NutritionSnacksCrackers snacks
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_SnacksCookies]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_SnacksCookies]
AS

SELECT snacks.*  
FROM NutritionSnacksCookies snacks
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_SnacksChips]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_SnacksChips]
AS

SELECT snacks.*  
FROM NutritionSnacksChips snacks
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_SnacksCandy]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_SnacksCandy]
AS

SELECT snacks.*  
FROM NutritionSnacksCandy snacks
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_SnacksCakes]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_SnacksCakes]
AS

SELECT snacks.*  
FROM NutritionSnacksCakes snacks
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_SnacksBreakfastBars]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_SnacksBreakfastBars]
AS

SELECT snacks.*  
FROM NutritionSnacksBreakfastBars snacks
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_ProteinVeal]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_ProteinVeal]
AS

SELECT protein.*  
FROM NutritionProteinVeal protein
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_ProteinShellfish]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_ProteinShellfish]
AS

SELECT protein.*  
FROM NutritionProteinShellfish protein
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_ProteinPoultry]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_ProteinPoultry]
AS

SELECT protein.*  
FROM NutritionProteinPoultry protein
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_ProteinPork]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_ProteinPork]
AS

SELECT protein.*  
FROM NutritionProteinPork protein
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_ProteinOther]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_ProteinOther]
AS

SELECT protein.*  
FROM NutritionProteinOther protein
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_ProteinLamb]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_ProteinLamb]
AS

SELECT protein.*  
FROM NutritionProteinLamb protein
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_ProteinFish]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_ProteinFish]
AS

SELECT protein.*  
FROM NutritionProteinFish protein
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_ProteinEggs]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_ProteinEggs]
AS

SELECT protein.*  
FROM NutritionProteinEggs protein
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_ProteinCheese]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_ProteinCheese]
AS

SELECT beef.*  
FROM NutritionProteinCheese beef
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_ProteinBeef]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_ProteinBeef]
AS

SELECT protein.*  
FROM NutritionProteinBeef protein
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_Milk]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_Milk]
AS

SELECT milk.*  
FROM NutritionMilk milk
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_FruitJuice]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_FruitJuice]
AS

SELECT juice.*  
FROM NutritionFruitJuice juice
GO
/****** Object:  StoredProcedure [dbo].[spNutrition_Get_Fruit]    Script Date: 08/16/2012 13:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNutrition_Get_Fruit]
AS

SELECT fruit.*  
FROM NutritionFruit fruit
GO

USE [TLW]
GO
/****** Object:  Table [dbo].[NutritionMilk]    Script Date: 09/19/2012 23:29:54 ******/
DROP TABLE [dbo].[NutritionMilk]
GO
/****** Object:  Table [dbo].[NutritionStarchCreamyDesserts]    Script Date: 09/19/2012 23:29:54 ******/
DROP TABLE [dbo].[NutritionStarchCreamyDesserts]
GO
/****** Object:  Table [dbo].[NutritionStarchDesserts]    Script Date: 09/19/2012 23:29:54 ******/
DROP TABLE [dbo].[NutritionStarchDesserts]
GO
/****** Object:  Table [dbo].[NutritionStarchFats]    Script Date: 09/19/2012 23:29:54 ******/
DROP TABLE [dbo].[NutritionStarchFats]
GO
/****** Object:  Table [dbo].[NutritionStarchFats]    Script Date: 09/19/2012 23:29:54 ******/
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
	[Fats] [numeric](4, 2) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (1, N'Biscuits', N'2 1/2" ', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'biscuit')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (2, N'Chow Mein Noodles', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (3, N'Corn Bread', N'3" x 3" x 3/4"', CAST(1.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'serving')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (4, N'Crackers', N'Ritz', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(6.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (5, N'Croutons', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (6, N'French Fries', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(20.00 AS Numeric(4, 2)), N'fries')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (7, N'Granola', N'Regular', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(0.25 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (8, N'Muffin', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.50 AS Numeric(4, 2)), N'oz')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (9, N'Pancake', N'4"', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'pancakes')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (10, N'Popcorn', N'Microwave', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(3.00 AS Numeric(4, 2)), N'cups')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (11, N'Sandwich Crackers', N'Cheese, Peanut Butter', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(3.00 AS Numeric(4, 2)), N'crackers')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (12, N'Stuffing, bread', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(0.33 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (13, N'Taco Shell', N'6"', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'shells')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (14, N'Tortilla, small', N'Flour', CAST(1.50 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'tortilla')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (15, N'Tortilla, large', N'Flour', CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'tortilla')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (16, N'Waffle', N'4 1/4"', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'waffle')
INSERT [dbo].[NutritionStarchFats] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (17, N'Crackers', N'Whole Wheat', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'oz')
/****** Object:  Table [dbo].[NutritionStarchDesserts]    Script Date: 09/19/2012 23:29:54 ******/
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
	[Fats] [numeric](4, 2) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (1, N'Angel Food Cake', N'Unfrosted', CAST(1.50 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'1/2 slice')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (2, N'Brownie, small', N'Unfrosted, 2" x 2"', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'brownie')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (3, N'Cake', N'Unfrosted, 2" x 2"', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'slice')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (4, N'Cake', N'Frosted, 2" x 2"', CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'slice')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (5, N'Cookie', N'Fat-free', CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'cookies')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (6, N'Cookie Sandwich', N'Cream-filled', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), N'cookies')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (7, N'Doughnut', N'Plain', CAST(1.50 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'doughnut')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (8, N'Doughnut', N'Glazed', CAST(2.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'doughnut')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (9, N'Gingersnaps', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)), CAST(3.00 AS Numeric(4, 2)), N'cookies')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (10, N'Granola Bar', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'bar')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (11, N'Granola Bar', N'Fat-free', CAST(1.00 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'bar')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (12, N'Pie', N'Fruit', CAST(2.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'small slice')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (13, N'Pie', N'Pumpkin, Custard', CAST(1.00 AS Numeric(4, 2)), CAST(2.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'small slice')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (14, N'Vanilla Wafers', NULL, CAST(1.00 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)), CAST(5.00 AS Numeric(4, 2)), N'wafers')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (15, N'Fruit Juice Bars', N'100% Juice', CAST(1.00 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'bar')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (16, N'Fruit Spreads', N'100% Juice', CAST(1.00 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), N'tbsp')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (17, N'Ice Cream', N'Non-fat', CAST(1.00 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (18, N'Ice Cream', N'Regular', CAST(1.00 AS Numeric(4, 2)), CAST(1.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (19, N'Pudding, regular', N'1% Milk', CAST(2.00 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (20, N'Pudding, sugar-free', N'1% Milk', CAST(1.00 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (21, N'Sherbet', N'Sorbet', CAST(2.00 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (22, N'Frozen Yogurt', N'Low-fat', CAST(1.00 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), N'cup')
INSERT [dbo].[NutritionStarchDesserts] ([Id], [Product], [Type], [Starch], [Fats], [PortionSize], [PortionMeasure]) VALUES (23, N'Frozen Yogurt', N'Haagen-Daas', CAST(1.50 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), CAST(0.50 AS Numeric(4, 2)), N'cup')
/****** Object:  Table [dbo].[NutritionStarchCreamyDesserts]    Script Date: 09/19/2012 23:29:54 ******/
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
	[Fats] [numeric](4, 2) NULL,
	[PortionSize] [numeric](4, 2) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NutritionMilk]    Script Date: 09/19/2012 23:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NutritionMilk](
	[Id] [int] NOT NULL,
	[Product] [varchar](50) NOT NULL,
	[Type] [varchar](100) NULL,
	[Starch] [numeric](4, 3) NULL,
	[Fats] [numeric](4, 3) NULL,
	[Protein] [numeric](4, 3) NULL,
	[PortionSize] [numeric](4, 3) NOT NULL,
	[PortionMeasure] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NutritionMilk] ([Id], [Product], [Starch], [Fats], [Protein], [PortionSize], [PortionMeasure]) 
VALUES (1, N'Skim Milk', NULL, NULL, NULL, CAST(8.000 AS Numeric(4, 3)), N'oz')

INSERT [dbo].[NutritionMilk] ([Id], [Product], [Starch], [Fats], [Protein], [PortionSize], [PortionMeasure]) 
VALUES (2, N'1% Milk', NULL, CAST(0.500 AS Numeric(4, 3)), NULL, CAST(8.000 AS Numeric(4, 3)), N'oz')

INSERT [dbo].[NutritionMilk] ([Id], [Product], [Starch], [Fats], [Protein], [PortionSize], [PortionMeasure]) 
VALUES (3, N'2% Milk', NULL, CAST(1.000 AS Numeric(4, 3)), NULL, CAST(8.000 AS Numeric(4, 3)), N'oz')

INSERT [dbo].[NutritionMilk] ([Id], [Product], [Starch], [Fats], [Protein], [PortionSize], [PortionMeasure]) 
VALUES (4, N'Whole Milk', NULL, CAST(1.500 AS Numeric(4, 3)), NULL, CAST(8.000 AS Numeric(4, 3)), N'oz')

INSERT [dbo].[NutritionMilk] ([Id], [Product], [Starch], [Fats], [Protein], [PortionSize], [PortionMeasure]) 
VALUES (5, N'Chocolate Milk (skim)', CAST(0.500 AS Numeric(4, 3)), NULL, NULL, CAST(8.000 AS Numeric(4, 3)), N'oz')

INSERT [dbo].[NutritionMilk] ([Id], [Product], [Starch], [Fats], [Protein], [PortionSize], [PortionMeasure]) 
VALUES (6, N'1% Chocolate Milk', CAST(0.500 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), NULL, CAST(8.000 AS Numeric(4, 3)), N'oz')

INSERT [dbo].[NutritionMilk] ([Id], [Product], [Starch], [Fats], [Protein], [PortionSize], [PortionMeasure]) 
VALUES (7, N'LActaid Milk (skim)', NULL, NULL, NULL, CAST(8.000 AS Numeric(4, 3)), N'oz')

INSERT [dbo].[NutritionMilk] ([Id], [Product], [Starch], [Fats], [Protein], [PortionSize], [PortionMeasure]) 
VALUES (8, N'Nonfat Dray Milk Powder', CAST(0.500 AS Numeric(4, 3)), NULL, CAST(1.000 AS Numeric(4, 3)), CAST(0.330 AS Numeric(4, 3)), N'cup')

INSERT [dbo].[NutritionMilk] ([Id], [Product], [Starch], [Fats], [Protein], [PortionSize], [PortionMeasure]) 
VALUES (9, N'Plain Low-Fat Yogurt',  CAST(0.500 AS Numeric(4, 3)), CAST(0.500 AS Numeric(4, 3)), NULL, CAST(8.000 AS Numeric(4, 3)), N'oz')

INSERT [dbo].[NutritionMilk] ([Id], [Product], [Starch], [Fats], [Protein], [PortionSize], [PortionMeasure]) 
VALUES (10, N'Vanilla Yogurt', CAST(1.500 AS Numeric(4, 3)), NULL, CAST(1.000 AS Numeric(4, 3)), CAST(8.000 AS Numeric(4, 3)), N'oz')

INSERT [dbo].[NutritionMilk] ([Id], [Product], [Starch], [Fats], [Protein], [PortionSize], [PortionMeasure]) 
VALUES (11, N'Fruit Yogurt', CAST(1.500 AS Numeric(4, 3)), NULL, CAST(1.000 AS Numeric(4, 3)), CAST(8.000 AS Numeric(4, 3)), N'oz')

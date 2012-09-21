USE [TLW]
GO

/****** Object:  Table [dbo].[NutritionVegetables]    Script Date: 09/19/2012 20:39:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutritionVegetables]') AND type in (N'U'))
DROP TABLE [dbo].[NutritionVegetables]
GO

USE [TLW]
GO

/****** Object:  Table [dbo].[NutritionVegetables]    Script Date: 09/19/2012 20:39:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[NutritionVegetables](
	[Id] [int] NULL,
	[Product] [varchar](50) NULL,
	[Type] [varchar](100) NULL,
	[PortionSize] [numeric](4, 3) NULL,
	[PortionMeasure] [varchar](20) NULL
) ON [PRIMARY]

GO

INSERT INTO [dbo].[NutritionVegetables] (Product, Type, PortionSize, PortionMeasure) VALUES('Vegetables','cooked','0.500','cup')
INSERT INTO [dbo].[NutritionVegetables] (Product, Type, PortionSize, PortionMeasure) VALUES('Vegateables','raw','1.000','cup')

SET ANSI_PADDING OFF
GO



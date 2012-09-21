USE [TLW]
GO

/****** Object:  Table [dbo].[tbl_FoodIntakeLog]    Script Date: 09/19/2012 04:26:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_FoodIntakeLog]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_FoodIntakeLog]
GO

USE [TLW]
GO

/****** Object:  Table [dbo].[tbl_FoodIntakeLog]    Script Date: 09/19/2012 04:26:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_FoodIntakeLog](
	[intFoodIntakeLogId] [int] IDENTITY(1,1) NOT NULL,
	[intMealId] [int] NULL,
	[guidUserId] [uniqueidentifier] NULL,
	[dtFoodIntakeDate] [datetime] NULL,
	[strMilkDetails] [nvarchar](100) NULL,
	[strFruitDetails] [nvarchar](100) NULL,
	[strVegetablesDetails] [nvarchar](100) NULL,
	[strStarchDetails] [nvarchar](100) NULL,
	[strProteinDetails] [nvarchar](100) NULL,
	[strFATDetails] [nvarchar](100) NULL,
	[chrIsDeleted] [char](1) NULL,
	[dtDeletedOn] [datetime] NULL,
	[dtCreatedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_FoodIntakeLog] PRIMARY KEY CLUSTERED 
(
	[intFoodIntakeLogId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



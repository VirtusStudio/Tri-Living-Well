USE [TLW]
GO

/****** Object:  Table [dbo].[tbl_FoodIntakeLogNotes]    Script Date: 09/19/2012 02:19:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_FoodIntakeLogNotes](
	[intFoodIntakeLogNotesId] [int] IDENTITY(1,1) NOT NULL,
	[guidUserId] [uniqueidentifier] NULL,
	[dtFoodIntakeDate] [datetime] NULL,
	[strNotes] [nvarchar](500) NULL
 CONSTRAINT [PK_tbl_FoodIntakeLogNotes] PRIMARY KEY CLUSTERED 
(
	[intFoodIntakeLogNotesId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



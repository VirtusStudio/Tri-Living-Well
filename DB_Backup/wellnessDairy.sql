USE [TLW]
GO

/****** Object:  Table [dbo].[tbl_wellnessEntry]    Script Date: 04/24/2012 03:15:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_wellnessEntry](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Sleep] [int] NULL,
	[Stress] [int] NULL,
	[Outlook] [int] NULL,
	[Engagement] [int] NULL,
	[Energy] [int] NULL,
	[Day] [varchar](50) NULL,
	[Dates] [datetime] NULL,
 CONSTRAINT [PK_tbl_wellnessEntry] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  StoredProcedure [dbo].[sp_getlatestwell]    Script Date: 04/24/2012 03:16:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_getlatestwellnessDiaryRecords]
(@UserName varchar(100))
as
select * from tbl_wellnessEntry where UserName=@UserName and
	 (Dates <= (select MAX(Dates) from tbl_wellnessEntry) and 
	 Dates >=(select MAX(Dates) from tbl_wellnessEntry)-6)



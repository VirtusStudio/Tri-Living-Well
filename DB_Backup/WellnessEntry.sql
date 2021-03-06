USE [TLW]
GO
/****** Object:  Table [dbo].[tbl_wellnessEntry]    Script Date: 04/27/2012 18:26:14 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_getlatestwellnessDiaryRecords]    Script Date: 04/27/2012 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------
CREATE procedure [dbo].[sp_getlatestwellnessDiaryRecords]
(@UserName varchar(100))
as


select top 7 *,datepart(dw,Dates) as DayOfWeeks from tbl_wellnessEntry where UserName=@UserName and
	 (Dates <= (select MAX(Dates) from tbl_wellnessEntry) and 
	 Dates >=(select MAX(Dates) from tbl_wellnessEntry)-6)order by Dates desc
-----------------------------
GO
/****** Object:  StoredProcedure [dbo].[sp_getDate]    Script Date: 04/27/2012 18:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_getDate]
(@UserName varchar(100))
as
 select dates from tbl_wellnessEntry where UserName=@UserName and Dates= DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE()))
GO

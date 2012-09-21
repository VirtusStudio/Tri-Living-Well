USE [TLW]
GO

/****** Object:  Table [dbo].[tbl_PersonalSummary]    Script Date: 09/18/2012 01:40:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_PersonalSummary]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_PersonalSummary]
GO

USE [TLW]
GO

/****** Object:  Table [dbo].[tbl_PersonalSummary]    Script Date: 09/18/2012 01:40:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_PersonalSummary](
	[intPersonalSummaryId] [int] IDENTITY(1,1) NOT NULL,
	[decWeight] [decimal](18, 2) NULL,
	[decWaist] [decimal](18, 2) NULL,
	[decNeck] [decimal](18, 2) NULL,
	[decHips] [decimal](18, 2) NULL,
	[decBMI] [decimal](18, 2) NULL,
	[decBodyFATPercentage] [decimal](18, 2) NULL,
	[decWaistToHeight] [decimal](18, 2) NULL,
	[decWaistToHip] [decimal](18, 2) NULL,
	[decLossFrequencyGoal] [decimal](18, 2) NULL,
	[intActivityLevel] [int] NULL,
	[guidUserId] [uniqueidentifier] NULL,
	[dtCreatedOn] [datetime] NULL,
	[dtModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_PersonalSummary] PRIMARY KEY CLUSTERED 
(
	[intPersonalSummaryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



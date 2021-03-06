USE [master]
GO
/****** Object:  Database [TLW_FMS]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'TLW_FMS')
BEGIN
CREATE DATABASE [TLW_FMS] ON  PRIMARY 
( NAME = N'TLW_FMS_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\TLW_FMS.mdf' , SIZE = 8832KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'TLW_FMS_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\TLW_FMS_1.ldf' , SIZE = 8384KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
END
GO
ALTER DATABASE [TLW_FMS] SET COMPATIBILITY_LEVEL = 80
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TLW_FMS].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [TLW_FMS] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TLW_FMS] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TLW_FMS] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TLW_FMS] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TLW_FMS] SET ARITHABORT OFF
GO
ALTER DATABASE [TLW_FMS] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [TLW_FMS] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [TLW_FMS] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TLW_FMS] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TLW_FMS] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TLW_FMS] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TLW_FMS] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TLW_FMS] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TLW_FMS] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TLW_FMS] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TLW_FMS] SET  DISABLE_BROKER
GO
ALTER DATABASE [TLW_FMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TLW_FMS] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TLW_FMS] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TLW_FMS] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TLW_FMS] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TLW_FMS] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TLW_FMS] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TLW_FMS] SET  READ_WRITE
GO
ALTER DATABASE [TLW_FMS] SET RECOVERY SIMPLE
GO
ALTER DATABASE [TLW_FMS] SET  MULTI_USER
GO
ALTER DATABASE [TLW_FMS] SET PAGE_VERIFY TORN_PAGE_DETECTION
GO
ALTER DATABASE [TLW_FMS] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'TLW_FMS', N'ON'
GO
USE [TLW_FMS]
GO
/****** Object:  User [dev2008]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'dev2008')
CREATE USER [dev2008] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Role [aspnet_Membership_BasicAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Membership_BasicAccess' AND type = 'R')
CREATE ROLE [aspnet_Membership_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Membership_ReportingAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Membership_ReportingAccess' AND type = 'R')
CREATE ROLE [aspnet_Membership_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Membership_FullAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Membership_FullAccess' AND type = 'R')
CREATE ROLE [aspnet_Membership_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_BasicAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Personalization_BasicAccess' AND type = 'R')
CREATE ROLE [aspnet_Personalization_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_ReportingAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Personalization_ReportingAccess' AND type = 'R')
CREATE ROLE [aspnet_Personalization_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_FullAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Personalization_FullAccess' AND type = 'R')
CREATE ROLE [aspnet_Personalization_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_BasicAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Profile_BasicAccess' AND type = 'R')
CREATE ROLE [aspnet_Profile_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_ReportingAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Profile_ReportingAccess' AND type = 'R')
CREATE ROLE [aspnet_Profile_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_FullAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Profile_FullAccess' AND type = 'R')
CREATE ROLE [aspnet_Profile_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_BasicAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Roles_BasicAccess' AND type = 'R')
CREATE ROLE [aspnet_Roles_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_ReportingAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Roles_ReportingAccess' AND type = 'R')
CREATE ROLE [aspnet_Roles_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_FullAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Roles_FullAccess' AND type = 'R')
CREATE ROLE [aspnet_Roles_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_WebEvent_FullAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_WebEvent_FullAccess' AND type = 'R')
CREATE ROLE [aspnet_WebEvent_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_WebEvent_FullAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_WebEvent_FullAccess] AUTHORIZATION [aspnet_WebEvent_FullAccess]'
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Roles_ReportingAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Roles_ReportingAccess] AUTHORIZATION [aspnet_Roles_ReportingAccess]'
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Roles_FullAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Roles_FullAccess] AUTHORIZATION [aspnet_Roles_FullAccess]'
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Roles_BasicAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Roles_BasicAccess] AUTHORIZATION [aspnet_Roles_BasicAccess]'
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Profile_ReportingAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Profile_ReportingAccess] AUTHORIZATION [aspnet_Profile_ReportingAccess]'
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Profile_FullAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Profile_FullAccess] AUTHORIZATION [aspnet_Profile_FullAccess]'
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Profile_BasicAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Profile_BasicAccess] AUTHORIZATION [aspnet_Profile_BasicAccess]'
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Personalization_ReportingAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Personalization_ReportingAccess] AUTHORIZATION [aspnet_Personalization_ReportingAccess]'
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Personalization_FullAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Personalization_FullAccess] AUTHORIZATION [aspnet_Personalization_FullAccess]'
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Personalization_BasicAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Personalization_BasicAccess] AUTHORIZATION [aspnet_Personalization_BasicAccess]'
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Membership_ReportingAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Membership_ReportingAccess] AUTHORIZATION [aspnet_Membership_ReportingAccess]'
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Membership_FullAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Membership_FullAccess] AUTHORIZATION [aspnet_Membership_FullAccess]'
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 04/15/2012 19:00:59 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Membership_BasicAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Membership_BasicAccess] AUTHORIZATION [aspnet_Membership_BasicAccess]'
GO
/****** Object:  StoredProcedure [dbo].[spTxA_Get_TextAreas_Backup]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spTxA_Get_TextAreas_Backup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spTxA_Get_TextAreas_Backup]
@TextAreaName varchar(100),  
@Top varchar(10)  
AS  
  
--SELECT top 1 *  
declare @sql varchar(8000)  
set @sql = ''  
SELECT top '' + @Top + '' *  
FROM TextAreas   
WHERE 1=1  
''  
  
if(@TextAreaName <> '''')  
begin  
 set @sql = @sql + ''AND TextAreaName= '''''' + @TextAreaName +''''''''  
end  
  
set @sql = @sql + '' ORDER BY TextAreaIndex DESC''  
  
print(@sql)  
exec(@sql)  
  
  ' 
END
GO
/****** Object:  StoredProcedure [dbo].[spTxa_Get_TextAreas]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spTxa_Get_TextAreas]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spTxa_Get_TextAreas]  
@TextAreaName varchar(100),  
@Top varchar(10)  
AS  
  
--SELECT top 1 *  
declare @sql varchar(8000)  
set @sql = ''  
SELECT *, 0 AS isPreview,intcontentpagesid AS TextAreaId  
FROM tbl_contentpages   
WHERE 1=1  
''  
  
if(@TextAreaName <> '''')  
begin  
 set @sql = @sql + ''AND strpagename= '''''' + @TextAreaName +''''''''  
end  
  
--set @sql = @sql + '' ORDER BY TextAreaIndex DESC''  
  
print(@sql)  
exec(@sql)  
  
  ' 
END
GO
/****** Object:  Table [dbo].[VISITLOG_LEGEND]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VISITLOG_LEGEND]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VISITLOG_LEGEND](
	[A] [int] NOT NULL,
	[B] [int] NOT NULL,
	[C] [int] NOT NULL,
	[D] [int] NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[PRIMARY] [varchar](255) NOT NULL,
	[SECONDARY] [varchar](255) NOT NULL,
	[COMMENT] [varchar](255) NOT NULL,
 CONSTRAINT [PK_VISITLOG_LEGEND] PRIMARY KEY CLUSTERED 
(
	[A] ASC,
	[B] ASC,
	[C] ASC,
	[D] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VISITLOG_ACTION]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VISITLOG_ACTION]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VISITLOG_ACTION](
	[VISIT_ID] [int] NOT NULL,
	[USER_ID] [uniqueidentifier] NULL,
	[DATE] [datetime] NOT NULL,
	[A] [int] NOT NULL,
	[B] [int] NOT NULL,
	[C] [int] NOT NULL,
	[D] [int] NOT NULL,
	[PRIMARY] [varchar](1024) NOT NULL,
	[SECONDARY] [varchar](254) NOT NULL,
	[COMMENT] [varchar](1024) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VISITLOG]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VISITLOG]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VISITLOG](
	[VISIT_ID] [int] NOT NULL,
	[DATE] [datetime] NOT NULL,
	[AGENT] [varchar](255) NOT NULL,
	[VISIT_IP] [char](20) NOT NULL,
	[USER_ID] [uniqueidentifier] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USER_ASSESSMENTS]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USER_ASSESSMENTS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[USER_ASSESSMENTS](
	[ASSESSMENT_ID] [int] NOT NULL,
	[USER_ID] [uniqueidentifier] NOT NULL,
	[LEVEL_ID] [int] NOT NULL,
	[ASSESSMENT_SCORE] [int] NOT NULL,
	[DELETE_FLG] [smallint] NOT NULL,
	[DATE_CREATED] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TextAreas]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TextAreas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TextAreas](
	[TextAreaId] [int] NOT NULL,
	[TextAreaName] [varchar](50) NOT NULL,
	[TextAreaIndex] [int] NOT NULL,
	[isPreview] [bit] NOT NULL,
	[TextAreaHTML] [text] NOT NULL,
	[DateModified] [datetime] NOT NULL,
 CONSTRAINT [PK_TEXTAREAS] PRIMARY KEY CLUSTERED 
(
	[TextAreaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TEMPLATES]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TEMPLATES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TEMPLATES](
	[TEMPLATE_ID] [int] NOT NULL,
	[TEMPLATE_TEXT] [text] NOT NULL,
	[BGT_COMMENTS] [varchar](255) NOT NULL,
	[DATE_MODIFIED] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_UsersPrivateAnswers]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_UsersPrivateAnswers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_UsersPrivateAnswers](
	[intAnswerId] [int] IDENTITY(1,1) NOT NULL,
	[intQuestionId] [int] NOT NULL,
	[strAnswer] [nvarchar](500) NOT NULL,
	[dtAnsweredOn] [datetime] NOT NULL,
	[strAnswerBy] [nvarchar](300) NULL,
 CONSTRAINT [PK_tbl_UsersPrivateAnswers] PRIMARY KEY CLUSTERED 
(
	[intAnswerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tbl_UserRiskStratificationDetails]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_UserRiskStratificationDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_UserRiskStratificationDetails](
	[intUserRiskStratificationId] [int] IDENTITY(1,1) NOT NULL,
	[intQuestionnaireId] [int] NULL,
	[strQuestion] [varchar](500) NULL,
	[strAnswer] [varchar](5) NULL,
	[dtCreatedOn] [datetime] NULL,
	[guidUserId] [uniqueidentifier] NULL,
	[strStratificationStep] [varchar](10) NULL,
 CONSTRAINT [PK_tbl_UserRiskStratificationDetails1] PRIMARY KEY CLUSTERED 
(
	[intUserRiskStratificationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_UserFavoriteDetails]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_UserFavoriteDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_UserFavoriteDetails](
	[intFavoriteId] [int] IDENTITY(1,1) NOT NULL,
	[strUserId] [nvarchar](500) NOT NULL,
	[strTitle] [nvarchar](150) NOT NULL,
	[strFavoriteType] [nvarchar](50) NOT NULL,
	[dtCreatedOn] [datetime] NOT NULL,
	[intFavoriteTypeId] [int] NOT NULL,
 CONSTRAINT [PK_tbl_UserFavoriteDetails] PRIMARY KEY CLUSTERED 
(
	[intFavoriteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tbl_UserFavoriteDetails', N'COLUMN',N'strFavoriteType'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Newsletter, Event etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_UserFavoriteDetails', @level2type=N'COLUMN',@level2name=N'strFavoriteType'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tbl_UserFavoriteDetails', N'COLUMN',N'intFavoriteTypeId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'id of favorite type ie ID of newsletter , event etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_UserFavoriteDetails', @level2type=N'COLUMN',@level2name=N'intFavoriteTypeId'
GO
/****** Object:  Table [dbo].[tbl_TLWRatioFormulas]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_TLWRatioFormulas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_TLWRatioFormulas](
	[intTLWRatioFormulaId] [int] IDENTITY(1,1) NOT NULL,
	[strRatioType] [nvarchar](50) NULL,
	[strRatioCode] [nvarchar](50) NULL,
	[strGender] [varchar](10) NULL,
	[decFrom] [decimal](18, 2) NULL,
	[decTo] [decimal](18, 2) NULL,
	[strLevelofRisk] [varchar](100) NULL,
	[dtModifiedOn] [datetime] NULL,
	[chrIsDeleted] [char](1) NULL,
	[dtDeletedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_TLWRatioFormulas] PRIMARY KEY CLUSTERED 
(
	[intTLWRatioFormulaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ForumGroups]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ForumGroups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ForumGroups](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
	[GroupSortOrder] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ForumUsers]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ForumUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ForumUsers](
	[UserID] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[UserDisplayName] [varchar](100) NOT NULL,
	[Homepage] [nvarchar](50) NULL,
	[Interests] [nvarchar](255) NULL,
	[PostsCount] [int] NOT NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Disabled] [bit] NOT NULL,
	[ActivationCode] [nvarchar](50) NOT NULL,
	[AvatarFileName] [nvarchar](50) NULL,
	[Signature] [nvarchar](1000) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ForumUserGroups]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ForumUserGroups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ForumUserGroups](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LIST_TABS]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LIST_TABS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LIST_TABS](
	[LIST_ID] [int] NOT NULL,
	[LIST_NAME] [varchar](255) NOT NULL,
	[LISTITEM_ID] [int] NOT NULL,
	[TEXT] [varchar](255) NOT NULL,
	[VALUE] [varchar](255) NOT NULL,
	[VISIBLE_FLG] [smallint] NOT NULL,
	[ENABLED_FLG] [smallint] NOT NULL,
	[ROLES] [varchar](255) NOT NULL,
	[USERNAMES] [varchar](255) NOT NULL,
	[DISPLAY_ORDER] [int] NOT NULL,
	[SELECTED_FLG] [smallint] NOT NULL,
	[DESCRIPTION] [varchar](255) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[List_StateCountry]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[List_StateCountry]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[List_StateCountry](
	[LISTITEM_ID] [int] NOT NULL,
	[LIST_NAME] [varchar](20) NULL,
	[ITEM_ID] [int] NULL,
	[ITEM_VALUE] [varchar](50) NULL,
	[ITEM_TEXT] [varchar](255) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LIST_PAL]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LIST_PAL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LIST_PAL](
	[LIST_ID] [int] NOT NULL,
	[LIST_NAME] [varchar](100) NOT NULL,
	[ITEM_ID] [int] NULL,
	[ITEM_VALUE] [varchar](100) NULL,
	[ITEM_TEXT] [varchar](100) NOT NULL,
	[DISPLAY_ORDER] [int] NOT NULL,
 CONSTRAINT [PK_LIST_PHYSICAL_ACTIVITY_LOG] PRIMARY KEY CLUSTERED 
(
	[LIST_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LIST_MENU]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LIST_MENU]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LIST_MENU](
	[LIST_ID] [int] NOT NULL,
	[LIST_NAME] [varchar](255) NOT NULL,
	[LISTITEM_ID] [int] NOT NULL,
	[TEXT] [varchar](255) NOT NULL,
	[VALUE] [varchar](255) NOT NULL,
	[VISIBLE_FLG] [smallint] NOT NULL,
	[ENABLED_FLG] [smallint] NOT NULL,
	[ROLES] [varchar](255) NOT NULL,
	[USERNAMES] [varchar](255) NOT NULL,
	[DISPLAY_ORDER] [int] NOT NULL,
	[SELECTED_FLG] [smallint] NOT NULL,
	[DESCRIPTION] [varchar](255) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[List_Items]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[List_Items]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[List_Items](
	[LISTITEM_ID] [int] NOT NULL,
	[LIST_NAME] [varchar](50) NULL,
	[ITEM_VALUE] [varchar](50) NULL,
	[ITEM_TEXT] [varchar](255) NULL,
	[ITEM_ID] [int] NULL,
	[DISPLAY_ORDER] [int] NOT NULL,
 CONSTRAINT [PK_List_Items] PRIMARY KEY CLUSTERED 
(
	[LISTITEM_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LIST_DD]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LIST_DD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LIST_DD](
	[LIST_ID] [int] NOT NULL,
	[LIST_NAME] [varchar](100) NOT NULL,
	[ITEM_ID] [int] NULL,
	[ITEM_VALUE] [varchar](100) NULL,
	[ITEM_TEXT] [varchar](100) NOT NULL,
	[DISPLAY_ORDER] [int] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PAL_MET_EQUIVALENT]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PAL_MET_EQUIVALENT]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PAL_MET_EQUIVALENT](
	[ACTIVITY_ID] [int] NOT NULL,
	[DURATION] [int] NOT NULL,
	[INTENSITY] [int] NOT NULL,
	[MET_EQUIVALENT] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GET_Items_AnyItemTable]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GET_Items_AnyItemTable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GET_Items_AnyItemTable]
@ListName VARCHAR(50),
@TableName VARCHAR(50)
AS

DECLARE @query VARCHAR(1000)
SET  @query=''select * from ''+ @TableName+'' where LIST_NAME=''''''+ @ListName + '''''' order by DISPLAY_ORDER''
PRINT(@query)

if(''LIST_STATECOUNTRY'' = upper(@TableName))
begin 
SET  @query=''select * from ''+ @TableName+'' where LIST_NAME=''''''+ @ListName + '''''' order by ITEM_VALUE, Item_ID''
PRINT(@query)
end
EXEC(@query)' 
END
GO
/****** Object:  Table [dbo].[PROGRAMS]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PROGRAMS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PROGRAMS](
	[PROGRAM_ID] [int] NOT NULL,
	[DELETE_FLG] [smallint] NOT NULL,
	[PROGRAM_NAME] [varchar](255) NOT NULL,
	[LEVEL_ID] [int] NOT NULL,
	[NUM_STEPS] [int] NOT NULL,
	[MIN_PAL_ENTRIES] [int] NOT NULL,
	[MIN_DAYS] [int] NOT NULL,
	[FORUM_PROGRAM_ID] [int] NOT NULL,
	[NUTRITION_ID] [int] NOT NULL,
 CONSTRAINT [PK_PROGRAMS] PRIMARY KEY CLUSTERED 
(
	[PROGRAM_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PROGRAM_EXERCISES]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PROGRAM_EXERCISES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PROGRAM_EXERCISES](
	[EXERCISE_ID] [int] NULL,
	[PROGRAM_SERIES] [int] NULL,
	[NAME] [varchar](100) NULL,
	[IMAGE1] [varchar](100) NULL,
	[IMAGE2] [varchar](100) NULL,
	[HTML_TEXT] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[spPAL_GET_PalStarts_BY_UserId]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPAL_GET_PalStarts_BY_UserId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spPAL_GET_PalStarts_BY_UserId]
@USER_ID varchar(100),
@ACTIVE_FLG varchar(100),
@PROGRAM_COMPLETION_FLG varchar(100)
AS

declare @sql varchar(8000)
set @sql = ''
SELECT PS.*, P.*
FROM PAL_STARTS PS
INNER JOIN PROGRAMS P ON
	P.PROGRAM_ID = PS.PROGRAM_ID
WHERE 1=1
''

if(@USER_ID <> '''')
begin
	set @sql = @sql + '' AND PS.USER_ID='''''' + @USER_ID + ''''''''
end

if(@ACTIVE_FLG <> '''')
begin
	set @sql = @sql + '' AND PS.ACTIVE_FLG='' + @ACTIVE_FLG
end

if(@PROGRAM_COMPLETION_FLG <> '''')
begin
	set @sql = @sql + '' AND PS.PROGRAM_COMPLETION_FLG='' + @PROGRAM_COMPLETION_FLG
end

set @sql = @sql + '' ORDER BY PS.PROGRAM_START_DATE DESC''

--print(@sql)
exec(@sql)' 
END
GO
/****** Object:  StoredProcedure [dbo].[spPAL_GET_PalStarts]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPAL_GET_PalStarts]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spPAL_GET_PalStarts]
@USER_ID varchar(100),
@ACTIVE_FLG varchar(100),
@PROGRAM_COMPLETION_FLG varchar(100)
AS

declare @sql varchar(8000)
set @sql = ''
SELECT PS.*, P.*
FROM PAL_STARTS PS
INNER JOIN PROGRAMS P ON
	P.PROGRAM_ID = PS.PROGRAM_ID
WHERE 1=1
''

if(@USER_ID <> '''')
begin
	set @sql = @sql + '' AND PS.USER_ID='''''' + @USER_ID + ''''''''
end

if(@ACTIVE_FLG <> '''')
begin
	set @sql = @sql + '' AND PS.ACTIVE_FLG='' + @ACTIVE_FLG
end

if(@PROGRAM_COMPLETION_FLG <> '''')
begin
	set @sql = @sql + '' AND PS.PROGRAM_COMPLETION_FLG='' + @PROGRAM_COMPLETION_FLG
end

set @sql = @sql + '' ORDER BY PS.PROGRAM_START_DATE DESC''

--print(@sql)
exec(@sql)' 
END
GO
/****** Object:  StoredProcedure [dbo].[spMem_GET_UserInfo_BY_AccountFrom]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spMem_GET_UserInfo_BY_AccountFrom]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spMem_GET_UserInfo_BY_AccountFrom]      
@ACCOUNT_FROM varchar(100),      
@REGISTRATION_FLG varchar(100)      
AS      
BEGIN      
declare @sql varchar(8000)      
set @sql=''      
SELECT USER_INFO.USER_ID,USER_INFO.intCompanyId,USER_INFO.USER_GROUP_ID,USER_INFO.DELETE_FLG,USER_INFO.FNAME,
USER_INFO.MNAME,USER_INFO.LNAME,USER_INFO.DEGREE_ID,USER_INFO.SPECIALTY,USER_INFO.AFFILIATION,USER_INFO.ADDRESS1,
USER_INFO.ADDRESS2,USER_INFO.CITY,USER_INFO.STATE_ID,USER_INFO.STATE_TEXT,USER_INFO.ZIP,COUNTRY_ID,USER_INFO.PHONE,
USER_INFO.FAX,USER_INFO.ORGANIZATION,USER_INFO.IS_ACCREDITED,USER_INFO.RND_REG_CODE,USER_INFO.DATE_CREATED,USER_INFO.LAST_MODIFIED,
USER_INFO.EMAIL_LIST_FLG,USER_INFO.YOUR_ROLE_ID,USER_INFO.HEIGHT,USER_INFO.GENDER_ID,USER_INFO.FAMILY_STATUS_ID,
USER_INFO.DATE_BIRTH,USER_INFO.REGISTRATION_FLG,USER_INFO.ACCOUNT_CREDITS,USER_INFO.ACCOUNT_FROM,USER_INFO.ACCOUNT_FROM_RELATIONSHIP_ID,
USER_INFO.strRiskStratificationProcessStep,
USERNAME=(select UserName from aspnet_Users where UserId=USER_INFO.USER_ID),
aspnet_Roles.RoleName,aspnet_Membership.ApplicationId,aspnet_Membership.UserId,aspnet_Membership.Password,
aspnet_Membership.PasswordFormat,aspnet_Membership.PasswordSalt,aspnet_Membership.MobilePIN,aspnet_Membership.Email,
aspnet_Membership.LoweredEmail,aspnet_Membership.PasswordQuestion,aspnet_Membership.PasswordAnswer,aspnet_Membership.IsApproved,
aspnet_Membership.IsLockedOut,aspnet_Membership.CreateDate,aspnet_Membership.LastLoginDate,aspnet_Membership.LastPasswordChangedDate,
aspnet_Membership.LastLockoutDate,aspnet_Membership.FailedPasswordAttemptCount,aspnet_Membership.FailedPasswordAttemptWindowStart,
aspnet_Membership.FailedPasswordAnswerAttemptCount,aspnet_Membership.FailedPasswordAnswerAttemptWindowStart,
aspnet_Membership.Comment
FROM USER_INFO      
INNER JOIN aspnet_Membership ON       
 aspnet_Membership.UserId = USER_INFO.USER_ID      
INNER JOIN aspnet_UsersInRoles ON       
 aspnet_UsersInRoles.UserId = USER_INFO.USER_ID      
INNER JOIN aspnet_Roles ON       
 aspnet_Roles.RoleId = aspnet_UsersInRoles.RoleId
 
WHERE 1=1 AND ISNULL(DELETE_FLG,0) = 0 ''      
      
if(@ACCOUNT_FROM <> '''')      
begin      
 set @sql = @sql + '' AND USER_INFO.ACCOUNT_FROM='''''' + @ACCOUNT_FROM + ''''''''      
end      
      
if(@REGISTRATION_FLG <> '''')      
begin      
 set @sql = @sql + '' AND USER_INFO.REGISTRATION_FLG='' + @REGISTRATION_FLG + ''''      
end      
      
      
--print(@sql)     
 set @sql = @sql + '' order by aspnet_Membership.createdate desc''    
     
exec(@sql)      
   
      
/*      
SELECT M.Password, PASSWORD=M.Password, USERNAME=B.UserName, M.IsLockedOut, R.RoleName, A.*,      
E.ITEM_VALUE as StateID,      
F.ITEM_VALUE as CountryID,      
STATE=E.ITEM_TEXT,      
COUNTRY=F.ITEM_TEXT,      
EMAIL=B.UserName,      
STATE_ABBR=E.ITEM_VALUE,      
DEGREE_ABBR=(select ITEM_VALUE from List_Items where ITEM_ID=DEGREE_ID and LIST_NAME=''Degree'')      
FROM USER_INFO A,LIST_STATECOUNTRY E,LIST_STATECOUNTRY F,aspnet_users B, aspnet_Membership M, 
aspnet_Roles R,aspnet_UsersInRoles U      
--WHERE B.loweredusername=LOWER(@UserEmail)      
WHERE A.ACCOUNT_FROM=@ACCOUNT_FROM      
AND E.ITEM_ID=A.STATE_ID      
AND F.ITEM_ID=A.COUNTRY_ID      
AND E.LIST_NAME=''State''      
AND F.LIST_NAME=''Country''      
AND A.USER_ID = M.UserId      
AND B.UserID = A.USER_ID      
AND U.UserId = A.USER_ID      
AND R.RoleId = U.RoleId      
      
*/     
END
 ' 
END
GO
/****** Object:  StoredProcedure [dbo].[spRpt_REPORT_ProgramLevel]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRpt_REPORT_ProgramLevel]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRpt_REPORT_ProgramLevel]
@ACCOUNT_ID varchar(100),
@FILTER_ACCOUNT_FROM varchar(255)
AS

declare @and_accountfrom varchar(1000)
set @and_accountfrom = ''''

if(@FILTER_ACCOUNT_FROM = ''Main'')
begin
	set @and_accountfrom = '' and USER_ID=ACCOUNT_FROM ''
end
if(@FILTER_ACCOUNT_FROM = ''Extended'')
begin
	set @and_accountfrom = '' and USER_ID<>ACCOUNT_FROM ''
end

declare @sql varchar(8000)
set @sql =''
SELECT *,
''
declare @i int
set @i = 1
while @i <= 13
begin
	set @sql = @sql + ''STEP_'' + cast(@i as varchar(100)) + ''=(select count(PAL_START_ID) 
										from PAL_STARTS PS 
										where PS.PROGRAM_ID=P.PROGRAM_ID 
										and PS.DELETE_FLG=0 
										and PROGRAM_COMPLETION_FLG=0 
										and PROGRAM_CURRENT_STEP='' + cast(@i as varchar(100)) + ''
										and exists (select USER_ID 
													from USER_INFO UI 
													where PS.USER_ID=UI.USER_ID
													'' + @and_accountfrom + ''
													and exists(select USER_ID
																from ACCOUNT_USERS AU
																where AU.USER_ID=UI.USER_ID
																and AU.ACCOUNT_ID='' + @ACCOUNT_ID + '')
													)),
''
set @i = @i + 1
end

set @sql = @sql + ''
COMPLETION=(select count(PAL_START_ID) from PAL_STARTS PS where PS.PROGRAM_ID=P.PROGRAM_ID and DELETE_FLG=0 and PROGRAM_COMPLETION_FLG=1
and exists (select USER_ID 
													from USER_INFO UI 
													where PS.USER_ID=UI.USER_ID
													'' + @and_accountfrom + ''
													and exists(select USER_ID
																from ACCOUNT_USERS AU
																where AU.USER_ID=UI.USER_ID
																and AU.ACCOUNT_ID='' + @ACCOUNT_ID + '')
													))
 FROM PROGRAMS P''

--print(@sql)
--print(''length='' + cast(len(@sql) as varchar(255)))
exec(@sql)
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spRpt_REPORT_PalEntries_BY_Date]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRpt_REPORT_PalEntries_BY_Date]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRpt_REPORT_PalEntries_BY_Date]
@DATE_FROM varchar(100),
@DATE_TO varchar(100),
@ACCOUNT_ID varchar(255),
@FILTER_ACCOUNT_FROM varchar(255)
AS
------------------------------------------------------
declare @and_accountfrom varchar(1000)
set @and_accountfrom = ''''

if(@FILTER_ACCOUNT_FROM = ''Main'')
begin
	set @and_accountfrom = '' and USER_ID=ACCOUNT_FROM ''
end
if(@FILTER_ACCOUNT_FROM = ''Extended'')
begin
	set @and_accountfrom = '' and USER_ID<>ACCOUNT_FROM ''
end
-------------------------------------------------------
declare @and_date varchar(100)
set @and_date = ''''
if(@DATE_FROM <> '''' and @DATE_TO <> '''')
begin
	set @and_date = '' AND PAL_ENTRY_DATE >= '''''' + @DATE_FROM + ''''''''
	set @and_date = @and_date + '' AND PAL_ENTRY_DATE <= '''''' + @DATE_TO + ''''''''
end

declare @sql varchar(8000)
set @sql =''
SELECT 
NUM_PAL=(select count(PAL_ENTRY_ID) from PAL_ENTRIES PE where DELETE_FLG=0
			'' + @and_date + ''
			and	exists (
						select * from USER_INFO UI where UI.USER_ID = PE.USER_ID
						and exists( Select * from ACCOUNT_USERS AU where AU.USER_ID = UI.USER_ID
									and ACCOUNT_ID = ''+ @ACCOUNT_ID +''
									
									)
						'' + @and_accountfrom + ''
						)),
SUM_MET=isnull((select sum(MET_EQUIVALENT) 
			from PAL_ENTRIES PE 
			inner join PAL_MET_EQUIVALENT PME on
				PME.ACTIVITY_ID=PE.PAL_ENTRY_TYPE and
				PME.DURATION=PE.PAL_ENTRY_DURATION and
				PME.INTENSITY=PE.PAL_ENTRY_INTENSITY
			where DELETE_FLG=0
			'' + @and_date + ''
			and	exists (
						select * from USER_INFO UI where UI.USER_ID = PE.USER_ID
						and exists( Select * from ACCOUNT_USERS AU where AU.USER_ID = UI.USER_ID
									and ACCOUNT_ID = ''+ @ACCOUNT_ID +''
									
									)
						'' + @and_accountfrom + ''
						)),0)
''



print(@sql)
--print(''length='' + cast(len(@sql) as varchar(255)))
exec(@sql)
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spRpt_REPORT_Log_BY_Date_033009]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRpt_REPORT_Log_BY_Date_033009]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRpt_REPORT_Log_BY_Date_033009]
@DATE_FROM varchar(100),
@DATE_TO varchar(100),
@ACCOUNT_ID varchar(255),
@FILTER_ACCOUNT_FROM varchar(255)
AS
------------------------------------------------------
declare @and_accountfrom varchar(1000)
set @and_accountfrom = ''''

if(@FILTER_ACCOUNT_FROM = ''Main'')
begin
	set @and_accountfrom = '' and USER_ID=ACCOUNT_FROM ''
end
if(@FILTER_ACCOUNT_FROM = ''Extended'')
begin
	set @and_accountfrom = '' and USER_ID<>ACCOUNT_FROM ''
end
-------------------------------------------------------
declare @and_date varchar(100)
set @and_date = ''''
if(@DATE_FROM <> '''' and @DATE_TO <> '''')
begin
	set @and_date = '' AND PAL_ENTRY_DATE >= '''''' + @DATE_FROM + ''''''''
	set @and_date = @and_date + '' AND PAL_ENTRY_DATE <= '''''' + @DATE_TO + ''''''''
end

declare @sql varchar(8000)
set @sql =''
SELECT 
NUM_PAL=(select count(PAL_ENTRY_ID) from PAL_ENTRIES PE where DELETE_FLG=0
			'' + @and_date + ''
			and	exists (
						select * from USER_INFO UI where UI.USER_ID = PE.USER_ID
						and exists( Select * from ACCOUNT_USERS AU where AU.USER_ID = UI.USER_ID
									and ACCOUNT_ID = ''+ @ACCOUNT_ID +''
									
									)
						'' + @and_accountfrom + ''
						)),
SUM_MET=isnull((select sum(MET_EQUIVALENT) 
			from PAL_ENTRIES PE 
			inner join PAL_MET_EQUIVALENT PME on
				PME.ACTIVITY_ID=PE.PAL_ENTRY_TYPE and
				PME.DURATION=PE.PAL_ENTRY_DURATION and
				PME.INTENSITY=PE.PAL_ENTRY_INTENSITY
			where DELETE_FLG=0
			'' + @and_date + ''
			and	exists (
						select * from USER_INFO UI where UI.USER_ID = PE.USER_ID
						and exists( Select * from ACCOUNT_USERS AU where AU.USER_ID = UI.USER_ID
									and ACCOUNT_ID = ''+ @ACCOUNT_ID +''
									
									)
						'' + @and_accountfrom + ''
						)),0)
''



print(@sql)
--print(''length='' + cast(len(@sql) as varchar(255)))
exec(@sql)
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spRpt_REPORT_ListPal_Type]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRpt_REPORT_ListPal_Type]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRpt_REPORT_ListPal_Type]
@DATE_FROM varchar(100),
@DATE_TO varchar(100),
@ACCOUNT_ID varchar(255),
@FILTER_ACCOUNT_FROM varchar(255)
AS
------------------------------------------------------
declare @and_accountfrom varchar(1000)
set @and_accountfrom = ''''

if(@FILTER_ACCOUNT_FROM = ''Main'')
begin
	set @and_accountfrom = '' and USER_ID=ACCOUNT_FROM ''
end
if(@FILTER_ACCOUNT_FROM = ''Extended'')
begin
	set @and_accountfrom = '' and USER_ID<>ACCOUNT_FROM ''
end
-------------------------------------------------------
declare @and_date varchar(100)
set @and_date = ''''
if(@DATE_FROM <> '''' and @DATE_TO <> '''')
begin
	set @and_date = '' AND PAL_ENTRY_DATE >= '''''' + @DATE_FROM + ''''''''
	set @and_date = @and_date + '' AND PAL_ENTRY_DATE <= '''''' + @DATE_TO + ''''''''
end

declare @sql varchar(8000)
set @sql =''
SELECT *, COUNT=isnull((select count(*)
							from PAL_ENTRIES PE 
							where PE.PAL_ENTRY_TYPE= LP.ITEM_VALUE
							
								and	exists (
										select * from USER_INFO UI where UI.USER_ID = PE.USER_ID
										and exists( Select * from ACCOUNT_USERS AU where AU.USER_ID = UI.USER_ID
													and ACCOUNT_ID = ''+ @ACCOUNT_ID +''
													
													)
								'' + @and_accountfrom + ''
								'' + @and_date + '' 
							)
						),0)


FROM
LIST_PAL LP 
WHERE LP.LIST_NAME=''''Type''''
and ITEM_ID<>0
ORDER BY [DISPLAY_ORDER]
''






print(@sql)
--print(''length='' + cast(len(@sql) as varchar(255)))
exec(@sql)
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spRpt_REPORT_ListPal_Time]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRpt_REPORT_ListPal_Time]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRpt_REPORT_ListPal_Time]
@DATE_FROM varchar(100),
@DATE_TO varchar(100),
@ACCOUNT_ID varchar(255),
@FILTER_ACCOUNT_FROM varchar(255)
AS
------------------------------------------------------
declare @and_accountfrom varchar(1000)
set @and_accountfrom = ''''

if(@FILTER_ACCOUNT_FROM = ''Main'')
begin
	set @and_accountfrom = '' and USER_ID=ACCOUNT_FROM ''
end
if(@FILTER_ACCOUNT_FROM = ''Extended'')
begin
	set @and_accountfrom = '' and USER_ID<>ACCOUNT_FROM ''
end
-------------------------------------------------------
declare @and_date varchar(100)
set @and_date = ''''
if(@DATE_FROM <> '''' and @DATE_TO <> '''')
begin
	set @and_date = '' AND PAL_ENTRY_DATE >= '''''' + @DATE_FROM + ''''''''
	set @and_date = @and_date + '' AND PAL_ENTRY_DATE <= '''''' + @DATE_TO + ''''''''
end

declare @sql varchar(8000)
set @sql =''
SELECT *, COUNT=isnull((select count(*)
							from PAL_ENTRIES PE 
							where PE.PAL_ENTRY_TIME= LP.ITEM_VALUE
							
								and	exists (
										select * from USER_INFO UI where UI.USER_ID = PE.USER_ID
										and exists( Select * from ACCOUNT_USERS AU where AU.USER_ID = UI.USER_ID
													and ACCOUNT_ID = ''+ @ACCOUNT_ID +''
													
													)
										'' + @and_accountfrom + ''
							'' + @and_date + '' 
							)
						),0)


FROM
LIST_PAL LP 
WHERE LP.LIST_NAME=''''Time''''
and ITEM_ID<>0
ORDER BY [DISPLAY_ORDER]
''






print(@sql)
--print(''length='' + cast(len(@sql) as varchar(255)))
exec(@sql)
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spRpt_REPORT_ListPal_Intensity]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRpt_REPORT_ListPal_Intensity]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRpt_REPORT_ListPal_Intensity]
@DATE_FROM varchar(100),
@DATE_TO varchar(100),
@ACCOUNT_ID varchar(255),
@FILTER_ACCOUNT_FROM varchar(255)
AS
------------------------------------------------------
declare @and_accountfrom varchar(1000)
set @and_accountfrom = ''''

if(@FILTER_ACCOUNT_FROM = ''Main'')
begin
	set @and_accountfrom = '' and USER_ID=ACCOUNT_FROM ''
end
if(@FILTER_ACCOUNT_FROM = ''Extended'')
begin
	set @and_accountfrom = '' and USER_ID<>ACCOUNT_FROM ''
end
-------------------------------------------------------
declare @and_date varchar(100)
set @and_date = ''''
if(@DATE_FROM <> '''' and @DATE_TO <> '''')
begin
	set @and_date = '' AND PAL_ENTRY_DATE >= '''''' + @DATE_FROM + ''''''''
	set @and_date = @and_date + '' AND PAL_ENTRY_DATE <= '''''' + @DATE_TO + ''''''''
end

declare @sql varchar(8000)
set @sql =''
SELECT *, COUNT=isnull((select count(*)
							from PAL_ENTRIES PE 
							where PE.PAL_ENTRY_INTENSITY= LP.ITEM_VALUE
							
								and	exists (
										select * from USER_INFO UI where UI.USER_ID = PE.USER_ID
										and exists( Select * from ACCOUNT_USERS AU where AU.USER_ID = UI.USER_ID
													and ACCOUNT_ID = ''+ @ACCOUNT_ID +''
													
													)
										'' + @and_accountfrom + ''
							'' + @and_date + '' 
							)
						),0)


FROM
LIST_PAL LP 
WHERE LP.LIST_NAME=''''Intensity''''
and ITEM_ID<>0
ORDER BY [DISPLAY_ORDER]
''






--print(@sql)
--print(''length='' + cast(len(@sql) as varchar(255)))
exec(@sql)
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spRpt_REPORT_ListPal_Duration]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRpt_REPORT_ListPal_Duration]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRpt_REPORT_ListPal_Duration]
@DATE_FROM varchar(100),
@DATE_TO varchar(100),
@ACCOUNT_ID varchar(255),
@FILTER_ACCOUNT_FROM varchar(255)
AS
------------------------------------------------------
declare @and_accountfrom varchar(1000)
set @and_accountfrom = ''''

if(@FILTER_ACCOUNT_FROM = ''Main'')
begin
	set @and_accountfrom = '' and USER_ID=ACCOUNT_FROM ''
end
if(@FILTER_ACCOUNT_FROM = ''Extended'')
begin
	set @and_accountfrom = '' and USER_ID<>ACCOUNT_FROM ''
end
-------------------------------------------------------
declare @and_date varchar(100)
set @and_date = ''''
if(@DATE_FROM <> '''' and @DATE_TO <> '''')
begin
	set @and_date = '' AND PAL_ENTRY_DATE >= '''''' + @DATE_FROM + ''''''''
	set @and_date = @and_date + '' AND PAL_ENTRY_DATE <= '''''' + @DATE_TO + ''''''''
end

declare @sql varchar(8000)
set @sql =''
SELECT *, COUNT=isnull((select count(*)
							from PAL_ENTRIES PE 
							where PE.PAL_ENTRY_DURATION= LP.ITEM_VALUE
							
								and	exists (
										select * from USER_INFO UI where UI.USER_ID = PE.USER_ID
										and exists( Select * from ACCOUNT_USERS AU where AU.USER_ID = UI.USER_ID
													and ACCOUNT_ID = ''+ @ACCOUNT_ID +''
													
													)
										'' + @and_accountfrom + ''
							'' + @and_date + '' 
							)
						),0)


FROM
LIST_PAL LP 
WHERE LP.LIST_NAME=''''Duration''''
and ITEM_ID<>0
ORDER BY [DISPLAY_ORDER]
''






print(@sql)
--print(''length='' + cast(len(@sql) as varchar(255)))
exec(@sql)
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spRpt_REPORT_ListDd_Type]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRpt_REPORT_ListDd_Type]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRpt_REPORT_ListDd_Type]
@DATE_FROM varchar(100),
@DATE_TO varchar(100),
@ACCOUNT_ID varchar(255),
@FILTER_ACCOUNT_FROM varchar(255)
AS
------------------------------------------------------
declare @and_accountfrom varchar(1000)
set @and_accountfrom = ''''

if(@FILTER_ACCOUNT_FROM = ''Main'')
begin
	set @and_accountfrom = '' and USER_ID=ACCOUNT_FROM ''
end
if(@FILTER_ACCOUNT_FROM = ''Extended'')
begin
	set @and_accountfrom = '' and USER_ID<>ACCOUNT_FROM ''
end
-------------------------------------------------------
declare @and_date varchar(100)
set @and_date = ''''
if(@DATE_FROM <> '''' and @DATE_TO <> '''')
begin
	set @and_date = '' AND DD_ENTRY_DATE >= '''''' + @DATE_FROM + ''''''''
	set @and_date = @and_date + '' AND DD_ENTRY_DATE <= '''''' + @DATE_TO + ''''''''
end

declare @sql varchar(8000)
set @sql = ''
SELECT AVG_TOTAL_FIELD_01=isnull((sum(TOTAL_FIELD_01)/count(TOTAL_FIELD_01)),0),
AVG_TOTAL_FIELD_02=isnull((sum(TOTAL_FIELD_02)/count(TOTAL_FIELD_02)),0),
AVG_TOTAL_FIELD_03=isnull((sum(TOTAL_FIELD_03)/count(TOTAL_FIELD_03)),0),
AVG_TOTAL_FIELD_04=isnull((sum(TOTAL_FIELD_04)/count(TOTAL_FIELD_04)),0),
AVG_TOTAL_FIELD_05=isnull((sum(TOTAL_FIELD_05)/count(TOTAL_FIELD_05)),0),
AVG_TOTAL_FIELD_06=isnull((sum(TOTAL_FIELD_06)/count(TOTAL_FIELD_06)),0),
AVG_TOTAL_FIELD_07=isnull((sum(TOTAL_FIELD_07)/count(TOTAL_FIELD_07)),0)
FROM DD_ENTRIES DE
WHERE 1=1
		and	exists (
				select * from USER_INFO UI where UI.USER_ID = DE.USER_ID
				and exists( Select * from ACCOUNT_USERS AU where AU.USER_ID = UI.USER_ID
							and ACCOUNT_ID = ''+ @ACCOUNT_ID +''
							)
				'' + @and_accountfrom + ''
	'' + @and_date + '' )
''



--print(@sql)
--print(''length='' + cast(len(@sql) as varchar(255)))
exec(@sql)
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spRpt_REPORT_ListDd_LVType]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRpt_REPORT_ListDd_LVType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRpt_REPORT_ListDd_LVType]
@DATE_FROM varchar(100),
@DATE_TO varchar(100),
@ACCOUNT_ID varchar(255),
@FILTER_ACCOUNT_FROM varchar(255)
AS
------------------------------------------------------
declare @and_accountfrom varchar(1000)
set @and_accountfrom = ''''

if(@FILTER_ACCOUNT_FROM = ''Main'')
begin
	set @and_accountfrom = '' and USER_ID=ACCOUNT_FROM ''
end
if(@FILTER_ACCOUNT_FROM = ''Extended'')
begin
	set @and_accountfrom = '' and USER_ID<>ACCOUNT_FROM ''
end
-------------------------------------------------------
declare @and_date varchar(100)
set @and_date = ''''
if(@DATE_FROM <> '''' and @DATE_TO <> '''')
begin
	set @and_date = '' AND DD_ENTRY_DATE >= '''''' + @DATE_FROM + ''''''''
	set @and_date = @and_date + '' AND DD_ENTRY_DATE <= '''''' + @DATE_TO + ''''''''
end

declare @sql varchar(8000)
set @sql = ''
SELECT AVG_LV_FIELD_01=isnull((sum(LV_FIELD_01)/count(LV_FIELD_01)),0),
AVG_LV_FIELD_02=isnull((sum(LV_FIELD_02)/count(LV_FIELD_02)),0),
AVG_LV_FIELD_03=isnull((sum(LV_FIELD_03)/count(LV_FIELD_03)),0),
AVG_LV_FIELD_04=isnull((sum(LV_FIELD_04)/count(LV_FIELD_04)),0),
AVG_LV_FIELD_05=isnull((sum(LV_FIELD_05)/count(LV_FIELD_05)),0),
COUNT=count(LV_FIELD_01)
FROM DD_ENTRIES DE
WHERE 1=1
		and	exists (
				select * from USER_INFO UI where UI.USER_ID = DE.USER_ID
				and exists( Select * from ACCOUNT_USERS AU where AU.USER_ID = UI.USER_ID
							and ACCOUNT_ID = ''+ @ACCOUNT_ID +''
							)
				'' + @and_accountfrom + ''
	'' + @and_date + '' )
''



--print(@sql)
--print(''length='' + cast(len(@sql) as varchar(255)))
exec(@sql)
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spRpt_REPORT_DdEntries_BY_Date]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRpt_REPORT_DdEntries_BY_Date]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRpt_REPORT_DdEntries_BY_Date]
@DATE_FROM varchar(100),
@DATE_TO varchar(100),
@ACCOUNT_ID varchar(255),
@FILTER_ACCOUNT_FROM varchar(255)
AS
------------------------------------------------------
declare @and_accountfrom varchar(1000)
set @and_accountfrom = ''''

if(@FILTER_ACCOUNT_FROM = ''Main'')
begin
	set @and_accountfrom = '' and USER_ID=ACCOUNT_FROM ''
end
if(@FILTER_ACCOUNT_FROM = ''Extended'')
begin
	set @and_accountfrom = '' and USER_ID<>ACCOUNT_FROM ''
end
-------------------------------------------------------
declare @and_date varchar(100)
set @and_date = ''''
if(@DATE_FROM <> '''' and @DATE_TO <> '''')
begin
	set @and_date = '' AND DD_ENTRY_DATE >= '''''' + @DATE_FROM + ''''''''
	set @and_date = @and_date + '' AND DD_ENTRY_DATE <= '''''' + @DATE_TO + ''''''''
end

declare @sql varchar(8000)
set @sql =''
SELECT 
NUM_DD=(select count(DD_ENTRY_ID) from DD_ENTRIES DE where 1=1
			'' + @and_date + ''
			and	exists (
						select * from USER_INFO UI where UI.USER_ID = DE.USER_ID
						and exists( Select * from ACCOUNT_USERS AU where AU.USER_ID = UI.USER_ID
									and ACCOUNT_ID = ''+ @ACCOUNT_ID +''
									
									)
						'' + @and_accountfrom + ''
						
						))''

print(@sql)
--print(''length='' + cast(len(@sql) as varchar(255)))
exec(@sql)
' 
END
GO
/****** Object:  Table [dbo].[tbl_TempCategory]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_TempCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_TempCategory](
	[intTempCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[strCategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_TempCategory] PRIMARY KEY CLUSTERED 
(
	[intTempCategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_SectionVisited]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_SectionVisited]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_SectionVisited](
	[intSectionVisitedId] [int] IDENTITY(1,1) NOT NULL,
	[strUserId] [nvarchar](500) NOT NULL,
	[strUserType] [nvarchar](50) NOT NULL,
	[dtCreatedOn] [datetime] NOT NULL,
	[strAgent] [nvarchar](255) NOT NULL,
	[strVisitedIP] [nvarchar](50) NOT NULL,
	[strSectionVisited] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_SectionVisited] PRIMARY KEY CLUSTERED 
(
	[intSectionVisitedId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tbl_QuestionsForHealthCoach]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_QuestionsForHealthCoach]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_QuestionsForHealthCoach](
	[intQuestionId] [int] IDENTITY(1,1) NOT NULL,
	[strUserName] [nvarchar](300) NOT NULL,
	[strCategoryName] [nvarchar](50) NOT NULL,
	[strCategoryLevel] [nvarchar](50) NULL,
	[strQuestion] [nvarchar](300) NOT NULL,
	[strSubject] [nvarchar](300) NOT NULL,
	[strComments] [nvarchar](300) NULL,
	[strQuestionType] [nvarchar](50) NOT NULL,
	[dtCreatedOn] [datetime] NOT NULL,
	[chrIsAnsweredGiven] [char](1) NOT NULL,
	[chrIsDeleted] [char](1) NULL,
 CONSTRAINT [PK_tbl_QuestionsForHealthCoach] PRIMARY KEY CLUSTERED 
(
	[intQuestionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Questionnaires]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Questionnaires]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_Questionnaires](
	[intQuestionnaireId] [int] IDENTITY(1,1) NOT NULL,
	[intQuestionnaireType] [int] NOT NULL,
	[strQuestionHeading] [varchar](100) NULL,
	[strQuestion] [varchar](500) NOT NULL,
	[chrDisplayYes] [char](1) NOT NULL,
	[chrDisplayNo] [char](1) NOT NULL,
	[chrDisplayDontKnow] [char](1) NOT NULL,
	[chrIsActive] [char](1) NOT NULL,
	[chrIsDeleted] [char](1) NOT NULL,
	[dtDeletedDate] [datetime] NULL,
	[dtCreatedDate] [datetime] NOT NULL,
	[dtModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Questionnaires] PRIMARY KEY CLUSTERED 
(
	[intQuestionnaireId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tbl_Questionnaires', N'COLUMN',N'intQuestionnaireType'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'this shows the type of the questionnaire that is which type of question it is. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Questionnaires', @level2type=N'COLUMN',@level2name=N'intQuestionnaireType'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tbl_Questionnaires', N'COLUMN',N'chrDisplayYes'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'this columns shows wheather to display the yes option or not in the answer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Questionnaires', @level2type=N'COLUMN',@level2name=N'chrDisplayYes'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tbl_Questionnaires', N'COLUMN',N'chrDisplayNo'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'this columns shows wheather to display the "NO" option or not in the answer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Questionnaires', @level2type=N'COLUMN',@level2name=N'chrDisplayNo'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tbl_Questionnaires', N'COLUMN',N'chrDisplayDontKnow'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'this columns shows wheather to display the "Dont Know" option or not in the answer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Questionnaires', @level2type=N'COLUMN',@level2name=N'chrDisplayDontKnow'
GO
/****** Object:  Table [dbo].[tbl_PersonalSummary]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_PersonalSummary]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_PersonalSummary](
	[intPersonalSummaryId] [int] IDENTITY(1,1) NOT NULL,
	[decWeight] [decimal](18, 2) NULL,
	[decWaist] [decimal](18, 2) NULL,
	[decBMI] [decimal](18, 2) NULL,
	[decBodyFATPercentage] [decimal](18, 2) NULL,
	[decWaistToHeight] [decimal](18, 2) NULL,
	[decWaistToHip] [decimal](18, 2) NULL,
	[guidUserId] [uniqueidentifier] NULL,
	[dtCreatedOn] [datetime] NULL,
	[dtModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_PersonalSummary] PRIMARY KEY CLUSTERED 
(
	[intPersonalSummaryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tbl_Newsletters]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Newsletters]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_Newsletters](
	[intNewsLetterId] [int] IDENTITY(1,1) NOT NULL,
	[strTitle] [varchar](100) NOT NULL,
	[strDescription] [varchar](1000) NULL,
	[strNewsletterDate] [datetime] NULL,
	[strPDFFileName] [varchar](50) NULL,
	[chrIsActive] [char](1) NULL,
	[chrIsDeleted] [char](1) NULL,
	[dtCreatedOn] [datetime] NOT NULL,
	[dtModifiedOn] [datetime] NULL,
	[dtDeletedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_Newsletters] PRIMARY KEY CLUSTERED 
(
	[intNewsLetterId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_NewsandAnnouncements]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_NewsandAnnouncements]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_NewsandAnnouncements](
	[intNewsAnnouncementsId] [int] IDENTITY(1,1) NOT NULL,
	[strHeading] [varchar](100) NOT NULL,
	[strDescription] [varchar](500) NULL,
	[strPDFFilename] [varchar](50) NULL,
	[strDirectLink] [varchar](150) NULL,
	[chrIsHomePage] [char](1) NULL,
	[chrIsActive] [char](1) NULL,
	[chrIsDelelte] [char](1) NULL,
	[dtCreatedOn] [datetime] NOT NULL,
	[dtModifiedOn] [datetime] NULL,
	[dtDeletedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_NewsandAnnouncements] PRIMARY KEY CLUSTERED 
(
	[intNewsAnnouncementsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_METActivity]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_METActivity]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_METActivity](
	[intActivityTypeId] [int] IDENTITY(1,1) NOT NULL,
	[strActivityName] [nvarchar](100) NOT NULL,
	[strDescription] [nvarchar](200) NULL,
	[decMET] [decimal](18, 2) NULL,
	[dtModifiedOn] [datetime] NOT NULL,
	[strModifiedBy] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_tbl_METActivity] PRIMARY KEY CLUSTERED 
(
	[intActivityTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tbl_Library]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Library]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_Library](
	[intLibraryId] [int] IDENTITY(1,1) NOT NULL,
	[strTitle] [varchar](100) NOT NULL,
	[strDescription] [ntext] NOT NULL,
	[strCategory] [varchar](50) NULL,
	[strLocation] [varchar](50) NULL,
	[strLocationType] [varchar](50) NULL,
	[dtLibraryDate] [datetime] NULL,
	[dtCreatedDate] [datetime] NOT NULL,
	[chrIsActive] [char](1) NULL,
	[chrIsDeleted] [char](1) NULL,
	[dtDeletedDate] [datetime] NULL,
	[dtModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_Library] PRIMARY KEY CLUSTERED 
(
	[intLibraryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tbl_Library', N'COLUMN',N'strLocation'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'File Name, websitelink etc..' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Library', @level2type=N'COLUMN',@level2name=N'strLocation'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tbl_Library', N'COLUMN',N'strLocationType'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Video, PDF, Website etc..' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Library', @level2type=N'COLUMN',@level2name=N'strLocationType'
GO
/****** Object:  Table [dbo].[tbl_HotSectionDetails]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_HotSectionDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_HotSectionDetails](
	[intHotSectionId] [int] IDENTITY(1,1) NOT NULL,
	[strHeading] [nvarchar](500) NOT NULL,
	[strDescription] [ntext] NULL,
	[strLink] [nvarchar](500) NULL,
	[chrIsDeleted] [char](1) NOT NULL,
	[dtCreatedOn] [datetime] NOT NULL,
	[dtDeletedOn] [datetime] NULL,
	[chrDisplayOnDashboard] [char](1) NOT NULL,
	[guidUserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_tbl_HotSectionDetails] PRIMARY KEY CLUSTERED 
(
	[intHotSectionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_GlobalCodes]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_GlobalCodes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_GlobalCodes](
	[intGlobalCodesId] [int] IDENTITY(1,1) NOT NULL,
	[strGlobalCodeCategory] [varchar](50) NULL,
	[strHeading] [nvarchar](50) NULL,
	[strValue] [nvarchar](200) NULL,
	[strValueCode] [nvarchar](10) NULL,
	[chrisActive] [char](1) NULL,
 CONSTRAINT [PK_tbl_GlobalCodes] PRIMARY KEY CLUSTERED 
(
	[intGlobalCodesId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_FoodIntakeLog]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_FoodIntakeLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_FoodIntakeLog](
	[intFoodIntakeLogId] [int] IDENTITY(1,1) NOT NULL,
	[strUserId] [nvarchar](500) NULL,
	[dtFoodIntakeDate] [datetime] NULL,
	[intCalorie] [int] NULL,
	[strMilkDetails] [nvarchar](100) NULL,
	[strFruitDetails] [nvarchar](100) NULL,
	[strVegetablesDetails] [nvarchar](100) NULL,
	[strStarchDetails] [nvarchar](100) NULL,
	[strProteinDetails] [nvarchar](100) NULL,
	[strFATDetails] [nvarchar](100) NULL,
	[strWaterDetails] [nvarchar](100) NULL,
	[chrIsDeleted] [char](1) NULL,
	[dtDeletedOn] [datetime] NULL,
	[dtCreatedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_FoodIntakeLog] PRIMARY KEY CLUSTERED 
(
	[intFoodIntakeLogId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_FoodExchangeChart]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_FoodExchangeChart]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_FoodExchangeChart](
	[intFoodExchangeChartId] [int] IDENTITY(1,1) NOT NULL,
	[intCalories] [int] NOT NULL,
	[intMilk] [int] NOT NULL,
	[intFruit] [int] NOT NULL,
	[intVegetable] [int] NOT NULL,
	[intStarch] [int] NOT NULL,
	[intProtein] [int] NOT NULL,
	[intFat] [int] NOT NULL,
	[dtModifiedOn] [datetime] NOT NULL,
	[strModifiedBy] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_tbl_FoodExchangeChart] PRIMARY KEY CLUSTERED 
(
	[intFoodExchangeChartId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tbl_FaqTopic]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_FaqTopic]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_FaqTopic](
	[int_FAQTopicId] [int] IDENTITY(1,1) NOT NULL,
	[strFaqTopic] [nvarchar](200) NOT NULL,
	[dtCreatedOn] [datetime] NOT NULL,
	[strCreatedBy] [nvarchar](200) NOT NULL,
	[chrIsDeleted] [char](1) NOT NULL,
	[dtDeletedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_FaqTopic] PRIMARY KEY CLUSTERED 
(
	[int_FAQTopicId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_FAQ]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_FAQ]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_FAQ](
	[intFAQId] [int] IDENTITY(1,1) NOT NULL,
	[intQuestionId] [int] NOT NULL,
	[strHeading] [nvarchar](200) NOT NULL,
	[strQuestion] [nvarchar](500) NOT NULL,
	[strAnswer] [nvarchar](500) NOT NULL,
	[chrUserType] [char](1) NOT NULL,
	[dtCreatedOn] [datetime] NOT NULL,
	[strUserId] [nvarchar](250) NOT NULL,
	[chrisDeleted] [char](1) NOT NULL,
	[dtDeletedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_FAQ] PRIMARY KEY CLUSTERED 
(
	[intFAQId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Events]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Events]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_Events](
	[intEventsId] [int] IDENTITY(1,1) NOT NULL,
	[strUserName] [varchar](100) NOT NULL,
	[dtEventDate] [datetime] NOT NULL,
	[strActivity] [varchar](100) NULL,
	[strLocation] [varchar](50) NULL,
	[strComments] [varchar](200) NULL,
	[chrStatus] [char](1) NOT NULL,
	[chrIsActive] [char](1) NULL,
	[dtCreatedOn] [datetime] NULL,
	[chrIsDeleted] [char](1) NULL,
	[dtDeletedOn] [datetime] NULL,
	[dtModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_Events] PRIMARY KEY CLUSTERED 
(
	[intEventsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ContentPages]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ContentPages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_ContentPages](
	[intContentPagesId] [int] IDENTITY(1,1) NOT NULL,
	[strPageName] [varchar](100) NULL,
	[strDefaultName] [varchar](100) NULL,
	[intTemplateType] [int] NULL,
	[intModifiedBy] [int] NULL,
	[TextAreaHTML] [text] NOT NULL,
	[dtModifedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_ContentPages] PRIMARY KEY CLUSTERED 
(
	[intContentPagesId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_CompanyRequestedUsersList]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_CompanyRequestedUsersList]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_CompanyRequestedUsersList](
	[intCompanyRequestedUsersListId] [int] IDENTITY(1,1) NOT NULL,
	[intCompanyId] [int] NOT NULL,
	[strEmpCode] [nvarchar](50) NOT NULL,
	[strEmpFirstName] [varchar](50) NOT NULL,
	[strEmpMiddleName] [nvarchar](10) NULL,
	[strEmpLastName] [nvarchar](50) NULL,
	[strEmployeeAddress] [nvarchar](50) NULL,
	[dtEmpDateofBirth] [datetime] NOT NULL,
	[strEmpEmail] [nvarchar](150) NULL,
	[strEmpRelationShipCode] [nvarchar](50) NULL,
	[strEmpFamilyStatus] [nvarchar](50) NULL,
	[strEmpGender] [nvarchar](50) NULL,
	[strEmpPhoneORCell] [nvarchar](50) NULL,
	[chrStatus] [char](1) NULL,
	[dtCreatedDate] [datetime] NULL,
	[dtModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_CompanyRequestedUsersList] PRIMARY KEY CLUSTERED 
(
	[intCompanyRequestedUsersListId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tbl_CompanyRequestedUsersList', N'COLUMN',N'chrStatus'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'I = InProcess , S = Request Sent, D = Disapproved, L = User created his username and pwd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_CompanyRequestedUsersList', @level2type=N'COLUMN',@level2name=N'chrStatus'
GO
/****** Object:  Table [dbo].[tbl_CompanyInfo]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_CompanyInfo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_CompanyInfo](
	[intCompanyId] [int] IDENTITY(1,1) NOT NULL,
	[strUserID] [uniqueidentifier] NULL,
	[strCompanyEmail] [varchar](200) NULL,
	[strPassword] [varchar](200) NULL,
	[strCompanyName] [varchar](100) NULL,
	[strCompanyPhone] [varchar](20) NULL,
	[strCompanyFax] [varchar](20) NULL,
	[intCountryId] [int] NULL,
	[intStateId] [int] NULL,
	[strStateText] [varchar](100) NULL,
	[strCity] [varchar](50) NULL,
	[strCompanyAddress] [varchar](300) NULL,
	[chrIsPaid] [char](1) NOT NULL,
	[chrIsActive] [char](1) NULL,
	[chrIsApproved] [char](1) NULL,
	[dtCreatedDate] [datetime] NULL,
	[dtModifiedDate] [datetime] NULL,
	[chrIsDeleted] [char](1) NULL,
	[chrCreatedBy] [char](1) NULL,
	[strZipCode] [nvarchar](15) NULL,
 CONSTRAINT [PK_tbl_CompanyInfo] PRIMARY KEY CLUSTERED 
(
	[intCompanyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tbl_CompanyInfo', N'COLUMN',N'chrIsActive'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Y=Active, N = InActive, D = Disapprove' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_CompanyInfo', @level2type=N'COLUMN',@level2name=N'chrIsActive'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tbl_CompanyInfo', N'COLUMN',N'chrCreatedBy'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'C=Company, A = Admin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_CompanyInfo', @level2type=N'COLUMN',@level2name=N'chrCreatedBy'
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Setup_RestorePermissions]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + '' '' + @action + '' on '' + @object + '' TO ['' + @grantee + '']''
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Setup_RemoveAllRoleMembers]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = ''EXEC sp_droprolemember '' + '''''''' + @name + '''''', '''''' + USER_NAME(@user_id) + ''''''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END' 
END
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_SchemaVersions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ForumPersonalMessages]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ForumPersonalMessages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ForumPersonalMessages](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[MessageGroupID] [int] NULL,
	[FromUserID] [uniqueidentifier] NOT NULL,
	[ToUserID] [uniqueidentifier] NOT NULL,
	[Subject] [varchar](255) NOT NULL,
	[Body] [ntext] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[New] [bit] NOT NULL,
	[ArchiveFlg] [int] NOT NULL,
 CONSTRAINT [PK__ForumPersonalMes__208CD6FA] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ForumAdministrators]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ForumAdministrators]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ForumAdministrators](
	[UserID] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DD_AUTOFILL]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DD_AUTOFILL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DD_AUTOFILL](
	[CALORIE_ID] [int] NOT NULL,
	[CALORIE_NUMBER] [int] NOT NULL,
	[FIELD_01] [int] NOT NULL,
	[FIELD_02] [int] NOT NULL,
	[FIELD_03] [int] NOT NULL,
	[FIELD_04] [int] NOT NULL,
	[FIELD_05] [int] NOT NULL,
	[FIELD_06] [int] NOT NULL,
	[FIELD_07] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[spCrp_UPDATE_CorpTemplates]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCrp_UPDATE_CorpTemplates]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spCrp_UPDATE_CorpTemplates]
@TEMPLATE_ID varchar(100),
@TEMPLATE_TEXT text

AS


declare @now datetime
set @now = getdate()

UPDATE CORP_TEMPLATES 
SET
	 TEMPLATE_TEXT = @TEMPLATE_TEXT, 
	 DATE_MODIFIED=@now
WHERE
TEMPLATE_ID=@TEMPLATE_ID 


SELECT *
FROM CORP_TEMPLATES 
WHERE TEMPLATE_ID = @TEMPLATE_ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[spCrp_GET_CorpTemplates_BY_TemplateId]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCrp_GET_CorpTemplates_BY_TemplateId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spCrp_GET_CorpTemplates_BY_TemplateId]
@TEMPLATE_ID VARCHAR(100)
AS

	SELECT *
	FROM CORP_TEMPLATES 
	WHERE TEMPLATE_ID = @TEMPLATE_ID' 
END
GO
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_WebEvent_Events]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Applications]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Applications]') AND name = N'aspnet_Applications_Index')
CREATE CLUSTERED INDEX [aspnet_Applications_Index] ON [dbo].[aspnet_Applications] 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACCOUNTS]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ACCOUNTS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ACCOUNTS](
	[ACCOUNT_ID] [int] NOT NULL,
	[ACCOUNT_NAME] [varchar](255) NOT NULL,
	[ACCOUNT_ADDRESS_1] [varchar](50) NOT NULL,
	[ACCOUNT_ADDRESS_2] [varchar](50) NOT NULL,
	[ACCOUNT_CITY] [varchar](50) NOT NULL,
	[ACCOUNT_STATE] [varchar](2) NOT NULL,
	[ACCOUNT_ZIP] [varchar](15) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ACCOUNT_USERS]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ACCOUNT_USERS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ACCOUNT_USERS](
	[ACCOUNT_ID] [int] NOT NULL,
	[USER_ID] [uniqueidentifier] NOT NULL,
	[USER_TYPE_ID] [int] NULL,
	[DELETE_FLG] [int] NOT NULL,
	[DATE_CREATED] [datetime] NOT NULL,
	[DATE_MODIFIED] [datetime] NOT NULL,
 CONSTRAINT [PK_ACCOUNT_USERS] PRIMARY KEY CLUSTERED 
(
	[ACCOUNT_ID] ASC,
	[USER_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ACCOUNT_USER_TYPES]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ACCOUNT_USER_TYPES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ACCOUNT_USER_TYPES](
	[USER_TYPE_ID] [int] NOT NULL,
	[USER_TYPE_NAME] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Paths]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Paths]') AND name = N'aspnet_Paths_index')
CREATE UNIQUE CLUSTERED INDEX [aspnet_Paths_index] ON [dbo].[aspnet_Paths] 
(
	[ApplicationId] ASC,
	[LoweredPath] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Personalization_GetApplicationId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_CheckSchemaVersion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Applications_CreateApplication]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_WebEvent_LogEvent]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END' 
END
GO
/****** Object:  Table [dbo].[Forums]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Forums]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Forums](
	[ForumID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[Premoderated] [bit] NOT NULL,
	[GroupID] [int] NOT NULL,
	[MembersOnly] [bit] NOT NULL,
	[OrderByNumber] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ForumID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Users]') AND name = N'aspnet_Users_Index')
CREATE UNIQUE CLUSTERED INDEX [aspnet_Users_Index] ON [dbo].[aspnet_Users] 
(
	[ApplicationId] ASC,
	[LoweredUserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Users]') AND name = N'aspnet_Users_Index2')
CREATE NONCLUSTERED INDEX [aspnet_Users_Index2] ON [dbo].[aspnet_Users] 
(
	[ApplicationId] ASC,
	[LastActivityDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UnRegisterSchemaVersion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END' 
END
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles]') AND name = N'aspnet_Roles_index1')
CREATE UNIQUE CLUSTERED INDEX [aspnet_Roles_index1] ON [dbo].[aspnet_Roles] 
(
	[ApplicationId] ASC,
	[LoweredRoleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_RegisterSchemaVersion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[spValidateInviteId]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spValidateInviteId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =========================================================
-- Author:		David K. Bowers
-- Create date: 04/11/2012
-- Description:	Checks whether an company invite id is valid
-- =========================================================
CREATE PROCEDURE [dbo].[spValidateInviteId] 
	-- Add the parameters for the stored procedure here
	@iid int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if exists(SELECT * FROM dbo.tbl_CompanyRequestedUsersList WHERE dbo.tbl_CompanyRequestedUsersList.intCompanyRequestedUsersListId=@iid)
	    return 1;
	else
		return 0;
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spValidateInviteEmailAddress]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spValidateInviteEmailAddress]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		David K. Bowers
-- Create date: 04/11/2012
-- Description:	Checks whether an invite email is valid
-- =============================================
CREATE PROCEDURE [dbo].[spValidateInviteEmailAddress] 
	-- Add the parameters for the stored procedure here
	@email nvarchar(150) = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if exists(SELECT * FROM dbo.tbl_CompanyRequestedUsersList WHERE dbo.tbl_CompanyRequestedUsersList.strEmpEmail=@email)
	    return 1;
	else
		return 0;
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spTxA_UPDATE_TextAreas_IsPreview]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spTxA_UPDATE_TextAreas_IsPreview]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spTxA_UPDATE_TextAreas_IsPreview]
@TextAreaId varchar(100),
@IsPreview varchar(10)
AS

declare @now datetime
set @now = getdate()


	UPDATE TextAreas 
	SET
		 IsPreview = @IsPreview, 
		 DateModified = @now
	WHERE
	TextAreaId=@TextAreaId 



SELECT *
FROM TextAreas WHERE
TextAreaId = @TextAreaId ' 
END
GO
/****** Object:  StoredProcedure [dbo].[spTxA_UPDATE_TextAreas]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spTxA_UPDATE_TextAreas]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spTxA_UPDATE_TextAreas]
@TextAreaId varchar(100),
@TextAreaHTML text
AS

declare @now datetime
set @now = getdate()


	UPDATE TextAreas 
	SET
		 TextAreaHTML = @TextAreaHTML, 
		 DateModified = @now
	WHERE
	TextAreaId=@TextAreaId 



SELECT *
FROM TextAreas WHERE
TextAreaId = @TextAreaId ' 
END
GO
/****** Object:  StoredProcedure [dbo].[spTxA_INSERT_TextAreas]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spTxA_INSERT_TextAreas]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spTxA_INSERT_TextAreas]
@TextAreaName varchar(100),
@isPreview varchar(10),
@TextAreaHTML text
AS

declare @nextid int
select @nextid= COUNT(TextAreaId)+1 FROM TextAreas
if @nextid > 1
select @nextid= MAX(TextAreaId)+1 FROM TextAreas

declare @TextAreaIndex int
select @TextAreaIndex= COUNT(TextAreaIndex)+1 FROM TextAreas WHERE TextAreaName = @TextAreaName
if @TextAreaIndex > 1
select @TextAreaIndex= MAX(TextAreaIndex)+1 FROM TextAreas WHERE TextAreaName = @TextAreaName

declare @now datetime
set @now = getdate()

INSERT INTO TextAreas
(
TextAreaId,TextAreaName,TextAreaIndex,isPreview,TextAreaHTML,DateModified

)
VALUES
(
@nextid,@TextAreaName,@TextAreaIndex,@isPreview,@TextAreaHTML,@now
)


SELECT *
FROM TextAreas
WHERE TextAreaName = @TextAreaName' 
END
GO
/****** Object:  StoredProcedure [dbo].[spPrg_GET_ProgramsExercises_BY_ProgramSeries]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPrg_GET_ProgramsExercises_BY_ProgramSeries]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spPrg_GET_ProgramsExercises_BY_ProgramSeries]
@Program_Series varchar(100)
AS

SELECT *
FROM PROGRAM_EXERCISES 
WHERE Program_Series=@Program_Series

' 
END
GO
/****** Object:  StoredProcedure [dbo].[spPrg_GET_ProgramsExercises_BY_ProgramId]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPrg_GET_ProgramsExercises_BY_ProgramId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spPrg_GET_ProgramsExercises_BY_ProgramId]
@Program_ID varchar(100)
AS

SELECT *
FROM PROGRAM_EXERCISES 
WHERE Program_ID=@Program_ID

' 
END
GO
/****** Object:  StoredProcedure [dbo].[spPrg_GET_Programs_BY_ProgramId]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPrg_GET_Programs_BY_ProgramId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spPrg_GET_Programs_BY_ProgramId]
@PROGRAM_ID varchar(100)
AS

SELECT *
FROM PROGRAMS 
WHERE PROGRAM_ID=@PROGRAM_ID

' 
END
GO
/****** Object:  StoredProcedure [dbo].[spPrg_GET_Programs_BY_LevelId]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPrg_GET_Programs_BY_LevelId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spPrg_GET_Programs_BY_LevelId]
@LEVEL_ID varchar(100)
AS

SELECT *
FROM PROGRAMS 
WHERE LEVEL_ID=@LEVEL_ID
AND DELETE_FLG=0 

' 
END
GO
/****** Object:  StoredProcedure [dbo].[spMem_INSERT_UserAssessments]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spMem_INSERT_UserAssessments]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spMem_INSERT_UserAssessments]
@USER_ID varchar(100),
@LEVEL_ID varchar(100),
@ASSESSMENT_SCORE varchar(100)
AS

declare @nextid int
select @nextid= COUNT(ASSESSMENT_ID)+1 FROM USER_ASSESSMENTS
if @nextid > 1
select @nextid= MAX(ASSESSMENT_ID)+1 FROM USER_ASSESSMENTS

declare @now datetime
set @now = getdate()

INSERT INTO USER_ASSESSMENTS
(ASSESSMENT_ID,USER_ID,LEVEL_ID,ASSESSMENT_SCORE,DELETE_FLG,DATE_CREATED)
VALUES
(@nextid,@USER_ID,@LEVEL_ID,@ASSESSMENT_SCORE,0,@now)

select *
from USER_ASSESSMENTS
where ASSESSMENT_ID=@nextid' 
END
GO
/****** Object:  StoredProcedure [dbo].[spLst_GET_ListTabs]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spLst_GET_ListTabs]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spLst_GET_ListTabs]
@LIST_NAME varchar(255)
AS

SELECT *
FROM LIST_TABS
WHERE LIST_NAME=@LIST_NAME
ORDER BY DISPLAY_ORDER
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spGetInvite]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetInvite]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		spGetInviteEmail
-- Create date: 04/11/2012
-- Description:	Return invite record for an email address
-- =============================================
CREATE PROCEDURE [dbo].[spGetInvite] 
	-- Add the parameters for the stored procedure here
	@email nvarchar(150) = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.tbl_CompanyRequestedUsersList WHERE dbo.tbl_CompanyRequestedUsersList.strEmpEmail=@email;

END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spFum_UPDATE_ForumPersonalMessages_BY_MessageGroupID]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spFum_UPDATE_ForumPersonalMessages_BY_MessageGroupID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spFum_UPDATE_ForumPersonalMessages_BY_MessageGroupID]
@MessageGroupID varchar(100),
@ArchiveFlg varchar(100)
AS

UPDATE ForumPersonalMessages SET ArchiveFlg = @ArchiveFlg WHERE MessageGroupID = @MessageGroupID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spFum_INSERT_ForumPersonalMessages]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spFum_INSERT_ForumPersonalMessages]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spFum_INSERT_ForumPersonalMessages]
@MessageGroupID varchar(100),
@FromUserID varchar(100),
@ToUserID varchar(100),
@Body text
AS

declare @CreationDate datetime
set @CreationDate = getdate()

declare @MessageID int
select @MessageID= COUNT(MessageID)+1 FROM ForumPersonalMessages
if @MessageID > 1
select @MessageID= MAX(MessageID)+1 FROM ForumPersonalMessages

if not(@MessageGroupID = '''')
begin
	select @MessageGroupID= COUNT(MessageGroupID)+1 FROM ForumPersonalMessages
	if @MessageGroupID > 1
	select @MessageGroupID= MAX(MessageGroupID)+1 FROM ForumPersonalMessages
end


INSERT INTO ForumPersonalMessages
(
MessageID,MessageGroupID,FromUserID,ToUserID,Body,CreationDate
)
VALUES
(
@MessageID,@MessageGroupID,@FromUserID,@ToUserID,@Body,@CreationDate
)

SELECT *
FROM ForumPersonalMessages
WHERE MessageID=@MessageID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spFum_GET_ForumPersonalMessages_BY_UserId]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spFum_GET_ForumPersonalMessages_BY_UserId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spFum_GET_ForumPersonalMessages_BY_UserId]
@USER_ID VARCHAR(100),
@New VARCHAR(100)
AS

SELECT * FROM ForumPersonalMessages 
WHERE ToUserID=@USER_ID AND New=@New' 
END
GO
/****** Object:  StoredProcedure [dbo].[spMem_GET_UserAssessments_BY_UserId]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spMem_GET_UserAssessments_BY_UserId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spMem_GET_UserAssessments_BY_UserId]
@USER_ID VARCHAR(100)
AS


		SELECT *
		FROM USER_ASSESSMENTS
		WHERE USER_ID=@USER_ID
		ORDER BY DATE_CREATED DESC' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_INSERT_Visitlog]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_INSERT_Visitlog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_INSERT_Visitlog]
@AGENT varchar(255),
@VISITIP char(20)
AS
declare @nextid int
select @nextid= COUNT(VISIT_ID)+1 FROM VISITLOG
if @nextid > 1
select @nextid= MAX(VISIT_ID)+1 FROM VISITLOG

declare @userid uniqueidentifier
set @userid=''00000000-0000-0000-0000-000000000000''

INSERT INTO VISITLOG
(VISIT_ID,DATE,AGENT,VISIT_IP,USER_ID)
VALUES
(@nextid,getdate(),@AGENT,@VISITIP,@userid)

select VISIT_ID=@nextid
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GET_VisitlogLegend]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GET_VisitlogLegend]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GET_VisitlogLegend]
@A int,
@B int,
@C int,
@D int
AS
SELECT *
FROM VISITLOG_LEGEND
WHERE A=@A
AND B=@B
AND C=@C
AND D=@D
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GET_VisitlogAction_BY_VisitID]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GET_VisitlogAction_BY_VisitID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GET_VisitlogAction_BY_VisitID]
@VISITID int
AS
SELECT *
FROM VISITLOG_ACTION
WHERE VISIT_ID=@VISITID
ORDER BY [Date] asc
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GET_Visitlog_BY_VisitID]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GET_Visitlog_BY_VisitID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GET_Visitlog_BY_VisitID]
@VISITID int
AS
SELECT *
FROM VISITLOG
WHERE VISIT_ID=@VISITID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GET_Visitlog_BY_Date]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GET_Visitlog_BY_Date]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GET_Visitlog_BY_Date]

@DATE_FROM datetime,
@DATE_TO datetime

AS

SELECT *, USERNAME=dbo.fnMEM_GET_UserName(USER_ID, '''')
FROM VISITLOG
WHERE ([DATE] between @DATE_FROM and @DATE_TO)
ORDER BY VISIT_ID desc



/*
-- this is code from 5/31 before the push to improve visit loggin

ALTER PROCEDURE [sp_GET_Visitlog_BY_Date]
@DATE_FROM datetime,
@DATE_TO datetime
AS
SELECT *
FROM VISITLOG
WHERE [DATE] between @DATE_FROM and @DATE_TO
ORDER BY VISIT_ID desc
*/
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_MultipleCMSPagesText]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Get_MultipleCMSPagesText]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Get_MultipleCMSPagesText]  
      
AS      
     
      SELECT *, 0 AS isPreview,intcontentpagesid AS TextAreaId      
FROM tbl_contentpages       
WHERE 1=1 
AND strpagename in ( ''TutorialsAndNavigation'' ,''GoalsObjectives'',''LevelOfIntensity'',''HowWeMeasure'',''NutritionCenter'',''PersonalFitness'',''WellnessDairy'',''WellnessDairyForum'')
 ' 
END
GO
/****** Object:  StoredProcedure [dbo].[ms_GetFoodExchangeChartByCalories]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ms_GetFoodExchangeChartByCalories]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--[ms_GetUserFavoriteNewsLEtters] ''admin@tlw.com'',''User''
CREATE PROCEDURE [dbo].[ms_GetFoodExchangeChartByCalories]
(
	@intCalories INT
)
AS
BEGIN 

DECLARE @intFoodExchangeID INT

	SET @intFoodExchangeID = (SELECT TOP 1 intFoodExchangeChartId FROM tbl_FoodExchangechart
				WHERE  
					  intCalories <= @intCalories AND @intCalories >= intCalories
					  order by intCalories desc)

IF(@intFoodExchangeID > 0)
	BEGIN
			SELECT TOP 1 intFoodExchangeChartId,intCalories,intMilk,intFruit,intVegetable,
				   intStarch,intProtein,intFat,dtModifiedOn,strModifiedBy, 8 AS intWater FROM tbl_FoodExchangechart
				WHERE  
					intFoodExchangeChartId = @intFoodExchangeID
	END
ELSE
	BEGIN
			SELECT 0 AS intFoodExchangeChartId,0 AS intCalories,0 AS intMilk,0 AS intFruit,0 AS intVegetable,
				   0 AS intStarch,0 AS intProtein,0 AS intFat,GETDATE() AS dtModifiedOn ,''admin@tlw.com'' AS strModifiedBy, 8 AS intWater 
	END
END
 ' 
END
GO
/****** Object:  StoredProcedure [dbo].[spAct_GET_Accounts_BY_UserId]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spAct_GET_Accounts_BY_UserId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spAct_GET_Accounts_BY_UserId]
@USER_ID varchar(100)
AS

SELECT *
FROM ACCOUNT_USERS AU
INNER JOIN ACCOUNTS A ON A.ACCOUNT_ID=AU.ACCOUNT_ID
INNER JOIN ACCOUNT_USER_TYPES AUT ON AUT.USER_TYPE_ID=AU.USER_TYPE_ID
WHERE AU.USER_ID=@USER_ID' 
END
GO
/****** Object:  Table [dbo].[ForumUsersInGroup]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ForumUsersInGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ForumUsersInGroup](
	[GroupID] [int] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__ForumUsersInGrou__2DE6D218] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[GroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[ms_GetUserFavoriteNewsLEtters]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ms_GetUserFavoriteNewsLEtters]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--[ms_GetUserFavoriteNewsLEtters] ''admin@tlw.com'',''User''
CREATE PROCEDURE [dbo].[ms_GetUserFavoriteNewsLEtters]
(
 @UserId NVARCHAR(256),
 @UserType	VARCHAR(15)
 )
 
AS
BEGIN   


SELECT uafd.strTitle AS strTitle, ''Remove from Favorite'' AS AddRemoveFromFavorite,
uafd.intFavoriteId AS IntNewsLetterId
 FROM tbl_UserFavoriteDetails uafd WHERE uafd.strUserId = @UserId AND uafd.strFavoriteType = ''Newsletter''
 UNION ALL
SELECT nl.strTitle AS strTitle,''Add to Favorite'' AS AddRemoveFromFavorite ,nl.intNewsLetterId AS IntNewsLetterId
FROM tbl_Newsletters nl WHERE 
nl.chrIsActive=''Y'' AND
nl.chrIsDeleted=''N'' AND
nl.intNewsLetterId NOT IN(
SELECT uaf.intFavoriteTypeId AS IntNewsLetterId
 FROM tbl_UserFavoriteDetails uaf WHERE uaf.strUserId = @UserId AND uaf.strFavoriteType = ''Newsletter'')
END
 ' 
END
GO
/****** Object:  StoredProcedure [dbo].[ms_GetUserFavoriteNewsAnnouncements]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ms_GetUserFavoriteNewsAnnouncements]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--[ms_GetUserFavoriteNewsLEtters] ''admin@tlw.com'',''User''
CREATE PROCEDURE [dbo].[ms_GetUserFavoriteNewsAnnouncements]
(
 @UserId NVARCHAR(256),
 @UserType	VARCHAR(15)
 )
 
AS
BEGIN   


SELECT uafd.strTitle AS strTitle, ''Remove from Favorite'' AS AddRemoveFromFavorite,
uafd.intFavoriteId AS IntNewsLetterId
 FROM tbl_UserFavoriteDetails uafd WHERE uafd.strUserId = @UserId AND uafd.strFavoriteType = ''NewsAnnouncements''
 UNION ALL
SELECT nl.strHeading AS strTitle,''Add to Favorite'' AS AddRemoveFromFavorite ,
nl.intNewsAnnouncementsId AS IntNewsLetterId
FROM tbl_NewsandAnnouncements nl WHERE 
nl.chrIsActive=''Y'' AND
nl.chrIsDelelte =''N'' AND
nl.intNewsAnnouncementsId NOT IN(
SELECT uaf.intFavoriteTypeId AS IntNewsLetterId
 FROM tbl_UserFavoriteDetails uaf WHERE uaf.strUserId = @UserId AND uaf.strFavoriteType = ''NewsAnnouncements'')
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[ms_GetUserFavoriteLibrary]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ms_GetUserFavoriteLibrary]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--[ms_GetUserFavoriteNewsLEtters] ''admin@tlw.com'',''User''
CREATE PROCEDURE [dbo].[ms_GetUserFavoriteLibrary]
(
 @UserId NVARCHAR(256),
 @UserType	VARCHAR(15)
 )
 
AS
BEGIN   


SELECT uafd.strTitle AS strTitle, ''Remove from Favorite'' AS AddRemoveFromFavorite,
uafd.intFavoriteId AS IntNewsLetterId
 FROM tbl_UserFavoriteDetails uafd WHERE uafd.strUserId = @UserId AND uafd.strFavoriteType = ''Library''
 UNION ALL
SELECT nl.strTitle AS strTitle,''Add to Favorite'' AS AddRemoveFromFavorite ,
nl.intLibraryId AS IntNewsLetterId
FROM tbl_Library nl WHERE 
nl.chrIsActive=''Y'' AND
nl.chrIsDeleted=''N'' AND
nl.intLibraryId NOT IN(
SELECT uaf.intFavoriteTypeId AS IntNewsLetterId
 FROM tbl_UserFavoriteDetails uaf WHERE uaf.strUserId = @UserId AND uaf.strFavoriteType = ''Library'')
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[ms_GetUserFavoriteEvents]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ms_GetUserFavoriteEvents]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--[ms_GetUserFavoriteNewsLEtters] ''admin@tlw.com'',''User''
CREATE PROCEDURE [dbo].[ms_GetUserFavoriteEvents]
(
 @UserId NVARCHAR(256),
 @UserType	VARCHAR(15)
 )
 
AS
BEGIN   


SELECT uafd.strTitle AS strTitle, ''Remove from Favorite'' AS AddRemoveFromFavorite,
uafd.intFavoriteId AS IntNewsLetterId
 FROM tbl_UserFavoriteDetails uafd WHERE uafd.strUserId = @UserId AND uafd.strFavoriteType = ''Event''
 UNION ALL
SELECT nl.strActivity AS strTitle,''Add to Favorite'' AS AddRemoveFromFavorite ,
nl.intEventsId AS IntNewsLetterId
FROM tbl_Events nl WHERE 
nl.chrIsActive=''Y'' AND
nl.chrIsDeleted=''N'' AND 
nl.intEventsId NOT IN(
SELECT uaf.intFavoriteTypeId AS IntNewsLetterId
 FROM tbl_UserFavoriteDetails uaf WHERE uaf.strUserId = @UserId AND uaf.strFavoriteType = ''Event'')
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[ms_GetTLWFormulaForIndividualReport]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ms_GetTLWFormulaForIndividualReport]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--[ms_GetUserFavoriteNewsLEtters] ''admin@tlw.com'',''User''
CREATE PROCEDURE [dbo].[ms_GetTLWFormulaForIndividualReport]
(
@strGender     VARCHAR(20),
@decWaist  DECIMAL(18,2),
@decBMI  DECIMAL(18,2),
@decBFATP  DECIMAL(18,2),
@decWtHeight DECIMAL(18,2),
@decWtHip DECIMAL(18,2),
@decWeight DECIMAL(18,2)
)
AS
BEGIN 

SELECT TRF.strRatioType ,TRF.strRatioCode,TRF.decFrom,TRF.decTo,
TRF.strLevelofRisk,TRF.dtModifiedOn FROM tbl_TLWRatioFormulas AS TRF
WHERE 
	TRF.chrIsDeleted=''N'' AND 
	TRF.strGender = @strGender AND	
	trf.strRatioCode = ''Waist'' AND
	(@decWaist BETWEEN TRF.decFrom AND TRF.decTo)
	
UNION ALL

SELECT TRF.strRatioType ,TRF.strRatioCode,TRF.decFrom,TRF.decTo,
TRF.strLevelofRisk,TRF.dtModifiedOn FROM tbl_TLWRatioFormulas AS TRF
WHERE 
	TRF.chrIsDeleted=''N'' AND 
	TRF.strGender = @strGender AND	
	trf.strRatioCode = ''BMI'' AND
	(@decBMI BETWEEN TRF.decFrom AND TRF.decTo)

UNION ALL

SELECT TRF.strRatioType ,TRF.strRatioCode,TRF.decFrom,TRF.decTo,
TRF.strLevelofRisk,TRF.dtModifiedOn FROM tbl_TLWRatioFormulas AS TRF
WHERE 
	TRF.chrIsDeleted=''N'' AND 
	TRF.strGender = @strGender AND	
	trf.strRatioCode = ''BFATP'' AND
	(@decBFATP BETWEEN TRF.decFrom AND TRF.decTo)
	
UNION ALL

SELECT TRF.strRatioType ,TRF.strRatioCode,TRF.decFrom,TRF.decTo,
TRF.strLevelofRisk,TRF.dtModifiedOn FROM tbl_TLWRatioFormulas AS TRF
WHERE 
	TRF.chrIsDeleted=''N'' AND 
	TRF.strGender = @strGender AND	
	trf.strRatioCode = ''WtHeight'' AND
	(@decWtHeight BETWEEN TRF.decFrom AND TRF.decTo)
	
UNION ALL

SELECT TRF.strRatioType ,TRF.strRatioCode,TRF.decFrom,TRF.decTo,
TRF.strLevelofRisk,TRF.dtModifiedOn FROM tbl_TLWRatioFormulas AS TRF
WHERE 
	TRF.chrIsDeleted=''N'' AND 
	TRF.strGender = @strGender AND	
	trf.strRatioCode = ''WtHip'' AND
	(@decWtHip BETWEEN TRF.decFrom AND TRF.decTo)
		UNION ALL

SELECT TRF.strRatioType ,TRF.strRatioCode,TRF.decFrom,TRF.decTo,
TRF.strLevelofRisk,TRF.dtModifiedOn FROM tbl_TLWRatioFormulas AS TRF
WHERE 
	TRF.chrIsDeleted=''N'' AND 
	TRF.strGender = @strGender AND	
	trf.strRatioCode = ''weight'' AND
	(@decWtHip BETWEEN TRF.decFrom AND TRF.decTo)
END
 ' 
END
GO
/****** Object:  Table [dbo].[tbl_TempProduct]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_TempProduct]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_TempProduct](
	[intTempProductId] [int] NOT NULL,
	[intCategoryId] [int] NULL,
	[strProductName] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[spTxA_DELETE_TextAreas_BT_TextAreaId]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spTxA_DELETE_TextAreas_BT_TextAreaId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spTxA_DELETE_TextAreas_BT_TextAreaId]
@TextAreaId varchar(100)
AS

DELETE
FROM TextAreas WHERE
TextAreaId = @TextAreaId ' 
END
GO
/****** Object:  StoredProcedure [dbo].[spTpl_UPDATE_Templates]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spTpl_UPDATE_Templates]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spTpl_UPDATE_Templates]
@TEMPLATE_ID varchar(100),
@TEMPLATE_TEXT text

AS


declare @now datetime
set @now = getdate()

UPDATE TEMPLATES 
SET
	 TEMPLATE_TEXT = @TEMPLATE_TEXT, 
	 DATE_MODIFIED=@now
WHERE
TEMPLATE_ID=@TEMPLATE_ID 


SELECT *
FROM TEMPLATES 
WHERE TEMPLATE_ID = @TEMPLATE_ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[spTpl_GET_Templates_BY_TemplateId]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spTpl_GET_Templates_BY_TemplateId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spTpl_GET_Templates_BY_TemplateId]
@TEMPLATE_ID VARCHAR(100)
AS

	SELECT *
	FROM TEMPLATES 
	WHERE TEMPLATE_ID = @TEMPLATE_ID' 
END
GO
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_Applications]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
  '
GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_Users]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
  '
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_Roles]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
  '
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_WebPartState_Paths]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
  '
GO
/****** Object:  StoredProcedure [dbo].[ms_GetTempCategory11]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ms_GetTempCategory11]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--[ms_GetUserFavoriteNewsLEtters] ''admin@tlw.com'',''User''
create PROCEDURE [dbo].[ms_GetTempCategory11]

AS
BEGIN   

select tCat.intTempCategoryId ,tCat.strCategoryName from tbl_TempCategory AS tCat

select * from tbl_TempProduct
END' 
END
GO
/****** Object:  Table [dbo].[ForumGroupPermissions]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ForumGroupPermissions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ForumGroupPermissions](
	[ForumID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
	[AllowReading] [bit] NOT NULL,
	[AllowPosting] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ForumID] ASC,
	[GroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles_CreateRole]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END' 
END
GO
/****** Object:  Table [dbo].[ForumTopics]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ForumTopics]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ForumTopics](
	[TopicID] [int] IDENTITY(1,1) NOT NULL,
	[ForumID] [int] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[Subject] [nvarchar](255) NOT NULL,
	[Visible] [bit] NOT NULL,
	[LastMessageID] [int] NOT NULL,
	[IsSticky] [int] NOT NULL,
	[IsClosed] [bit] NOT NULL,
	[ViewsCount] [int] NOT NULL,
	[RepliesCount] [int] NOT NULL,
 CONSTRAINT [PK__ForumTopics__14270015] PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[sp_INSERT_VisitlogAction]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_INSERT_VisitlogAction]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_INSERT_VisitlogAction]
@VISITID int,
@USERNAME varchar(255),
@A int,
@B int,
@C int,
@D int,
@PRIMARY varchar(1024),
@SECONDARY varchar(1024),
@COMMENT varchar(1024)
AS
declare @userid uniqueidentifier
IF (@USERNAME <> '''')
BEGIN
	select @userid = UserId from aspnet_Users where LoweredUserName = lower(@USERNAME)
	--this will update the VISITLOG with their userid if they ever log on
	--if (@A=1 and @B=0 and @C=0 and @D=0)
	--begin
		update VISITLOG
		set USER_ID = @userid
		where VISIT_ID = @VISITID
	--end
END
ELSE
BEGIN
	set @userid = ''00000000-0000-0000-0000-000000000000''
END
INSERT INTO VISITLOG_ACTION
(
VISIT_ID,USER_ID,DATE,A,B,C,D,[PRIMARY],SECONDARY,COMMENT
)
VALUES
(
@VISITID,@userid,getdate(),@A,@B,@C,@D,@PRIMARY,@SECONDARY,@COMMENT
)
' 
END
GO
/****** Object:  Table [dbo].[ForumSubforums]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ForumSubforums]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ForumSubforums](
	[ParentForumID] [int] NOT NULL,
	[SubForumID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ParentForumID] ASC,
	[SubForumID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles_RoleExists]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles_GetAllRoles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END' 
END
GO
/****** Object:  Table [dbo].[ForumNewTopicSubscriptions]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ForumNewTopicSubscriptions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ForumNewTopicSubscriptions](
	[UserID] [uniqueidentifier] NOT NULL,
	[ForumID] [int] NOT NULL,
 CONSTRAINT [PK__ForumNewTopicSub__2BFE89A6] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ForumID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ForumModerators]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ForumModerators]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ForumModerators](
	[UserID] [uniqueidentifier] NOT NULL,
	[ForumID] [int] NOT NULL,
 CONSTRAINT [PK__ForumModerators__2A164134] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ForumID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]') AND name = N'aspnet_UsersInRoles_index')
CREATE NONCLUSTERED INDEX [aspnet_UsersInRoles_index] ON [dbo].[aspnet_UsersInRoles] 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Users_CreateUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END' 
END
GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership]') AND name = N'aspnet_Membership_index')
CREATE CLUSTERED INDEX [aspnet_Membership_index] ON [dbo].[aspnet_Membership] 
(
	[ApplicationId] ASC,
	[LoweredEmail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Paths_CreatePath]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END' 
END
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]') AND name = N'aspnet_PersonalizationPerUser_index1')
CREATE UNIQUE CLUSTERED INDEX [aspnet_PersonalizationPerUser_index1] ON [dbo].[aspnet_PersonalizationPerUser] 
(
	[PathId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]') AND name = N'aspnet_PersonalizationPerUser_ncindex2')
CREATE UNIQUE NONCLUSTERED INDEX [aspnet_PersonalizationPerUser_ncindex2] ON [dbo].[aspnet_PersonalizationPerUser] 
(
	[UserId] ASC,
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 04/15/2012 19:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_ResetUserState]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_ResetSharedState]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_GetCountOfState]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_FindState]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_DeleteAllState]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_UpdateUserInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, ''17540101'', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, ''17540101'', 112 )
            SET @LastLockoutDate = CONVERT( datetime, ''17540101'', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_UpdateUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_UnlockUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, ''17540101'', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, ''17540101'', 112 ),
        LastLockoutDate = CONVERT( datetime, ''17540101'', 112 )
    WHERE @UserId = UserId

    RETURN 0
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_SetPassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_ResetPassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, ''17540101'', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetUserByUserId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetUserByName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, @CurrentTimeUtc, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetUserByEmail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetPasswordWithFormat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetPassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, ''17540101'', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetNumberOfUsersOnline]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetAllUsers]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_FindUsersByName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_FindUsersByEmail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_CreateUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, ''17540101'', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, ''17540101'', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, ''17540101'', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_AnyDataInTables]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''vw_aspnet_MembershipUsers'') AND (type = ''V''))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N''aspnet_Membership''
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''vw_aspnet_Roles'') AND (type = ''V''))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N''aspnet_Roles''
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''vw_aspnet_Profiles'') AND (type = ''V''))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N''aspnet_Profile''
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''vw_aspnet_WebPartState_User'') AND (type = ''V''))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N''aspnet_PersonalizationPerUser''
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''aspnet_WebEvent_LogEvent'') AND (type = ''P''))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N''aspnet_WebEvent_Events''
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N''aspnet_Users''
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N''aspnet_Applications''
            RETURN
        END
    END
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N'','', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'''', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N'','', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_IsUserInRole]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_GetUsersInRoles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_GetRolesForUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_FindUsersInRole]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_AddUsersToRoles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N'','', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N'','', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Users_DeleteUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''vw_aspnet_MembershipUsers'') AND (type = ''V''))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''vw_aspnet_UsersInRoles'') AND (type = ''V''))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''vw_aspnet_Profiles'') AND (type = ''V''))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''vw_aspnet_WebPartState_User'') AND (type = ''V''))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END' 
END
GO
/****** Object:  Table [dbo].[ForumMessages]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ForumMessages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ForumMessages](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[TopicID] [int] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[Body] [ntext] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[Visible] [bit] NOT NULL,
	[HelpfulCount] [int] NOT NULL,
	[TotalReviewsCount] [int] NOT NULL,
	[ReportMessageFLG] [nchar](10) NULL,
 CONSTRAINT [PK__ForumMessages__0A9D95DB] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ForumPolls]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ForumPolls]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ForumPolls](
	[PollID] [int] IDENTITY(1,1) NOT NULL,
	[TopicID] [int] NOT NULL,
	[Question] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__ForumPolls__25518C17] PRIMARY KEY CLUSTERED 
(
	[PollID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles_DeleteRole]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser_SetPageSettings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser_GetPageSettings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile_SetProperties]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile_GetProperties]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile_GetProfiles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[ms_UpdateUserINRoles]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ms_UpdateUserINRoles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ms_UpdateUserINRoles]
 @strUserEmail  varchar(250)
 
AS
BEGIN
DECLARE @USERID uniqueidentifier

set @USERID  = (select Top 1 UserId from aspnet_Users where UserName = @strUserEmail)

DECLARE @ROLEID uniqueidentifier

 set @ROLEID  = (SELECT top 1 roleid from aspnet_Roles where  RoleName = ''Company'')

insert into aspnet_UsersInRoles (UserId,RoleId) VALUES 
(@USERID  ,@ROLEID  )

UPDATE tbl_CompanyInfo 
set strUserID = @USERID
where strCompanyEmail = @strUserEmail

UPdate aspnet_Membership 
set IsApproved= 0
where Email =@strUserEmail

END
 ' 
END
GO
/****** Object:  Table [dbo].[ForumSubscriptions]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ForumSubscriptions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ForumSubscriptions](
	[UserID] [uniqueidentifier] NOT NULL,
	[TopicID] [int] NOT NULL,
 CONSTRAINT [PK__ForumSubscriptio__2B0A656D] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[TopicID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile_DeleteInactiveProfiles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END' 
END
GO
/****** Object:  Table [dbo].[USER_INFO]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USER_INFO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[USER_INFO](
	[USER_ID] [uniqueidentifier] NOT NULL,
	[intCompanyId] [int] NULL,
	[USER_GROUP_ID] [int] NOT NULL,
	[DELETE_FLG] [smallint] NOT NULL,
	[FNAME] [varchar](50) NOT NULL,
	[MNAME] [varchar](50) NOT NULL,
	[LNAME] [varchar](50) NOT NULL,
	[DEGREE_ID] [int] NOT NULL,
	[SPECIALTY] [varchar](255) NOT NULL,
	[AFFILIATION] [varchar](255) NOT NULL,
	[ADDRESS1] [varchar](255) NOT NULL,
	[ADDRESS2] [varchar](255) NOT NULL,
	[CITY] [varchar](100) NOT NULL,
	[STATE_ID] [int] NOT NULL,
	[STATE_TEXT] [varchar](255) NOT NULL,
	[ZIP] [varchar](20) NOT NULL,
	[COUNTRY_ID] [int] NOT NULL,
	[PHONE] [varchar](50) NOT NULL,
	[FAX] [varchar](50) NOT NULL,
	[ORGANIZATION] [varchar](255) NOT NULL,
	[IS_ACCREDITED] [int] NOT NULL,
	[RND_REG_CODE] [varchar](50) NOT NULL,
	[DATE_CREATED] [datetime] NOT NULL,
	[LAST_MODIFIED] [datetime] NOT NULL,
	[EMAIL_LIST_FLG] [int] NOT NULL,
	[YOUR_ROLE_ID] [int] NOT NULL,
	[HEIGHT] [int] NOT NULL,
	[GENDER_ID] [int] NOT NULL,
	[FAMILY_STATUS_ID] [int] NOT NULL,
	[DATE_BIRTH] [datetime] NOT NULL,
	[REGISTRATION_FLG] [int] NOT NULL,
	[ACCOUNT_CREDITS] [int] NOT NULL,
	[ACCOUNT_FROM] [uniqueidentifier] NULL,
	[ACCOUNT_FROM_RELATIONSHIP_ID] [int] NOT NULL,
	[strRiskStratificationProcessStep] [varchar](10) NULL,
 CONSTRAINT [PK_USER_INFO] PRIMARY KEY CLUSTERED 
(
	[USER_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'USER_ID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies a user on the system' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'USER_ID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'USER_GROUP_ID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Assigns a user to a specific group' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'USER_GROUP_ID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'DELETE_FLG'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0=Seen, 1=Hidden : Should only change in BO Users' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'DELETE_FLG'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'FNAME'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'First name of the user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'FNAME'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'MNAME'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Middle name of the user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'MNAME'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'LNAME'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Last name of the user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'LNAME'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'DEGREE_ID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FK LIST_ITEMS ITEM_ID (LIST_NAME=''Degree'')' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'DEGREE_ID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'SPECIALTY'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Specialty of a user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'SPECIALTY'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'AFFILIATION'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Affiliation of a user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'AFFILIATION'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'ADDRESS1'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Address line 1 of a user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'ADDRESS1'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'ADDRESS2'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Address line 2 of a user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'ADDRESS2'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'CITY'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'City of a user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'CITY'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'STATE_ID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FK LIST_STATECOUNTRY ITEM_ID (LIST_NAME=''State'')
Used if (COUNTRY_ID = 1 [USA] or 2 [Canada])' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'STATE_ID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'STATE_TEXT'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'State of a user.
if(COUNTRY_ID=1 [USA] or 2 [Canada])
Matches LIST_ITEMS ITEM_TEXT where ITEM_ID=this.STATE_ID (LIST_NAME=''State'')' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'STATE_TEXT'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'ZIP'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Zip of a user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'ZIP'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'COUNTRY_ID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FK LIST_STATECOUNTRY ITEM_ID (LIST_NAME=''Country'')' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'COUNTRY_ID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'PHONE'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Phone of a user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'PHONE'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'FAX'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fax of a user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'FAX'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'ORGANIZATION'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Organization of a user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'ORGANIZATION'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'IS_ACCREDITED'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'na' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'IS_ACCREDITED'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'RND_REG_CODE'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'na' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'RND_REG_CODE'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'DATE_CREATED'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date created' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'DATE_CREATED'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'LAST_MODIFIED'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date last modified' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'LAST_MODIFIED'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'EMAIL_LIST_FLG'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0=false, 1=true : User allows emails' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'EMAIL_LIST_FLG'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'YOUR_ROLE_ID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FK LIST_ITEMS ITEM_ID (LIST_NAME=''Role'')
na' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'YOUR_ROLE_ID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'HEIGHT'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Height of a user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'HEIGHT'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'REGISTRATION_FLG'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0=false, 1=true : Has user gone through registration process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'REGISTRATION_FLG'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'ACCOUNT_CREDITS'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'NoLonger Used' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'ACCOUNT_CREDITS'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'ACCOUNT_FROM'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'USER_ID of user who used their Account Credit on this user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'ACCOUNT_FROM'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USER_INFO', N'COLUMN',N'ACCOUNT_FROM_RELATIONSHIP_ID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relationship of user to ACCOUNT_FROM user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USER_INFO', @level2type=N'COLUMN',@level2name=N'ACCOUNT_FROM_RELATIONSHIP_ID'
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_WebPartState_User]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
  '
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_WebPartState_Shared]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
  '
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_UsersInRoles]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
  '
GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_Profiles]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
  '
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_MembershipUsers]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
  '
GO
/****** Object:  StoredProcedure [dbo].[spMem_GET_UserId]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spMem_GET_UserId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spMem_GET_UserId]
@USER_NAME varchar(1024)
AS
SELECT UserId
FROM aspnet_Membership
WHERE lower(@USER_NAME) = LoweredEmail
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spMem_UPDATE_UserInfo]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spMem_UPDATE_UserInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spMem_UPDATE_UserInfo]
@USERID uniqueidentifier,
@PASSWORD varchar(100),
@ISLOCKEDOUT varchar(10),
@USERNAME varchar(100),
@FNAME varchar(50),
@MNAME varchar(20) = null,
@LNAME varchar(50),
@DEGREE_ID varchar(20),
@SPECIALTY varchar(100),
@AFFILIATION varchar(100),
@ADDRESS1 varchar(255),
@ADDRESS2 varchar(255),
@CITY varchar(100),
@STATE_ID varchar(250),
@ZIP varchar(20),
@COUNTRY_ID varchar(250),
@PHONE varchar(20),
@FAX varchar(20),
@EMAIL_LIST_FLG varchar(10),
@YOUR_ROLE_ID varchar(100),
@STATE_TEXT varchar(255),
@HEIGHT varchar(255),
@REGISTRATION_FLG varchar(100),
@ACCOUNT_FROM_RELATIONSHIP_ID varchar(100),
@GENDER_ID varchar(100),
@FAMILY_STATUS_ID varchar(100),
@DATE_BIRTH varchar(100)

AS
--DECLARE @StateID int
--DECLARE @CountryID int
--select @StateID=ITEM_ID from LIST_STATECOUNTRY  where LIST_NAME=''STATE'' and  ITEM_VALUE=@State
--select @CountryID=ITEM_ID from LIST_STATECOUNTRY  where LIST_NAME=''COUNTRY'' and  ITEM_VALUE=@Country
if exists(SELECT USER_ID FROM USER_INFO WHERE USER_ID = @USERID)
BEGIN
UPDATE USER_INFO SET FNAME=@FNAME,MNAME=@MNAME,
LNAME=@LNAME, SPECIALTY=@SPECIALTY, AFFILIATION=@AFFILIATION,Address1=@Address1,
--Country_ID=@CountryID,STATE_ID=@StateID,
Country_ID=@COUNTRY_ID,STATE_ID=@STATE_ID,DEGREE_ID=@DEGREE_ID,
Address2=@Address2,City=@City,
Zip=@Zip,Phone=@phone,Fax=@Fax,EMAIL_LIST_FLG=@EMAIL_LIST_FLG,LAST_MODIFIED=getdate(),
YOUR_ROLE_ID=@YOUR_ROLE_ID,
STATE_TEXT=@STATE_TEXT,
HEIGHT=@HEIGHT,
REGISTRATION_FLG=@REGISTRATION_FLG,
ACCOUNT_FROM_RELATIONSHIP_ID=@ACCOUNT_FROM_RELATIONSHIP_ID,
GENDER_ID=@GENDER_ID,
FAMILY_STATUS_ID=@FAMILY_STATUS_ID,
DATE_BIRTH=@DATE_BIRTH
where USER_ID=@USERID

UPDATE aspnet_Users
SET UserName=@UserName, LoweredUserName=LOWER(@UserName)
where UserId=@USERID

UPDATE aspnet_Membership
SET Email=@UserName, LoweredEmail=LOWER(@UserName)
where UserId=@USERID


if (@PASSWORD <> '''')
begin
UPDATE aspnet_Membership
SET Password=@PASSWORD
where UserId=@USERID
end



if (@ISLOCKEDOUT <> '''')
begin
UPDATE aspnet_Membership
SET IsLockedOut=cast(@ISLOCKEDOUT as bit)
where UserId=@USERID
end



END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[spMem_INSERT_UserInfo]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spMem_INSERT_UserInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spMem_INSERT_UserInfo]        
        
@UserName varchar(100),        
@FName varchar(50),        
@MName varchar(20) = null,        
@LName varchar(50),        
@DEGREE_ID varchar(250),        
@Specialty varchar(100),        
@Affiliation varchar(100),        
@Address1 varchar(255),        
@Address2 varchar(255),        
@City varchar(100),        
@State varchar(250),        
@Zip varchar(9),        
@Country varchar(250),        
@phone varchar(50),        
@Fax varchar(50),        
@EmailList int,        
@CreationDate datetime,        
@RND_REG_CODE varchar(25),        
@ORGANIZATION varchar(255),        
@IS_ACCREDITED int,        
@YOUR_ROLE_ID varchar(255),        
@STATE_TEXT varchar(255),        
@REGISTRATION_FLG varchar(100),        
@ACCOUNT_CREDITS varchar(100),        
@ACCOUNT_FROM varchar(100),        
@ACCOUNT_FROM_RELATIONSHIP_ID varchar(100),        
@GENDER_ID varchar(100),        
@FAMILY_STATUS_ID varchar(100),        
@DATE_BIRTH varchar(100),        
@HEIGHT varchar(100)        
        
AS        
        BEGIN
        
DECLARE @NewUserId uniqueidentifier        
DECLARE @DegreeID int        
DECLARE @StateID int        
DECLARE @CountryID int        
        
SELECT @NewUserId = NULL        
SELECT @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName        
        
--select @DegreeID=ITEM_ID from List_Items where List_Name=''DEGREE'' and Item_Value=@Degree        
select @DegreeID=@DEGREE_ID        
select @StateID=ITEM_ID from List_StateCountry where List_Name=''STATE'' and ITEM_ID=@State        
select @CountryID=ITEM_ID from List_StateCountry where List_Name=''COUNTRY'' and ITEM_ID=@Country        
        
/*-----------------------------*/        
declare @NextUserGroupID int        
        
SELECT @NextUserGroupID = MAX(USER_GROUP_ID)        
FROM USER_INFO        
        
if (@NextUserGroupID >= 0)        
begin        
set @NextUserGroupID = @NextUserGroupID + 1        
end        
else        
begin        
set @NextUserGroupID = 1        
end        
        
/*print @NextCommentID*/        
/*--------------------------*/        
/*        
INSERT INTO User_Info(User_Id,USER_GROUP_ID,Delete_Flg,Fname,Mname,Lname,Degree_ID,SPECIALTY,Affiliation,        
Address1,Address2,City,State_ID,Zip,Country_ID,Phone,Fax,        
RND_REG_CODE,ORGANIZATION,IS_ACCREDITED,Email_List_Flg,Date_Created,Last_modified,YOUR_ROLE_ID,STATE_TEXT,        
REGISTRATION_FLG,ACCOUNT_CREDITS,ACCOUNT_FROM,ACCOUNT_FROM_RELATIONSHIP_ID,        
GENDER_ID,FAMILY_STATUS_ID,DATE_BIRTH,HEIGHT)        
        
VALUES (@NewUserId,@NextUserGroupID,0,@FName,@MName,@LName,@DegreeID,@Specialty,@Affiliation,        
@Address1,@Address2,@City,@StateID,@Zip,@CountryID,@phone,@Fax,        
@RND_REG_CODE,@ORGANIZATION,@IS_ACCREDITED,@EmailList,@CreationDate,@CreationDate,@YOUR_ROLE_ID,@STATE_TEXT,        
@REGISTRATION_FLG,@ACCOUNT_CREDITS,@ACCOUNT_FROM,@ACCOUNT_FROM_RELATIONSHIP_ID,        
@GENDER_ID,@FAMILY_STATUS_ID,@DATE_BIRTH,@HEIGHT)*/        
        
--select * from aspnet_Users au, USER_INFO ui where ui.USER_ID = au.u        
  
DECLARE @intCompanyId INT  
SET @intCompanyId = ISNULL((SELECT Top 1 intCompanyId FROM tbl_CompanyInfo WHERE strCompanyName = @ORGANIZATION),0)  
  
set @NewUserId  = (select Top 1 UserId from aspnet_Users where UserName = @UserName)      
INSERT INTO User_Info(User_Id,intCompanyId,USER_GROUP_ID,Delete_Flg,Fname,Mname,Lname,Degree_ID,SPECIALTY,Affiliation,        
Address1,Address2,City,State_ID,Zip,Country_ID,Phone,Fax,        
RND_REG_CODE,ORGANIZATION,IS_ACCREDITED,Email_List_Flg,Date_Created,Last_modified,YOUR_ROLE_ID,STATE_TEXT,        
REGISTRATION_FLG,ACCOUNT_CREDITS,ACCOUNT_FROM_RELATIONSHIP_ID,        
GENDER_ID,FAMILY_STATUS_ID,DATE_BIRTH,HEIGHT)        
        
VALUES (@NewUserId,@intCompanyId , @NextUserGroupID,0,@FName,@MName,@LName,@DegreeID,@Specialty,@Affiliation,        
@Address1,@Address2,@City,@StateID,@Zip,@CountryID,@phone,@Fax,        
@RND_REG_CODE,@ORGANIZATION,0,@EmailList,@CreationDate,@CreationDate,@YOUR_ROLE_ID,@STATE_TEXT,        
@REGISTRATION_FLG,@ACCOUNT_CREDITS     
,@ACCOUNT_FROM_RELATIONSHIP_ID,        
@GENDER_ID,@FAMILY_STATUS_ID,@DATE_BIRTH,@HEIGHT)    
    
DECLARE @ROLEID UNIQUEIDENTIFIER     
SET @ROLEID  =   (SELECT TOP 1 roleid FROM aspnet_Roles WHERE LoweredRoleName = ''user'')      
INSERT INTO aspnet_UsersInRoles (UserId,RoleId)      
 VALUES  (@NewUserId  ,@ROLEID)    
 UPDATE      
 aspnet_Membership SET IsApproved = 1 WHERE Email =@NewUserId
 
 
 END' 
END
GO
/****** Object:  View [dbo].[vw_BGT_Users]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_BGT_Users]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_BGT_Users]
AS
SELECT     dbo.aspnet_Membership.UserId, dbo.aspnet_Membership.Password, dbo.aspnet_Membership.Email, USER_INFO_1.LNAME, USER_INFO_1.FNAME, 
                      dbo.aspnet_Roles.RoleName, dbo.aspnet_Roles.RoleId, dbo.aspnet_Membership.IsApproved, dbo.aspnet_Membership.IsLockedOut, 
                      dbo.aspnet_Membership.LastLoginDate, dbo.aspnet_Membership.LastLockoutDate
FROM         dbo.USER_INFO AS USER_INFO_1 INNER JOIN
                      dbo.aspnet_Membership INNER JOIN
                      dbo.aspnet_Users ON dbo.aspnet_Membership.UserId = dbo.aspnet_Users.UserId INNER JOIN
                      dbo.aspnet_UsersInRoles ON dbo.aspnet_Users.UserId = dbo.aspnet_UsersInRoles.UserId INNER JOIN
                      dbo.aspnet_Roles ON dbo.aspnet_UsersInRoles.RoleId = dbo.aspnet_Roles.RoleId ON USER_INFO_1.USER_ID = dbo.aspnet_Membership.UserId
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'vw_BGT_Users', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "USER_INFO_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 298
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "aspnet_Membership"
            Begin Extent = 
               Top = 6
               Left = 336
               Bottom = 114
               Right = 627
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "aspnet_Users"
            Begin Extent = 
               Top = 6
               Left = 665
               Bottom = 114
               Right = 835
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "aspnet_UsersInRoles"
            Begin Extent = 
               Top = 6
               Left = 873
               Bottom = 84
               Right = 1024
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "aspnet_Roles"
            Begin Extent = 
               Top = 84
               Left = 873
               Bottom = 192
               Right = 1042
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_BGT_Users'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'dbo', N'VIEW',N'vw_BGT_Users', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'     Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_BGT_Users'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'vw_BGT_Users', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_BGT_Users'
GO
/****** Object:  View [dbo].[vwRpt_REPORT_OrganizationParticipants]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vwRpt_REPORT_OrganizationParticipants]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vwRpt_REPORT_OrganizationParticipants]
AS
SELECT DISTINCT ORGANIZATION,
                          (SELECT     COUNT(ORGANIZATION) AS Expr1
                            FROM          dbo.USER_INFO
                            WHERE      (ACCOUNT_FROM = USER_ID) AND (REGISTRATION_FLG = 1) AND (ORGANIZATION = UI.ORGANIZATION)) 
                      AS NUM_PARTICIPANTS_MAIN_REGISTERED,
                          (SELECT     COUNT(ORGANIZATION) AS Expr1
                            FROM          dbo.USER_INFO AS USER_INFO_2
                            WHERE      (ACCOUNT_FROM = USER_ID) AND (REGISTRATION_FLG = 0) AND (ORGANIZATION = UI.ORGANIZATION)) 
                      AS NUM_PARTICIPANTS_MAIN_UNREGISTERED,
                          (SELECT     COUNT(ORGANIZATION) AS Expr1
                            FROM          dbo.USER_INFO AS USER_INFO_1
                            WHERE      (ACCOUNT_FROM <> USER_ID) AND (REGISTRATION_FLG = 1) AND (ORGANIZATION = UI.ORGANIZATION)) 
                      AS NUM_PARTICIPANTS_EXTENDED_UNREGISTERED,
                          (SELECT     COUNT(ORGANIZATION) AS Expr1
                            FROM          dbo.USER_INFO AS USER_INFO_1
                            WHERE      (ACCOUNT_FROM <> USER_ID) AND (REGISTRATION_FLG = 0) AND (ORGANIZATION = UI.ORGANIZATION)) 
                      AS NUM_PARTICIPANTS_EXTENDED_REGISTERED
FROM         dbo.USER_INFO AS UI
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'vwRpt_REPORT_OrganizationParticipants', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[21] 2[15] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "UI"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 299
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 3210
         Width = 3420
         Width = 3795
         Width = 3585
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwRpt_REPORT_OrganizationParticipants'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'vwRpt_REPORT_OrganizationParticipants', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwRpt_REPORT_OrganizationParticipants'
GO
/****** Object:  View [dbo].[vwRpt_REPORT_AccountParticipants]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vwRpt_REPORT_AccountParticipants]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vwRpt_REPORT_AccountParticipants]
AS
SELECT     ACCOUNT_ID, ACCOUNT_NAME, ACCOUNT_ADDRESS_1, ACCOUNT_ADDRESS_2, ACCOUNT_CITY, ACCOUNT_STATE, ACCOUNT_ZIP,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.ACCOUNT_USERS AS AU
                            WHERE      (ACCOUNT_ID = dbo.ACCOUNTS.ACCOUNT_ID) AND EXISTS
                                                       (SELECT     USER_ID, USER_GROUP_ID, DELETE_FLG, FNAME, MNAME, LNAME, DEGREE_ID, SPECIALTY, AFFILIATION, ADDRESS1, 
                                                                                ADDRESS2, CITY, STATE_ID, STATE_TEXT, ZIP, COUNTRY_ID, PHONE, FAX, ORGANIZATION, IS_ACCREDITED, 
                                                                                RND_REG_CODE, DATE_CREATED, LAST_MODIFIED, EMAIL_LIST_FLG, YOUR_ROLE_ID, HEIGHT, GENDER_ID, 
                                                                                FAMILY_STATUS_ID, DATE_BIRTH, REGISTRATION_FLG, ACCOUNT_CREDITS, ACCOUNT_FROM, 
                                                                                ACCOUNT_FROM_RELATIONSHIP_ID
                                                         FROM          dbo.USER_INFO
                                                         WHERE      (USER_ID = AU.USER_ID) AND (ACCOUNT_FROM = USER_ID) AND (REGISTRATION_FLG = 1))) 
                      AS NUM_PARTICIPANTS_MAIN_REGISTERED,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.ACCOUNT_USERS AS AU
                            WHERE      (ACCOUNT_ID = dbo.ACCOUNTS.ACCOUNT_ID) AND EXISTS
                                                       (SELECT     USER_ID, USER_GROUP_ID, DELETE_FLG, FNAME, MNAME, LNAME, DEGREE_ID, SPECIALTY, AFFILIATION, ADDRESS1, 
                                                                                ADDRESS2, CITY, STATE_ID, STATE_TEXT, ZIP, COUNTRY_ID, PHONE, FAX, ORGANIZATION, IS_ACCREDITED, 
                                                                                RND_REG_CODE, DATE_CREATED, LAST_MODIFIED, EMAIL_LIST_FLG, YOUR_ROLE_ID, HEIGHT, GENDER_ID, 
                                                                                FAMILY_STATUS_ID, DATE_BIRTH, REGISTRATION_FLG, ACCOUNT_CREDITS, ACCOUNT_FROM, 
                                                                                ACCOUNT_FROM_RELATIONSHIP_ID
                                                         FROM          dbo.USER_INFO AS USER_INFO_3
                                                         WHERE      (USER_ID = AU.USER_ID) AND (ACCOUNT_FROM = USER_ID) AND (REGISTRATION_FLG = 0))) 
                      AS NUM_PARTICIPANTS_MAIN_UNREGISTERED,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.ACCOUNT_USERS AS AU
                            WHERE      (ACCOUNT_ID = dbo.ACCOUNTS.ACCOUNT_ID) AND EXISTS
                                                       (SELECT     USER_ID, USER_GROUP_ID, DELETE_FLG, FNAME, MNAME, LNAME, DEGREE_ID, SPECIALTY, AFFILIATION, ADDRESS1, 
                                                                                ADDRESS2, CITY, STATE_ID, STATE_TEXT, ZIP, COUNTRY_ID, PHONE, FAX, ORGANIZATION, IS_ACCREDITED, 
                                                                                RND_REG_CODE, DATE_CREATED, LAST_MODIFIED, EMAIL_LIST_FLG, YOUR_ROLE_ID, HEIGHT, GENDER_ID, 
                                                                                FAMILY_STATUS_ID, DATE_BIRTH, REGISTRATION_FLG, ACCOUNT_CREDITS, ACCOUNT_FROM, 
                                                                                ACCOUNT_FROM_RELATIONSHIP_ID
                                                         FROM          dbo.USER_INFO AS USER_INFO_2
                                                         WHERE      (USER_ID = AU.USER_ID) AND (ACCOUNT_FROM <> USER_ID) AND (REGISTRATION_FLG = 1))) 
                      AS NUM_PARTICIPANTS_EXTENDED_UNREGISTERED,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.ACCOUNT_USERS AS AU
                            WHERE      (ACCOUNT_ID = dbo.ACCOUNTS.ACCOUNT_ID) AND EXISTS
                                                       (SELECT     USER_ID, USER_GROUP_ID, DELETE_FLG, FNAME, MNAME, LNAME, DEGREE_ID, SPECIALTY, AFFILIATION, ADDRESS1, 
                                                                                ADDRESS2, CITY, STATE_ID, STATE_TEXT, ZIP, COUNTRY_ID, PHONE, FAX, ORGANIZATION, IS_ACCREDITED, 
                                                                                RND_REG_CODE, DATE_CREATED, LAST_MODIFIED, EMAIL_LIST_FLG, YOUR_ROLE_ID, HEIGHT, GENDER_ID, 
                                                                                FAMILY_STATUS_ID, DATE_BIRTH, REGISTRATION_FLG, ACCOUNT_CREDITS, ACCOUNT_FROM, 
                                                                                ACCOUNT_FROM_RELATIONSHIP_ID
                                                         FROM          dbo.USER_INFO AS USER_INFO_1
                                                         WHERE      (USER_ID = AU.USER_ID) AND (ACCOUNT_FROM <> USER_ID) AND (REGISTRATION_FLG = 0))) 
                      AS NUM_PARTICIPANTS_EXTENDED_REGISTERED
FROM         dbo.ACCOUNTS
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'vwRpt_REPORT_AccountParticipants', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[20] 4[12] 2[51] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ACCOUNTS"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwRpt_REPORT_AccountParticipants'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'vwRpt_REPORT_AccountParticipants', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwRpt_REPORT_AccountParticipants'
GO
/****** Object:  View [dbo].[vw_Forum_Users]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Forum_Users]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_Forum_Users]
AS
SELECT     dbo.ForumUsers.UserID, dbo.ForumUsers.UserName, dbo.ForumUserGroups.Title, dbo.ForumUserGroups.GroupID, 
                      dbo.ForumAdministrators.UserID AS Admin, dbo.aspnet_Membership.Password, dbo.USER_INFO.FNAME, dbo.USER_INFO.LNAME
FROM         dbo.aspnet_Membership INNER JOIN
                      dbo.ForumUsers ON dbo.aspnet_Membership.UserId = dbo.ForumUsers.UserID INNER JOIN
                      dbo.USER_INFO ON dbo.aspnet_Membership.UserId = dbo.USER_INFO.USER_ID LEFT OUTER JOIN
                      dbo.ForumAdministrators ON dbo.ForumUsers.UserID = dbo.ForumAdministrators.UserID CROSS JOIN
                      dbo.ForumUsersInGroup INNER JOIN
                      dbo.ForumUserGroups ON dbo.ForumUsersInGroup.GroupID = dbo.ForumUserGroups.GroupID
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'vw_Forum_Users', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ForumAdministrators"
            Begin Extent = 
               Top = 216
               Left = 600
               Bottom = 376
               Right = 751
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ForumUsers"
            Begin Extent = 
               Top = 6
               Left = 416
               Bottom = 240
               Right = 577
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ForumUsersInGroup"
            Begin Extent = 
               Top = 6
               Left = 615
               Bottom = 119
               Right = 766
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ForumUserGroups"
            Begin Extent = 
               Top = 6
               Left = 227
               Bottom = 84
               Right = 378
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "aspnet_Membership"
            Begin Extent = 
               Top = 11
               Left = 882
               Bottom = 119
               Right = 1173
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USER_INFO"
            Begin Extent = 
               Top = 209
               Left = 844
               Bottom = 360
               Right = 1104
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Forum_Users'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'dbo', N'VIEW',N'vw_Forum_Users', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Forum_Users'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'vw_Forum_Users', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Forum_Users'
GO
/****** Object:  Table [dbo].[ForumUploadedFiles]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ForumUploadedFiles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ForumUploadedFiles](
	[FileID] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](255) NOT NULL,
	[MessageID] [int] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__ForumUploadedFil__236943A5] PRIMARY KEY CLUSTERED 
(
	[FileID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PAL_STARTS]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PAL_STARTS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PAL_STARTS](
	[PAL_START_ID] [int] NOT NULL,
	[DELETE_FLG] [smallint] NOT NULL,
	[ACTIVE_FLG] [smallint] NOT NULL,
	[USER_ID] [uniqueidentifier] NOT NULL,
	[PROGRAM_ID] [int] NOT NULL,
	[COACH_ID] [varchar](50) NOT NULL,
	[PROGRAM_START_DATE] [datetime] NOT NULL,
	[PROGRAM_START_STEP] [int] NOT NULL,
	[PROGRAM_CURRENT_STEP] [int] NOT NULL,
	[PROGRAM_COMPLETION_FLG] [int] NOT NULL,
	[PROGRAM_COMPLETION_DATE] [datetime] NOT NULL,
	[DATE_CREATED] [datetime] NOT NULL,
	[DATE_MODIFIED] [datetime] NOT NULL,
 CONSTRAINT [PK_PAL_STARTS] PRIMARY KEY CLUSTERED 
(
	[PAL_START_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PAL_ENTRIES]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PAL_ENTRIES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PAL_ENTRIES](
	[PAL_ENTRY_ID] [int] NOT NULL,
	[DELETE_FLG] [smallint] NOT NULL,
	[USER_ID] [uniqueidentifier] NOT NULL,
	[PAL_ENTRY_DATE] [datetime] NOT NULL,
	[PAL_ENTRY_TYPE] [int] NOT NULL,
	[PAL_ENTRY_TIME] [int] NOT NULL,
	[PAL_ENTRY_DURATION] [int] NOT NULL,
	[PAL_ENTRY_INTENSITY] [int] NOT NULL,
	[PAL_ENTRY_WEIGHT] [varchar](100) NOT NULL,
	[PAL_ENTRY_COMMENT] [text] NOT NULL,
	[DATE_CREATED] [datetime] NOT NULL,
	[DATE_MODIFIED] [datetime] NOT NULL,
 CONSTRAINT [PK_PAL_ENTRIES] PRIMARY KEY CLUSTERED 
(
	[PAL_ENTRY_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[ms_DeleteUserDetails]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ms_DeleteUserDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ms_DeleteUserDetails]  
@USERNAME varchar(255),  
@REGISTRATION_FLG smallint,  
@DELETE_FLG smallint  
AS  
BEGIN

Declare @USERID uniqueidentifier  
select @USERID = UserId from aspnet_Membership where LoweredEmail = lower(@USERNAME)  
  
UPDATE USER_INFO  
SET DELETE_FLG=@DELETE_FLG  
WHERE USER_ID = @USERID  

UPDATE aspnet_Membership  
SET IsLockedOut=@DELETE_FLG  
WHERE UserId = @USERID  

END' 
END
GO
/****** Object:  StoredProcedure [dbo].[spMem_DELETE_UserInfo_032709]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spMem_DELETE_UserInfo_032709]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spMem_DELETE_UserInfo_032709]
@USERNAME varchar(255),
@DELETEFLG smallint
AS
Declare @USERID uniqueidentifier
select @USERID = UserId from aspnet_Membership where LoweredEmail = lower(@USERNAME)
UPDATE USER_INFO
SET DELETE_FLG=@DELETEFLG
WHERE USER_ID = @USERID
UPDATE aspnet_Membership
SET IsLockedOut=@DELETEFLG
WHERE UserId = @USERID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spMem_DELETE_UserInfo]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spMem_DELETE_UserInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spMem_DELETE_UserInfo]
@USERNAME varchar(255),
@REGISTRATION_FLG smallint,
@DELETE_FLG smallint
AS
Declare @USERID uniqueidentifier
select @USERID = UserId from aspnet_Membership where LoweredEmail = lower(@USERNAME)
/*
UPDATE USER_INFO
SET DELETE_FLG=@DELETEFLG
WHERE USER_ID = @USERID
*/

UPDATE USER_INFO
SET REGISTRATION_FLG=@REGISTRATION_FLG
WHERE USER_ID = @USERID
UPDATE aspnet_Membership
SET IsLockedOut=@DELETE_FLG
WHERE UserId = @USERID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spMem_INSERT_AdminUserInfo]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spMem_INSERT_AdminUserInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create PROCEDURE [dbo].[spMem_INSERT_AdminUserInfo]        
        
@UserName varchar(100),        
@FName varchar(50),        
@MName varchar(20) = null,        
@LName varchar(50),        
@DEGREE_ID varchar(250),        
@Specialty varchar(100),        
@Affiliation varchar(100),        
@Address1 varchar(255),        
@Address2 varchar(255),        
@City varchar(100),        
@State varchar(250),        
@Zip varchar(9),        
@Country varchar(250),        
@phone varchar(50),        
@Fax varchar(50),        
@EmailList int,        
@CreationDate datetime,        
@RND_REG_CODE varchar(25),        
@ORGANIZATION varchar(255),        
@IS_ACCREDITED int,        
@YOUR_ROLE_ID varchar(255),        
@STATE_TEXT varchar(255),        
@REGISTRATION_FLG varchar(100),        
@ACCOUNT_CREDITS varchar(100),        
@ACCOUNT_FROM varchar(100),        
@ACCOUNT_FROM_RELATIONSHIP_ID varchar(100),        
@GENDER_ID varchar(100),        
@FAMILY_STATUS_ID varchar(100),        
@DATE_BIRTH varchar(100),        
@HEIGHT varchar(100),
@AdminUserTypeId uniqueidentifier
        
AS        
        BEGIN
        
DECLARE @NewUserId uniqueidentifier        
DECLARE @DegreeID int        
DECLARE @StateID int        
DECLARE @CountryID int        
        
SELECT @NewUserId = NULL        
SELECT @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName        
        
--select @DegreeID=ITEM_ID from List_Items where List_Name=''DEGREE'' and Item_Value=@Degree        
select @DegreeID=@DEGREE_ID        
select @StateID=ITEM_ID from List_StateCountry where List_Name=''STATE'' and ITEM_ID=@State        
select @CountryID=ITEM_ID from List_StateCountry where List_Name=''COUNTRY'' and ITEM_ID=@Country        
        
/*-----------------------------*/        
declare @NextUserGroupID int        
        
SELECT @NextUserGroupID = MAX(USER_GROUP_ID)        
FROM USER_INFO        
        
if (@NextUserGroupID >= 0)        
begin        
set @NextUserGroupID = @NextUserGroupID + 1        
end        
else        
begin        
set @NextUserGroupID = 1        
end      
    
DECLARE @intCompanyId INT  
SET @intCompanyId = ISNULL((SELECT Top 1 intCompanyId FROM tbl_CompanyInfo WHERE strCompanyName = @ORGANIZATION),0)  
  
set @NewUserId  = (select Top 1 UserId from aspnet_Users where UserName = @UserName)      
INSERT INTO User_Info(User_Id,intCompanyId,USER_GROUP_ID,Delete_Flg,Fname,Mname,Lname,Degree_ID,SPECIALTY,Affiliation,        
Address1,Address2,City,State_ID,Zip,Country_ID,Phone,Fax,        
RND_REG_CODE,ORGANIZATION,IS_ACCREDITED,Email_List_Flg,Date_Created,Last_modified,YOUR_ROLE_ID,STATE_TEXT,        
REGISTRATION_FLG,ACCOUNT_CREDITS,ACCOUNT_FROM_RELATIONSHIP_ID,        
GENDER_ID,FAMILY_STATUS_ID,DATE_BIRTH,HEIGHT)        
        
VALUES (@NewUserId,@intCompanyId , @NextUserGroupID,0,@FName,@MName,@LName,@DegreeID,@Specialty,@Affiliation,        
@Address1,@Address2,@City,@StateID,@Zip,@CountryID,@phone,@Fax,        
@RND_REG_CODE,@ORGANIZATION,0,@EmailList,@CreationDate,@CreationDate,@YOUR_ROLE_ID,@STATE_TEXT,        
@REGISTRATION_FLG,@ACCOUNT_CREDITS     
,@ACCOUNT_FROM_RELATIONSHIP_ID,        
@GENDER_ID,@FAMILY_STATUS_ID,@DATE_BIRTH,@HEIGHT)    
      
INSERT INTO aspnet_UsersInRoles (UserId,RoleId)      
 VALUES  (@NewUserId  ,@AdminUserTypeId)    
 UPDATE      
 aspnet_Membership SET IsApproved = 1 WHERE Email = @NewUserId
 
 
 END' 
END
GO
/****** Object:  StoredProcedure [dbo].[spMem_GET_UserInfo_BY_UserId]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spMem_GET_UserInfo_BY_UserId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spMem_GET_UserInfo_BY_UserId]
@USER_ID varchar(100)
AS

declare @password varchar(255) set @password = ''''
declare @username varchar(255) set @username = ''''
declare @islockedout varchar(255) set @islockedout = ''0''
declare @rolename varchar(255) set @rolename = ''User''

if exists(select UserId from aspnet_Users where UserId=@USER_ID)
begin
	select @password=Password,@username=Email,@islockedout=IsLockedOut from aspnet_Membership where UserId=@USER_ID
	select @rolename=RoleName from aspnet_Roles where RoleId=(select RoleId from aspnet_UsersInRoles where UserId=@USER_ID)
end

SELECT 
PASSWORD=@password, 
USERNAME=@username, 
IsLockedOut=@islockedout, 
ROLENAME=@rolename, 
A.*,
E.ITEM_VALUE as StateID,
F.ITEM_VALUE as CountryID,
STATE=E.ITEM_TEXT,
COUNTRY=F.ITEM_TEXT,
STATE_ABBR=E.ITEM_VALUE,
DEGREE_ABBR=(select ITEM_VALUE from List_Items where ITEM_ID=DEGREE_ID and LIST_NAME=''Degree'')
FROM USER_INFO A,LIST_STATECOUNTRY E,LIST_STATECOUNTRY F
WHERE A.USER_ID=@USER_ID
AND E.ITEM_ID=A.STATE_ID
AND F.ITEM_ID=A.COUNTRY_ID
AND E.LIST_NAME=''State''
AND F.LIST_NAME=''Country''

' 
END
GO
/****** Object:  StoredProcedure [dbo].[spMem_GET_UserInfo]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spMem_GET_UserInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'  
CREATE PROCEDURE [dbo].[spMem_GET_UserInfo]
@UserEmail varchar(100)
AS
SELECT A.USER_ID, M.Password, PASSWORD=M.Password, 
USERNAME=B.UserName, M.IsLockedOut,R.RoleName,
E.ITEM_VALUE as StateID,A.*,
F.ITEM_VALUE as CountryID,
STATE=E.ITEM_TEXT,
COUNTRY=F.ITEM_TEXT,
EMAIL=B.UserName,
STATE_ABBR=E.ITEM_VALUE,
DEGREE_ABBR=(select ITEM_VALUE from List_Items 
where ITEM_ID=DEGREE_ID and LIST_NAME=''Degree''),
ISNULL(A.strRiskStratificationProcessStep,'''') AS strRiskStratificationProcessStep
FROM USER_INFO A,LIST_STATECOUNTRY E,LIST_STATECOUNTRY F,
aspnet_users B, aspnet_Membership M, aspnet_Roles R,
aspnet_UsersInRoles U
WHERE B.loweredusername=LOWER(@UserEmail)
AND E.ITEM_ID=A.STATE_ID
AND F.ITEM_ID=A.COUNTRY_ID
AND E.LIST_NAME=''State''
AND F.LIST_NAME=''Country''
AND A.USER_ID = M.UserId
AND B.UserID = A.USER_ID
AND U.UserId = A.USER_ID
AND R.RoleId = U.RoleId' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile_DeleteProfiles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N'','', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END' 
END
GO
/****** Object:  Table [dbo].[DD_ENTRIES]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DD_ENTRIES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DD_ENTRIES](
	[DD_ENTRY_ID] [int] NOT NULL,
	[USER_ID] [uniqueidentifier] NOT NULL,
	[DD_ENTRY_DATE] [datetime] NOT NULL,
	[TOTAL_FIELD_01] [int] NOT NULL,
	[TOTAL_FIELD_02] [int] NOT NULL,
	[TOTAL_FIELD_03] [int] NOT NULL,
	[TOTAL_FIELD_04] [int] NOT NULL,
	[TOTAL_FIELD_05] [int] NOT NULL,
	[TOTAL_FIELD_06] [int] NOT NULL,
	[TOTAL_FIELD_07] [int] NOT NULL,
	[TOTAL_EDIT_FLG] [smallint] NOT NULL,
	[LV_FIELD_01] [int] NOT NULL,
	[LV_FIELD_02] [int] NOT NULL,
	[LV_FIELD_03] [int] NOT NULL,
	[LV_FIELD_04] [int] NOT NULL,
	[LV_FIELD_05] [int] NOT NULL,
	[DATE_CREATED] [datetime] NOT NULL,
	[DATE_MODIFIED] [datetime] NOT NULL,
 CONSTRAINT [PK_DD_ENTRIES] PRIMARY KEY CLUSTERED 
(
	[DD_ENTRY_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DD_USERS]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DD_USERS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DD_USERS](
	[USER_ID] [uniqueidentifier] NOT NULL,
	[CALORIE_NUMBER] [int] NOT NULL,
	[DATE_CREATED] [datetime] NOT NULL,
	[DATE_MODIFIED] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ForumPollOptions]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ForumPollOptions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ForumPollOptions](
	[OptionID] [int] IDENTITY(1,1) NOT NULL,
	[PollID] [int] NOT NULL,
	[OptionText] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OptionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ForumPollAnswers]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ForumPollAnswers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ForumPollAnswers](
	[UserID] [uniqueidentifier] NOT NULL,
	[OptionID] [int] NOT NULL,
 CONSTRAINT [PK__ForumPollAnswers__29221CFB] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[OptionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DD_ENTRY_DETAILS]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DD_ENTRY_DETAILS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DD_ENTRY_DETAILS](
	[DD_ENTRY_ID] [int] NOT NULL,
	[B_FIELD_01] [int] NOT NULL,
	[B_FIELD_02] [int] NOT NULL,
	[B_FIELD_03] [int] NOT NULL,
	[B_FIELD_04] [int] NOT NULL,
	[B_FIELD_05] [int] NOT NULL,
	[B_FIELD_06] [int] NOT NULL,
	[B_FIELD_07] [int] NOT NULL,
	[L_FIELD_01] [int] NOT NULL,
	[L_FIELD_02] [int] NOT NULL,
	[L_FIELD_03] [int] NOT NULL,
	[L_FIELD_04] [int] NOT NULL,
	[L_FIELD_05] [int] NOT NULL,
	[L_FIELD_06] [int] NOT NULL,
	[L_FIELD_07] [int] NOT NULL,
	[D_FIELD_01] [int] NOT NULL,
	[D_FIELD_02] [int] NOT NULL,
	[D_FIELD_03] [int] NOT NULL,
	[D_FIELD_04] [int] NOT NULL,
	[D_FIELD_05] [int] NOT NULL,
	[D_FIELD_06] [int] NOT NULL,
	[D_FIELD_07] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[spRpt_GET_vwOrganizationParticipants]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRpt_GET_vwOrganizationParticipants]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRpt_GET_vwOrganizationParticipants]
@ORGANIZATION varchar(255)
AS

SELECT *
FROM vwRpt_REPORT_OrganizationParticipants
WHERE ORGANIZATION=@ORGANIZATION

/*
if(lower(@FILTER_ACCOUNT_FROM) == ''main'')
begin
	set @sql = @sql + ''
NUM_PARTICIPANTS_ACTIVE=(select count (distinct USER_ID) from VISITLOG_ACTION where USER_ID in (select USER_ID from USER_INFO where FROM_ACCOUNT=USER_ID '' + @and_organization_type_apos + '')),
NUM_PARTICIPANTS_INACTIVE=(select count USER_ID from USER_INFO where 1=1 '' + @and_organization_type_apos + '')-(select count USER_ID from USER_INFO where FROM_ACCOUNT=USER_ID '' + @and_organization_type_apos + '')


''
*/


--INNER JOIN CARTS C ON C.CART_ID=CT.CART_ID
--INNER JOIN USER_INFO UI ON UI.PROFILE_ID=CT.PROFILE_ID

/*
if(@DATE_FROM <> '''' and @DATE_TO <> '''')
begin
	set @sql = @sql + '' AND CT.DATE_CREATED >= '''''' + @DATE_FROM + ''''''''
	set @sql = @sql + '' AND CT.DATE_CREATED <= '''''' + @DATE_TO + ''''''''
end

if(@CART_ID <> '''')
begin
	set @sql = @sql + '' AND CT.CART_ID in ('' + @CART_ID + '')''
end

if(@CART_TYPE_ID <> '''')
begin
	set @sql = @sql + '' AND CT.CART_TYPE_ID in ('' + @CART_TYPE_ID + '')''
end

if(@TRANSACTION_TYPE <> '''')
begin
	declare @transaction_type_apos varchar(300)--replace D''ANGELO with d''''angelo
	set @transaction_type_apos = lower(replace(@TRANSACTION_TYPE, '''''''', ''''''''''''))
	
	set @sql = @sql + '' AND TRANSACTION_TYPE in ('''''' + replace(@transaction_type_apos, '','', '''''','''''') + '''''')''
end
*/

/*
if(@EXCLUDED_USERNAMES <> '''')
begin
	declare @excluded_usernames_apos varchar(300)--replace D''ANGELO with d''''angelo
	set @excluded_usernames_apos = lower(replace(@EXCLUDED_USERNAMES, '''''''', ''''''''''''))
	
	set @sql = @sql + '' AND UI.USER_ID not in (select UserId from aspnet_Users where UserName in ('''''' + replace(@excluded_usernames_apos, '','', '''''','''''') + ''''''))''
end


print(@sql)
exec(@sql)
*/' 
END
GO
/****** Object:  StoredProcedure [dbo].[spRpt_GET_vwAccountParticipants]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRpt_GET_vwAccountParticipants]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRpt_GET_vwAccountParticipants]
@ACCOUNT_ID varchar(255)
AS

SELECT *
FROM vwRpt_REPORT_AccountParticipants
WHERE ACCOUNT_ID=@ACCOUNT_ID

/*
if(lower(@FILTER_ACCOUNT_FROM) == ''main'')
begin
	set @sql = @sql + ''
NUM_PARTICIPANTS_ACTIVE=(select count (distinct USER_ID) from VISITLOG_ACTION where USER_ID in (select USER_ID from USER_INFO where FROM_ACCOUNT=USER_ID '' + @and_organization_type_apos + '')),
NUM_PARTICIPANTS_INACTIVE=(select count USER_ID from USER_INFO where 1=1 '' + @and_organization_type_apos + '')-(select count USER_ID from USER_INFO where FROM_ACCOUNT=USER_ID '' + @and_organization_type_apos + '')


''
*/


--INNER JOIN CARTS C ON C.CART_ID=CT.CART_ID
--INNER JOIN USER_INFO UI ON UI.PROFILE_ID=CT.PROFILE_ID

/*
if(@DATE_FROM <> '''' and @DATE_TO <> '''')
begin
	set @sql = @sql + '' AND CT.DATE_CREATED >= '''''' + @DATE_FROM + ''''''''
	set @sql = @sql + '' AND CT.DATE_CREATED <= '''''' + @DATE_TO + ''''''''
end

if(@CART_ID <> '''')
begin
	set @sql = @sql + '' AND CT.CART_ID in ('' + @CART_ID + '')''
end

if(@CART_TYPE_ID <> '''')
begin
	set @sql = @sql + '' AND CT.CART_TYPE_ID in ('' + @CART_TYPE_ID + '')''
end

if(@TRANSACTION_TYPE <> '''')
begin
	declare @transaction_type_apos varchar(300)--replace D''ANGELO with d''''angelo
	set @transaction_type_apos = lower(replace(@TRANSACTION_TYPE, '''''''', ''''''''''''))
	
	set @sql = @sql + '' AND TRANSACTION_TYPE in ('''''' + replace(@transaction_type_apos, '','', '''''','''''') + '''''')''
end
*/

/*
if(@EXCLUDED_USERNAMES <> '''')
begin
	declare @excluded_usernames_apos varchar(300)--replace D''ANGELO with d''''angelo
	set @excluded_usernames_apos = lower(replace(@EXCLUDED_USERNAMES, '''''''', ''''''''''''))
	
	set @sql = @sql + '' AND UI.USER_ID not in (select UserId from aspnet_Users where UserName in ('''''' + replace(@excluded_usernames_apos, '','', '''''','''''') + ''''''))''
end


print(@sql)
exec(@sql)
*/' 
END
GO
/****** Object:  StoredProcedure [dbo].[spPAL_UPDATE_PalStarts_ProgramCurrentStep]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPAL_UPDATE_PalStarts_ProgramCurrentStep]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spPAL_UPDATE_PalStarts_ProgramCurrentStep]
@PAL_START_ID VARCHAR(100),
@PROGRAM_CURRENT_STEP VARCHAR(100)
AS


		UPDATE PAL_STARTS 
		SET PROGRAM_CURRENT_STEP=@PROGRAM_CURRENT_STEP,
			DATE_MODIFIED=getdate()
		WHERE PAL_START_ID=@PAL_START_ID
		
		SELECT * FROM PAL_STARTS 
		WHERE PAL_START_ID=@PAL_START_ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[spPAL_UPDATE_PalStarts_ProgramCompletionFlg]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPAL_UPDATE_PalStarts_ProgramCompletionFlg]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spPAL_UPDATE_PalStarts_ProgramCompletionFlg]
@PAL_START_ID varchar(100),
@PROGRAM_COMPLETION_FLG varchar(100),
@ACTIVE_FLG varchar(100)
AS

declare @now datetime
set @now = getdate()

if(@PROGRAM_COMPLETION_FLG <> '''')
begin
	UPDATE PAL_STARTS 
	SET PROGRAM_COMPLETION_FLG=@PROGRAM_COMPLETION_FLG, PROGRAM_COMPLETION_DATE=@now, DATE_MODIFIED=@now
	WHERE PAL_START_ID=@PAL_START_ID
end
	
if(@ACTIVE_FLG <> '''')
begin	
	UPDATE PAL_STARTS 
	SET ACTIVE_FLG=@ACTIVE_FLG, DATE_MODIFIED=@now
	WHERE PAL_START_ID=@PAL_START_ID
end
		
SELECT * FROM PAL_STARTS 
WHERE PAL_START_ID=@PAL_START_ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[spPAL_UPDATE_PalStarts]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPAL_UPDATE_PalStarts]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spPAL_UPDATE_PalStarts]
@PAL_START_ID varchar(100),
@PROGRAM_ID varchar(100),
@PROGRAM_START_DATE varchar(100),
@PROGRAM_START_STEP varchar(100)
AS

declare @now datetime
set @now = getdate()

UPDATE PAL_STARTS
SET PROGRAM_ID=@PROGRAM_ID,
	PROGRAM_START_DATE=@PROGRAM_START_DATE,
	PROGRAM_START_STEP=@PROGRAM_START_STEP,
	DATE_MODIFIED=@now
WHERE PAL_START_ID=@PAL_START_ID

SELECT *
FROM PAL_STARTS
WHERE PAL_START_ID=@PAL_START_ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[spPAL_UPDATE_PalEntries]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPAL_UPDATE_PalEntries]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spPAL_UPDATE_PalEntries]
@PAL_ENTRY_ID varchar(100),
@PAL_ENTRY_DATE varchar(100),
@PAL_ENTRY_TYPE varchar(100),
@PAL_ENTRY_TIME varchar(100),
@PAL_ENTRY_DURATION varchar(100),
@PAL_ENTRY_INTENSITY varchar(100),
@PAL_ENTRY_WEIGHT varchar(100),
@PAL_ENTRY_COMMENT text
AS

declare @now datetime
set @now = getdate()

declare @userid uniqueidentifier
set @userid = (select USER_ID from PAL_ENTRIES where PAL_ENTRY_ID=@PAL_ENTRY_ID)

if (
	@PAL_ENTRY_DATE = (select PAL_ENTRY_DATE from PAL_ENTRIES where PAL_ENTRY_ID=@PAL_ENTRY_ID)
	or
	not exists(select PAL_ENTRY_ID from PAL_ENTRIES where USER_ID=@userid and PAL_ENTRY_DATE=@PAL_ENTRY_DATE)
	)
begin
	UPDATE PAL_ENTRIES
	SET PAL_ENTRY_DATE=@PAL_ENTRY_DATE,
		PAL_ENTRY_TYPE=@PAL_ENTRY_TYPE,
		PAL_ENTRY_TIME=@PAL_ENTRY_TIME,
		PAL_ENTRY_DURATION=@PAL_ENTRY_DURATION,
		PAL_ENTRY_INTENSITY=@PAL_ENTRY_INTENSITY,
		PAL_ENTRY_WEIGHT=@PAL_ENTRY_WEIGHT,
		PAL_ENTRY_COMMENT=@PAL_ENTRY_COMMENT,
		DATE_MODIFIED=@now
	WHERE PAL_ENTRY_ID=@PAL_ENTRY_ID

	SELECT *
	FROM PAL_ENTRIES
	WHERE PAL_ENTRY_ID=@PAL_ENTRY_ID
end' 
END
GO
/****** Object:  StoredProcedure [dbo].[spPAL_INSERTMULTIPLE_PalStarts]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPAL_INSERTMULTIPLE_PalStarts]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spPAL_INSERTMULTIPLE_PalStarts]  
@USER_ID varchar(100),  
@PROGRAM_ID varchar(100),  
@PROGRAM_START_DATE varchar(100),  
@PROGRAM_START_STEP varchar(100)  
AS  
  
declare @nextid int  
select @nextid= COUNT(PAL_START_ID)+1 FROM PAL_STARTS  
if @nextid > 1  
select @nextid= MAX(PAL_START_ID)+1 FROM PAL_STARTS  
  
declare @now datetime  
set @now = getdate()  
  
INSERT INTO PAL_STARTS  
(  
PAL_START_ID,DELETE_FLG,ACTIVE_FLG,USER_ID,  
PROGRAM_ID,PROGRAM_START_DATE,PROGRAM_START_STEP,PROGRAM_CURRENT_STEP,  
PROGRAM_COMPLETION_FLG,PROGRAM_COMPLETION_DATE,  
DATE_CREATED,DATE_MODIFIED  
)  
VALUES  
(  
@nextid,0,1,@USER_ID,  
@PROGRAM_ID,@PROGRAM_START_DATE,@PROGRAM_START_STEP,0,  
0,@now,  
@now,@now  
)  
   
  
SELECT *  
FROM PAL_STARTS  
WHERE PAL_START_ID=@nextid' 
END
GO
/****** Object:  StoredProcedure [dbo].[spPAL_INSERT_PalStarts]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPAL_INSERT_PalStarts]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spPAL_INSERT_PalStarts]
@USER_ID varchar(100),
@PROGRAM_ID varchar(100),
@PROGRAM_START_DATE varchar(100),
@PROGRAM_START_STEP varchar(100)
AS

declare @nextid int
select @nextid= COUNT(PAL_START_ID)+1 FROM PAL_STARTS
if @nextid > 1
select @nextid= MAX(PAL_START_ID)+1 FROM PAL_STARTS

declare @now datetime
set @now = getdate()

INSERT INTO PAL_STARTS
(
PAL_START_ID,DELETE_FLG,ACTIVE_FLG,USER_ID,
PROGRAM_ID,PROGRAM_START_DATE,PROGRAM_START_STEP,PROGRAM_CURRENT_STEP,
PROGRAM_COMPLETION_FLG,PROGRAM_COMPLETION_DATE,
DATE_CREATED,DATE_MODIFIED
)
VALUES
(
@nextid,0,1,@USER_ID,
@PROGRAM_ID,@PROGRAM_START_DATE,@PROGRAM_START_STEP,0,
0,@now,
@now,@now
)

if exists(select PAL_START_ID from PAL_STARTS where PAL_START_ID=@nextid)
begin
	UPDATE PAL_STARTS
	SET ACTIVE_FLG=0
	WHERE USER_ID=@USER_ID
	AND PAL_START_ID not in (@nextid)
end

SELECT *
FROM PAL_STARTS
WHERE PAL_START_ID=@nextid' 
END
GO
/****** Object:  StoredProcedure [dbo].[spPAL_INSERT_PalEntries]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPAL_INSERT_PalEntries]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spPAL_INSERT_PalEntries]
@USER_ID varchar(100),
@PAL_ENTRY_DATE varchar(100),
@PAL_ENTRY_TYPE varchar(100),
@PAL_ENTRY_TIME varchar(100),
@PAL_ENTRY_DURATION varchar(100),
@PAL_ENTRY_INTENSITY varchar(100),
@PAL_ENTRY_WEIGHT varchar(100),
@PAL_ENTRY_COMMENT text
AS

declare @nextid int
select @nextid= COUNT(PAL_ENTRY_ID)+1 FROM PAL_ENTRIES
if @nextid > 1
select @nextid= MAX(PAL_ENTRY_ID)+1 FROM PAL_ENTRIES

declare @now datetime
set @now = getdate()

if not exists(select PAL_ENTRY_ID from PAL_ENTRIES where USER_ID=@USER_ID and PAL_ENTRY_DATE=@PAL_ENTRY_DATE)
begin
INSERT INTO PAL_ENTRIES
(
PAL_ENTRY_ID,DELETE_FLG,USER_ID,
PAL_ENTRY_DATE,PAL_ENTRY_TYPE,PAL_ENTRY_TIME,PAL_ENTRY_DURATION,PAL_ENTRY_INTENSITY,PAL_ENTRY_WEIGHT,PAL_ENTRY_COMMENT,
DATE_CREATED,DATE_MODIFIED
)
VALUES
(
@nextid,0,@USER_ID,
@PAL_ENTRY_DATE,@PAL_ENTRY_TYPE,@PAL_ENTRY_TIME,@PAL_ENTRY_DURATION,@PAL_ENTRY_INTENSITY,@PAL_ENTRY_WEIGHT,@PAL_ENTRY_COMMENT,
@now,@now
)

SELECT *
FROM PAL_ENTRIES
WHERE PAL_ENTRY_ID=@nextid

end' 
END
GO
/****** Object:  StoredProcedure [dbo].[spPAL_GET_PalEntries_BY_UserId]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPAL_GET_PalEntries_BY_UserId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spPAL_GET_PalEntries_BY_UserId]
@USER_ID VARCHAR(100),
@DATE_FROM VARCHAR(100),
@DATE_TO VARCHAR(100)
AS

--858b5769-15f9-462c-bf46-39031a46ef15 User_id cbono@bluegrotto.com


if(@DATE_FROM = '''' or @DATE_TO = '''')
begin
	SELECT PE.*, PME.MET_EQUIVALENT,
		PAL_ENTRY_TYPE_TEXT=(select ITEM_TEXT from LIST_PAL WHERE ITEM_ID=PE.PAL_ENTRY_TYPE and LIST_NAME=''Type''),
		PAL_ENTRY_TIME_TEXT=(select ITEM_TEXT from LIST_PAL WHERE ITEM_ID=PE.PAL_ENTRY_TIME and LIST_NAME=''Time''),
		PAL_ENTRY_INTENSITY_TEXT=(select ITEM_TEXT from LIST_PAL WHERE ITEM_ID=PE.PAL_ENTRY_INTENSITY and LIST_NAME=''Intensity''),
		PAL_ENTRY_DURATION_TEXT=(select ITEM_TEXT from LIST_PAL WHERE ITEM_ID=PE.PAL_ENTRY_DURATION and LIST_NAME=''Duration'')
	FROM PAL_ENTRIES PE 
	INNER JOIN PAL_MET_EQUIVALENT PME ON
			PME.ACTIVITY_ID = PE.PAL_ENTRY_TYPE AND
			PME.DURATION = PE.PAL_ENTRY_DURATION AND
			PME.INTENSITY = PE.PAL_ENTRY_INTENSITY
	WHERE PE.DELETE_FLG=0 
		AND	PE.USER_ID=@USER_ID
	ORDER BY PE.PAL_ENTRY_DATE DESC
end
else
begin
	SELECT PE.*, PME.MET_EQUIVALENT,
		PAL_ENTRY_TYPE_TEXT=(select ITEM_TEXT from LIST_PAL WHERE ITEM_ID=PE.PAL_ENTRY_TYPE and LIST_NAME=''Type''),
		PAL_ENTRY_TIME_TEXT=(select ITEM_TEXT from LIST_PAL WHERE ITEM_ID=PE.PAL_ENTRY_TIME and LIST_NAME=''Time''),
		PAL_ENTRY_INTENSITY_TEXT=(select ITEM_TEXT from LIST_PAL WHERE ITEM_ID=PE.PAL_ENTRY_INTENSITY and LIST_NAME=''Intensity''),
		PAL_ENTRY_DURATION_TEXT=(select ITEM_TEXT from LIST_PAL WHERE ITEM_ID=PE.PAL_ENTRY_DURATION and LIST_NAME=''Duration'')
	FROM PAL_ENTRIES PE 
	INNER JOIN PAL_MET_EQUIVALENT PME ON
			PME.ACTIVITY_ID = PE.PAL_ENTRY_TYPE AND
			PME.DURATION = PE.PAL_ENTRY_DURATION AND
			PME.INTENSITY = PE.PAL_ENTRY_INTENSITY
	WHERE PE.DELETE_FLG=0  
		AND PE.USER_ID=@USER_ID  
		AND (PE.PAL_ENTRY_DATE between @DATE_FROM and @DATE_TO)
	ORDER BY PE.PAL_ENTRY_DATE DESC
end' 
END
GO
/****** Object:  StoredProcedure [dbo].[spPAL_GET_PalEntries_BY_PalEntryId]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPAL_GET_PalEntries_BY_PalEntryId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spPAL_GET_PalEntries_BY_PalEntryId]
@PAL_ENTRY_ID VARCHAR(100)
AS

SELECT PE.*, PME.MET_EQUIVALENT,
	PAL_ENTRY_TYPE_TEXT=(select ITEM_TEXT from LIST_PAL WHERE ITEM_ID=PE.PAL_ENTRY_TYPE and LIST_NAME=''Type''),
	PAL_ENTRY_TIME_TEXT=(select ITEM_TEXT from LIST_PAL WHERE ITEM_ID=PE.PAL_ENTRY_TIME and LIST_NAME=''Time''),
	PAL_ENTRY_INTENSITY_TEXT=(select ITEM_TEXT from LIST_PAL WHERE ITEM_ID=PE.PAL_ENTRY_INTENSITY and LIST_NAME=''Intensity''),
	PAL_ENTRY_DURATION_TEXT=(select ITEM_TEXT from LIST_PAL WHERE ITEM_ID=PE.PAL_ENTRY_DURATION and LIST_NAME=''Duration'')
FROM PAL_ENTRIES PE 
INNER JOIN PAL_MET_EQUIVALENT PME ON
PME.ACTIVITY_ID = PE.PAL_ENTRY_TYPE AND
PME.DURATION = PE.PAL_ENTRY_DURATION AND
PME.INTENSITY = PE.PAL_ENTRY_INTENSITY
WHERE PE.PAL_ENTRY_ID=@PAL_ENTRY_ID 
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spPAL_Delete_PalEntries_BY_PALId]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spPAL_Delete_PalEntries_BY_PALId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spPAL_Delete_PalEntries_BY_PALId]  
@PAL_ENTRYID INT
AS  
  BEGIN
	 UPDATE PAL_ENTRIES 
	SET DELETE_FLG=1   
		WHERE 
			DELETE_FLG=0   
			AND PAL_ENTRY_ID = @PAL_ENTRYID  
 
 
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[spDD_UPDATE_DdUsers]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDD_UPDATE_DdUsers]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spDD_UPDATE_DdUsers]
@USER_ID varchar(100),
@CALORIE_NUMBER varchar(100)

AS


declare @now datetime
set @now = getdate()

if exists(select USER_ID from DD_USERS where USER_ID=@USER_ID)
begin
UPDATE DD_USERS 
SET
	CALORIE_NUMBER=@CALORIE_NUMBER, 
	DATE_MODIFIED=@now
WHERE
USER_ID=@USER_ID 

select * from DD_USERS where USER_ID=@USER_ID
end' 
END
GO
/****** Object:  StoredProcedure [dbo].[spDD_INSERT_DdUsers]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDD_INSERT_DdUsers]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spDD_INSERT_DdUsers]
@USER_ID varchar(100),
@CALORIE_NUMBER varchar(100)

AS


declare @now datetime
set @now = getdate()

if not exists(select USER_ID from DD_USERS where USER_ID=@USER_ID)
begin
INSERT INTO DD_USERS 
(
	USER_ID, CALORIE_NUMBER, DATE_CREATED, DATE_MODIFIED
)
VALUES
(	
	@USER_ID, @CALORIE_NUMBER, @now, @now
)


end' 
END
GO
/****** Object:  StoredProcedure [dbo].[spDD_GET_Users_Calorie]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDD_GET_Users_Calorie]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spDD_GET_Users_Calorie]
@USER_ID VARCHAR(100)
AS

--858b5769-15f9-462c-bf46-39031a46ef15 User_id cbono@bluegrotto.com

	SELECT DU.*  
	FROM DD_USERS DU
 
	 
	WHERE DU.USER_ID = @USER_ID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spDD_GET_DdUsers_BY_UserId]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDD_GET_DdUsers_BY_UserId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spDD_GET_DdUsers_BY_UserId]
@USER_ID VARCHAR(100)
AS

--858b5769-15f9-462c-bf46-39031a46ef15 User_id cbono@bluegrotto.com

	SELECT DU.* , DA.*
	FROM DD_USERS DU
	INNER JOIN DD_AUTOFILL DA
	ON DA.CALORIE_NUMBER = DU.CALORIE_NUMBER
	WHERE DU.USER_ID = @USER_ID
' 
END
GO
/****** Object:  View [dbo].[vw_DD_ENTRIES]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_DD_ENTRIES]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_DD_ENTRIES]
AS
SELECT     DE.DD_ENTRY_ID, DE.USER_ID, DE.DD_ENTRY_DATE, DE.TOTAL_FIELD_01, DE.TOTAL_FIELD_02, DE.TOTAL_FIELD_03, DE.TOTAL_FIELD_04, 
                      DE.TOTAL_FIELD_05, DE.TOTAL_FIELD_06, DE.TOTAL_FIELD_07, DE.TOTAL_EDIT_FLG, DE.LV_FIELD_01, DE.LV_FIELD_02, DE.LV_FIELD_03, 
                      DE.LV_FIELD_04, DE.LV_FIELD_05, DE.DATE_CREATED, DE.DATE_MODIFIED, DED.B_FIELD_01, DED.B_FIELD_02, DED.B_FIELD_03, 
                      DED.B_FIELD_04, DED.B_FIELD_05, DED.B_FIELD_06, DED.B_FIELD_07, DED.L_FIELD_01, DED.L_FIELD_02, DED.L_FIELD_03, DED.L_FIELD_04, 
                      DED.L_FIELD_05, DED.L_FIELD_06, DED.L_FIELD_07, DED.D_FIELD_01, DED.D_FIELD_02, DED.D_FIELD_03, DED.D_FIELD_04, DED.D_FIELD_05, 
                      DED.D_FIELD_06, DED.D_FIELD_07
FROM         dbo.DD_ENTRIES AS DE INNER JOIN
                      dbo.DD_ENTRY_DETAILS AS DED ON DE.DD_ENTRY_ID = DED.DD_ENTRY_ID
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'vw_DD_ENTRIES', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DE"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DED"
            Begin Extent = 
               Top = 6
               Left = 241
               Bottom = 114
               Right = 392
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_DD_ENTRIES'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'vw_DD_ENTRIES', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_DD_ENTRIES'
GO
/****** Object:  StoredProcedure [dbo].[spDD_GET_DdEntries_BY_UserId]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDD_GET_DdEntries_BY_UserId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spDD_GET_DdEntries_BY_UserId]
@USER_ID VARCHAR(100),
@DATE_FROM VARCHAR(100),
@DATE_TO VARCHAR(100)
AS

--858b5769-15f9-462c-bf46-39031a46ef15 User_id cbono@bluegrotto.com


if(@DATE_FROM = '''' or @DATE_TO = '''')
begin
	SELECT *
	FROM DD_ENTRIES 
	INNER JOIN DD_ENTRY_DETAILS
	ON DD_ENTRIES.DD_ENTRY_ID = DD_ENTRY_DETAILS.DD_ENTRY_ID
	WHERE DD_ENTRIES.USER_ID = @USER_ID
	ORDER BY DD_ENTRIES.DD_ENTRY_DATE DESC
end
else
begin
	SELECT *
	FROM DD_ENTRIES 
	INNER JOIN DD_ENTRY_DETAILS
	ON DD_ENTRIES.DD_ENTRY_ID = DD_ENTRY_DETAILS.DD_ENTRY_ID
	WHERE USER_ID = @USER_ID
		AND (DD_ENTRIES.DD_ENTRY_DATE between @DATE_FROM and @DATE_TO)
	ORDER BY DD_ENTRIES.DD_ENTRY_DATE DESC
end' 
END
GO
/****** Object:  StoredProcedure [dbo].[spDD_GET_DdEntries_BY_EntryId]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDD_GET_DdEntries_BY_EntryId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spDD_GET_DdEntries_BY_EntryId]
@DD_ENTRY_ID VARCHAR(100)
AS

	SELECT *
	FROM DD_ENTRIES 
	INNER JOIN DD_ENTRY_DETAILS
	ON DD_ENTRIES.DD_ENTRY_ID = DD_ENTRY_DETAILS.DD_ENTRY_ID
	WHERE DD_ENTRIES.DD_ENTRY_ID = @DD_ENTRY_ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[spDD_INSERT_DdEntries]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDD_INSERT_DdEntries]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spDD_INSERT_DdEntries]
@USER_ID varchar(100),
@DD_ENTRY_DATE varchar(100),
@TOTAL_EDIT_FLG varchar(100),
@B_FIELD_01 varchar(100),
@B_FIELD_02 varchar(100),
@B_FIELD_03 varchar(100),
@B_FIELD_04 varchar(100),
@B_FIELD_05 varchar(100),
@B_FIELD_06 varchar(100),
@B_FIELD_07 varchar(100),
@L_FIELD_01 varchar(100),
@L_FIELD_02 varchar(100),
@L_FIELD_03 varchar(100),
@L_FIELD_04 varchar(100),
@L_FIELD_05 varchar(100),
@L_FIELD_06 varchar(100),
@L_FIELD_07 varchar(100),
@D_FIELD_01 varchar(100),
@D_FIELD_02 varchar(100),
@D_FIELD_03 varchar(100),
@D_FIELD_04 varchar(100),
@D_FIELD_05 varchar(100),
@D_FIELD_06 varchar(100),
@D_FIELD_07 varchar(100),
@TOTAL_FIELD_01 varchar(100),
@TOTAL_FIELD_02 varchar(100),
@TOTAL_FIELD_03 varchar(100),
@TOTAL_FIELD_04 varchar(100),
@TOTAL_FIELD_05 varchar(100),
@TOTAL_FIELD_06 varchar(100),
@TOTAL_FIELD_07 varchar(100),
@LV_FIELD_01 varchar(100),
@LV_FIELD_02 varchar(100),
@LV_FIELD_03 varchar(100),
@LV_FIELD_04 varchar(100),
@LV_FIELD_05 varchar(100)
AS

declare @nextid int
select @nextid= COUNT(DD_ENTRY_ID)+1 FROM DD_ENTRIES
if @nextid > 1
select @nextid= MAX(DD_ENTRY_ID)+1 FROM DD_ENTRIES

declare @now datetime
set @now = getdate()

if not exists(select DD_ENTRY_ID from DD_ENTRIES where USER_ID=@USER_ID and DD_ENTRY_DATE=@DD_ENTRY_DATE)
begin
INSERT INTO DD_ENTRIES 
(
	DD_ENTRY_ID, USER_ID, DD_ENTRY_DATE, TOTAL_FIELD_01, TOTAL_FIELD_02, TOTAL_FIELD_03, TOTAL_FIELD_04, TOTAL_FIELD_05, TOTAL_FIELD_06, TOTAL_FIELD_07, TOTAL_EDIT_FLG, LV_FIELD_01, LV_FIELD_02, LV_FIELD_03, LV_FIELD_04, LV_FIELD_05, DATE_CREATED, DATE_MODIFIED
)
VALUES
(	
	@nextid, @USER_ID, @DD_ENTRY_DATE, @TOTAL_FIELD_01, @TOTAL_FIELD_02, @TOTAL_FIELD_03, @TOTAL_FIELD_04, @TOTAL_FIELD_05, @TOTAL_FIELD_06, @TOTAL_FIELD_07, @TOTAL_EDIT_FLG, @LV_FIELD_01, @LV_FIELD_02, @LV_FIELD_03, @LV_FIELD_04, @LV_FIELD_05, @now, @now
)



INSERT INTO DD_ENTRY_DETAILS 
(
	DD_ENTRY_ID, B_FIELD_01, B_FIELD_02, B_FIELD_03, B_FIELD_04, B_FIELD_05, B_FIELD_06, B_FIELD_07, L_FIELD_01, L_FIELD_02, L_FIELD_03, L_FIELD_04, L_FIELD_05, L_FIELD_06, L_FIELD_07, D_FIELD_01, D_FIELD_02, D_FIELD_03, D_FIELD_04, D_FIELD_05, D_FIELD_06, D_FIELD_07
)
VALUES
(
	@nextid, @B_FIELD_01, @B_FIELD_02, @B_FIELD_03, @B_FIELD_04, @B_FIELD_05, @B_FIELD_06, @B_FIELD_07, @L_FIELD_01, @L_FIELD_02, @L_FIELD_03, @L_FIELD_04, @L_FIELD_05, @L_FIELD_06, @L_FIELD_07, @D_FIELD_01, @D_FIELD_02, @D_FIELD_03, @D_FIELD_04, @D_FIELD_05, @D_FIELD_06, @D_FIELD_07
)

SELECT *
FROM vw_DD_ENTRIES
WHERE DD_ENTRY_ID=@nextid

end' 
END
GO
/****** Object:  StoredProcedure [dbo].[spDD_UPDATE_DdEntries]    Script Date: 04/15/2012 19:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spDD_UPDATE_DdEntries]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spDD_UPDATE_DdEntries]
@DD_ENTRY_ID varchar(100),
@DD_ENTRY_DATE varchar(100),
@TOTAL_EDIT_FLG varchar(100) = 0,
@B_FIELD_01 varchar(100) = 0,
@B_FIELD_02 varchar(100) = 0,
@B_FIELD_03 varchar(100) = 0,
@B_FIELD_04 varchar(100) = 0,
@B_FIELD_05 varchar(100) = 0,
@B_FIELD_06 varchar(100) = 0,
@B_FIELD_07 varchar(100) = 0,
@L_FIELD_01 varchar(100) = 0,
@L_FIELD_02 varchar(100) = 0,
@L_FIELD_03 varchar(100) = 0,
@L_FIELD_04 varchar(100) = 0,
@L_FIELD_05 varchar(100) = 0,
@L_FIELD_06 varchar(100) = 0,
@L_FIELD_07 varchar(100) = 0,
@D_FIELD_01 varchar(100) = 0,
@D_FIELD_02 varchar(100) = 0,
@D_FIELD_03 varchar(100) = 0,
@D_FIELD_04 varchar(100) = 0,
@D_FIELD_05 varchar(100) = 0,
@D_FIELD_06 varchar(100) = 0,
@D_FIELD_07 varchar(100) = 0,
@TOTAL_FIELD_01 varchar(100) = 0,
@TOTAL_FIELD_02 varchar(100) = 0,
@TOTAL_FIELD_03 varchar(100) = 0,
@TOTAL_FIELD_04 varchar(100) = 0,
@TOTAL_FIELD_05 varchar(100) = 0,
@TOTAL_FIELD_06 varchar(100) = 0,
@TOTAL_FIELD_07 varchar(100) = 0,
@LV_FIELD_01 varchar(100) = 0,
@LV_FIELD_02 varchar(100) = 0,
@LV_FIELD_03 varchar(100) = 0,
@LV_FIELD_04 varchar(100) = 0,
@LV_FIELD_05 varchar(100) = 0
AS


declare @now datetime
set @now = getdate()

UPDATE DD_ENTRIES 
SET
	 DD_ENTRY_DATE = @DD_ENTRY_DATE, 
	 TOTAL_FIELD_01 = @TOTAL_FIELD_01, 
	 TOTAL_FIELD_02 = @TOTAL_FIELD_02, 
	 TOTAL_FIELD_03 = @TOTAL_FIELD_03, 
	 TOTAL_FIELD_04 = @TOTAL_FIELD_04, 
	 TOTAL_FIELD_05 = @TOTAL_FIELD_05, 
	 TOTAL_FIELD_06 = @TOTAL_FIELD_06, 
	 TOTAL_FIELD_07 = @TOTAL_FIELD_07, 
	 TOTAL_EDIT_FLG = @TOTAL_EDIT_FLG, 
	 LV_FIELD_01 = @LV_FIELD_01, 
	 LV_FIELD_02 = @LV_FIELD_02, 
	 LV_FIELD_03 = @LV_FIELD_03, 
	 LV_FIELD_04 = @LV_FIELD_04, 
	 LV_FIELD_05 = @LV_FIELD_05, 
	 DATE_MODIFIED=@now
WHERE
DD_ENTRY_ID=@DD_ENTRY_ID 



UPDATE  DD_ENTRY_DETAILS 
SET
	B_FIELD_01 = @B_FIELD_01, 
	B_FIELD_02 = @B_FIELD_02, 
	B_FIELD_03 = @B_FIELD_03, 
	B_FIELD_04 = @B_FIELD_04, 
	B_FIELD_05 = @B_FIELD_05, 
	B_FIELD_06 = @B_FIELD_06, 
	B_FIELD_07 = @B_FIELD_07, 
	L_FIELD_01 = @L_FIELD_01, 
	L_FIELD_02 = @L_FIELD_02, 
	L_FIELD_03 = @L_FIELD_03, 
	L_FIELD_04 = @L_FIELD_04, 
	L_FIELD_05 = @L_FIELD_05, 
	L_FIELD_06 = @L_FIELD_06, 
	L_FIELD_07 = @L_FIELD_07, 
	D_FIELD_01 = @D_FIELD_01, 
	D_FIELD_02 = @D_FIELD_02, 
	D_FIELD_03 = @D_FIELD_03, 
	D_FIELD_04 = @D_FIELD_04, 
	D_FIELD_05 = @D_FIELD_05, 
	D_FIELD_06 = @D_FIELD_06, 
	D_FIELD_07 = @D_FIELD_07
WHERE
DD_ENTRY_ID=@DD_ENTRY_ID 

Select * from vw_DD_Entries where DD_ENTRY_ID=@DD_ENTRY_ID 
' 
END
GO
/****** Object:  Default [DF_VISITLOG_ACTION_USER_ID]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_VISITLOG_ACTION_USER_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[VISITLOG_ACTION]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_VISITLOG_ACTION_USER_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VISITLOG_ACTION] ADD  CONSTRAINT [DF_VISITLOG_ACTION_USER_ID]  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [USER_ID]
END


End
GO
/****** Object:  Default [DF_VISITLOG_USER_ID]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_VISITLOG_USER_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[VISITLOG]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_VISITLOG_USER_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VISITLOG] ADD  CONSTRAINT [DF_VISITLOG_USER_ID]  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [USER_ID]
END


End
GO
/****** Object:  Default [DF_USER_ASSESSMENTS_LEVEL_ID]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_ASSESSMENTS_LEVEL_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_ASSESSMENTS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_ASSESSMENTS_LEVEL_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_ASSESSMENTS] ADD  CONSTRAINT [DF_USER_ASSESSMENTS_LEVEL_ID]  DEFAULT (1) FOR [LEVEL_ID]
END


End
GO
/****** Object:  Default [DF_TEMPLATES_TamplateIndex]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TEMPLATES_TamplateIndex]') AND parent_object_id = OBJECT_ID(N'[dbo].[TextAreas]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TEMPLATES_TamplateIndex]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TextAreas] ADD  CONSTRAINT [DF_TEMPLATES_TamplateIndex]  DEFAULT ('') FOR [TextAreaIndex]
END


End
GO
/****** Object:  Default [DF_TEMPLATES_DateModified]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TEMPLATES_DateModified]') AND parent_object_id = OBJECT_ID(N'[dbo].[TextAreas]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TEMPLATES_DateModified]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TextAreas] ADD  CONSTRAINT [DF_TEMPLATES_DateModified]  DEFAULT (getdate()) FOR [DateModified]
END


End
GO
/****** Object:  Default [DF_ForumUsers_UserDisplayName_1]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_ForumUsers_UserDisplayName_1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumUsers]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ForumUsers_UserDisplayName_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ForumUsers] ADD  CONSTRAINT [DF_ForumUsers_UserDisplayName_1]  DEFAULT ('') FOR [UserDisplayName]
END


End
GO
/****** Object:  Default [DF__ForumUser__Posts__1BC821DD]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__ForumUser__Posts__1BC821DD]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumUsers]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ForumUser__Posts__1BC821DD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ForumUsers] ADD  CONSTRAINT [DF__ForumUser__Posts__1BC821DD]  DEFAULT (0) FOR [PostsCount]
END


End
GO
/****** Object:  Default [DF__ForumUser__Regis__1CBC4616]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__ForumUser__Regis__1CBC4616]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumUsers]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ForumUser__Regis__1CBC4616]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ForumUsers] ADD  CONSTRAINT [DF__ForumUser__Regis__1CBC4616]  DEFAULT (getdate()) FOR [RegistrationDate]
END


End
GO
/****** Object:  Default [DF__ForumUser__Disab__1DB06A4F]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__ForumUser__Disab__1DB06A4F]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumUsers]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ForumUser__Disab__1DB06A4F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ForumUsers] ADD  CONSTRAINT [DF__ForumUser__Disab__1DB06A4F]  DEFAULT (0) FOR [Disabled]
END


End
GO
/****** Object:  Default [DF__ForumUser__Activ__1EA48E88]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__ForumUser__Activ__1EA48E88]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumUsers]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ForumUser__Activ__1EA48E88]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ForumUsers] ADD  CONSTRAINT [DF__ForumUser__Activ__1EA48E88]  DEFAULT ('') FOR [ActivationCode]
END


End
GO
/****** Object:  Default [DF_TABS_LIST_NAME]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TABS_LIST_NAME]') AND parent_object_id = OBJECT_ID(N'[dbo].[LIST_TABS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TABS_LIST_NAME]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LIST_TABS] ADD  CONSTRAINT [DF_TABS_LIST_NAME]  DEFAULT ('') FOR [LIST_NAME]
END


End
GO
/****** Object:  Default [DF_TABS_URL]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TABS_URL]') AND parent_object_id = OBJECT_ID(N'[dbo].[LIST_TABS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TABS_URL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LIST_TABS] ADD  CONSTRAINT [DF_TABS_URL]  DEFAULT ('') FOR [VALUE]
END


End
GO
/****** Object:  Default [DF_TABS_ROLES]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TABS_ROLES]') AND parent_object_id = OBJECT_ID(N'[dbo].[LIST_TABS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TABS_ROLES]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LIST_TABS] ADD  CONSTRAINT [DF_TABS_ROLES]  DEFAULT ('') FOR [ROLES]
END


End
GO
/****** Object:  Default [DF_TABS_USERNAMES]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TABS_USERNAMES]') AND parent_object_id = OBJECT_ID(N'[dbo].[LIST_TABS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TABS_USERNAMES]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LIST_TABS] ADD  CONSTRAINT [DF_TABS_USERNAMES]  DEFAULT ('') FOR [USERNAMES]
END


End
GO
/****** Object:  Default [DF_TRN_TESTS_SECTIONS_DISPLAY_ORDER]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TRN_TESTS_SECTIONS_DISPLAY_ORDER]') AND parent_object_id = OBJECT_ID(N'[dbo].[LIST_TABS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TRN_TESTS_SECTIONS_DISPLAY_ORDER]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LIST_TABS] ADD  CONSTRAINT [DF_TRN_TESTS_SECTIONS_DISPLAY_ORDER]  DEFAULT (0) FOR [DISPLAY_ORDER]
END


End
GO
/****** Object:  Default [DF_TABS_SELECTED_FLG]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TABS_SELECTED_FLG]') AND parent_object_id = OBJECT_ID(N'[dbo].[LIST_TABS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TABS_SELECTED_FLG]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LIST_TABS] ADD  CONSTRAINT [DF_TABS_SELECTED_FLG]  DEFAULT (0) FOR [SELECTED_FLG]
END


End
GO
/****** Object:  Default [DF_TRN_TESTS_SECTIONS_DESCRIPTION]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TRN_TESTS_SECTIONS_DESCRIPTION]') AND parent_object_id = OBJECT_ID(N'[dbo].[LIST_TABS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TRN_TESTS_SECTIONS_DESCRIPTION]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LIST_TABS] ADD  CONSTRAINT [DF_TRN_TESTS_SECTIONS_DESCRIPTION]  DEFAULT ('') FOR [DESCRIPTION]
END


End
GO
/****** Object:  Default [DF_TABS_LIST_NAME_LIST_MENU]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TABS_LIST_NAME_LIST_MENU]') AND parent_object_id = OBJECT_ID(N'[dbo].[LIST_MENU]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TABS_LIST_NAME_LIST_MENU]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LIST_MENU] ADD  CONSTRAINT [DF_TABS_LIST_NAME_LIST_MENU]  DEFAULT ('') FOR [LIST_NAME]
END


End
GO
/****** Object:  Default [DF_TABS_URL_LIST_MENU]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TABS_URL_LIST_MENU]') AND parent_object_id = OBJECT_ID(N'[dbo].[LIST_MENU]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TABS_URL_LIST_MENU]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LIST_MENU] ADD  CONSTRAINT [DF_TABS_URL_LIST_MENU]  DEFAULT ('') FOR [VALUE]
END


End
GO
/****** Object:  Default [DF_TABS_ROLES_LIST_MENU]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TABS_ROLES_LIST_MENU]') AND parent_object_id = OBJECT_ID(N'[dbo].[LIST_MENU]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TABS_ROLES_LIST_MENU]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LIST_MENU] ADD  CONSTRAINT [DF_TABS_ROLES_LIST_MENU]  DEFAULT ('') FOR [ROLES]
END


End
GO
/****** Object:  Default [DF_TABS_USERNAMES_LIST_MENU]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TABS_USERNAMES_LIST_MENU]') AND parent_object_id = OBJECT_ID(N'[dbo].[LIST_MENU]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TABS_USERNAMES_LIST_MENU]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LIST_MENU] ADD  CONSTRAINT [DF_TABS_USERNAMES_LIST_MENU]  DEFAULT ('') FOR [USERNAMES]
END


End
GO
/****** Object:  Default [DF_TRN_TESTS_SECTIONS_DISPLAY_ORDER_LIST_MENU]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TRN_TESTS_SECTIONS_DISPLAY_ORDER_LIST_MENU]') AND parent_object_id = OBJECT_ID(N'[dbo].[LIST_MENU]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TRN_TESTS_SECTIONS_DISPLAY_ORDER_LIST_MENU]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LIST_MENU] ADD  CONSTRAINT [DF_TRN_TESTS_SECTIONS_DISPLAY_ORDER_LIST_MENU]  DEFAULT (0) FOR [DISPLAY_ORDER]
END


End
GO
/****** Object:  Default [DF_TABS_SELECTED_FLG_LIST_MENU]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TABS_SELECTED_FLG_LIST_MENU]') AND parent_object_id = OBJECT_ID(N'[dbo].[LIST_MENU]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TABS_SELECTED_FLG_LIST_MENU]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LIST_MENU] ADD  CONSTRAINT [DF_TABS_SELECTED_FLG_LIST_MENU]  DEFAULT (0) FOR [SELECTED_FLG]
END


End
GO
/****** Object:  Default [DF_TRN_TESTS_SECTIONS_DESCRIPTION_LIST_MENU]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TRN_TESTS_SECTIONS_DESCRIPTION_LIST_MENU]') AND parent_object_id = OBJECT_ID(N'[dbo].[LIST_MENU]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TRN_TESTS_SECTIONS_DESCRIPTION_LIST_MENU]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LIST_MENU] ADD  CONSTRAINT [DF_TRN_TESTS_SECTIONS_DESCRIPTION_LIST_MENU]  DEFAULT ('') FOR [DESCRIPTION]
END


End
GO
/****** Object:  Default [DF_List_Items_ITEM_ID]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_List_Items_ITEM_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[List_Items]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_List_Items_ITEM_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[List_Items] ADD  CONSTRAINT [DF_List_Items_ITEM_ID]  DEFAULT (1) FOR [ITEM_ID]
END


End
GO
/****** Object:  Default [DF_List_Items_DISPLAY_ORDER]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_List_Items_DISPLAY_ORDER]') AND parent_object_id = OBJECT_ID(N'[dbo].[List_Items]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_List_Items_DISPLAY_ORDER]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[List_Items] ADD  CONSTRAINT [DF_List_Items_DISPLAY_ORDER]  DEFAULT (0) FOR [DISPLAY_ORDER]
END


End
GO
/****** Object:  Default [DF_PROGRAMS_FORUM_PROGRAM_ID]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_PROGRAMS_FORUM_PROGRAM_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PROGRAMS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PROGRAMS_FORUM_PROGRAM_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMS] ADD  CONSTRAINT [DF_PROGRAMS_FORUM_PROGRAM_ID]  DEFAULT (1) FOR [FORUM_PROGRAM_ID]
END


End
GO
/****** Object:  Default [DF_PROGRAMS_FORUM_PROGRAM_ID1]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_PROGRAMS_FORUM_PROGRAM_ID1]') AND parent_object_id = OBJECT_ID(N'[dbo].[PROGRAMS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PROGRAMS_FORUM_PROGRAM_ID1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMS] ADD  CONSTRAINT [DF_PROGRAMS_FORUM_PROGRAM_ID1]  DEFAULT (1) FOR [NUTRITION_ID]
END


End
GO
/****** Object:  Default [DF__ForumPerson__New__2180FB33]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__ForumPerson__New__2180FB33]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumPersonalMessages]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ForumPerson__New__2180FB33]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ForumPersonalMessages] ADD  CONSTRAINT [DF__ForumPerson__New__2180FB33]  DEFAULT (1) FOR [New]
END


End
GO
/****** Object:  Default [DF_ForumPersonalMessages_Archive]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_ForumPersonalMessages_Archive]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumPersonalMessages]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ForumPersonalMessages_Archive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ForumPersonalMessages] ADD  CONSTRAINT [DF_ForumPersonalMessages_Archive]  DEFAULT (0) FOR [ArchiveFlg]
END


End
GO
/****** Object:  Default [DF__aspnet_Ap__Appli__7B905C75]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Ap__Appli__7B905C75]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Applications]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__aspnet_Ap__Appli__7B905C75]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Applications] ADD  DEFAULT (newid()) FOR [ApplicationId]
END


End
GO
/****** Object:  Default [DF_Accounts_Account_ID]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Accounts_Account_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ACCOUNTS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Accounts_Account_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ACCOUNTS] ADD  CONSTRAINT [DF_Accounts_Account_ID]  DEFAULT (1) FOR [ACCOUNT_ID]
END


End
GO
/****** Object:  Default [DF_ACCOUNTS_NAME]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_ACCOUNTS_NAME]') AND parent_object_id = OBJECT_ID(N'[dbo].[ACCOUNTS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ACCOUNTS_NAME]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ACCOUNTS] ADD  CONSTRAINT [DF_ACCOUNTS_NAME]  DEFAULT ('') FOR [ACCOUNT_NAME]
END


End
GO
/****** Object:  Default [DF_ACCOUNTS_ADDRESS_1]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_ACCOUNTS_ADDRESS_1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ACCOUNTS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ACCOUNTS_ADDRESS_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ACCOUNTS] ADD  CONSTRAINT [DF_ACCOUNTS_ADDRESS_1]  DEFAULT ('') FOR [ACCOUNT_ADDRESS_1]
END


End
GO
/****** Object:  Default [DF_ACCOUNTS_ADDRESS_2]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_ACCOUNTS_ADDRESS_2]') AND parent_object_id = OBJECT_ID(N'[dbo].[ACCOUNTS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ACCOUNTS_ADDRESS_2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ACCOUNTS] ADD  CONSTRAINT [DF_ACCOUNTS_ADDRESS_2]  DEFAULT ('') FOR [ACCOUNT_ADDRESS_2]
END


End
GO
/****** Object:  Default [DF_ACCOUNTS_CITY]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_ACCOUNTS_CITY]') AND parent_object_id = OBJECT_ID(N'[dbo].[ACCOUNTS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ACCOUNTS_CITY]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ACCOUNTS] ADD  CONSTRAINT [DF_ACCOUNTS_CITY]  DEFAULT ('') FOR [ACCOUNT_CITY]
END


End
GO
/****** Object:  Default [DF_ACCOUNTS_STATE]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_ACCOUNTS_STATE]') AND parent_object_id = OBJECT_ID(N'[dbo].[ACCOUNTS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ACCOUNTS_STATE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ACCOUNTS] ADD  CONSTRAINT [DF_ACCOUNTS_STATE]  DEFAULT ('') FOR [ACCOUNT_STATE]
END


End
GO
/****** Object:  Default [DF_ACCOUNTS_ZIP]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_ACCOUNTS_ZIP]') AND parent_object_id = OBJECT_ID(N'[dbo].[ACCOUNTS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ACCOUNTS_ZIP]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ACCOUNTS] ADD  CONSTRAINT [DF_ACCOUNTS_ZIP]  DEFAULT ('') FOR [ACCOUNT_ZIP]
END


End
GO
/****** Object:  Default [DF_ACCOUNT_USERS_USER_TYPE_ID]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_ACCOUNT_USERS_USER_TYPE_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ACCOUNT_USERS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ACCOUNT_USERS_USER_TYPE_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ACCOUNT_USERS] ADD  CONSTRAINT [DF_ACCOUNT_USERS_USER_TYPE_ID]  DEFAULT (2) FOR [USER_TYPE_ID]
END


End
GO
/****** Object:  Default [DF_ACCOUNT_USERS_DELETE_FLG]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_ACCOUNT_USERS_DELETE_FLG]') AND parent_object_id = OBJECT_ID(N'[dbo].[ACCOUNT_USERS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ACCOUNT_USERS_DELETE_FLG]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ACCOUNT_USERS] ADD  CONSTRAINT [DF_ACCOUNT_USERS_DELETE_FLG]  DEFAULT (0) FOR [DELETE_FLG]
END


End
GO
/****** Object:  Default [DF_ACCOUNT_USERS_DATE_CREATED]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_ACCOUNT_USERS_DATE_CREATED]') AND parent_object_id = OBJECT_ID(N'[dbo].[ACCOUNT_USERS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ACCOUNT_USERS_DATE_CREATED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ACCOUNT_USERS] ADD  CONSTRAINT [DF_ACCOUNT_USERS_DATE_CREATED]  DEFAULT (getdate()) FOR [DATE_CREATED]
END


End
GO
/****** Object:  Default [DF_ACCOUNT_USERS_DATE_MODIFIED]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_ACCOUNT_USERS_DATE_MODIFIED]') AND parent_object_id = OBJECT_ID(N'[dbo].[ACCOUNT_USERS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ACCOUNT_USERS_DATE_MODIFIED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ACCOUNT_USERS] ADD  CONSTRAINT [DF_ACCOUNT_USERS_DATE_MODIFIED]  DEFAULT (getdate()) FOR [DATE_MODIFIED]
END


End
GO
/****** Object:  Default [DF__aspnet_Pa__PathI__412EB0B6]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Pa__PathI__412EB0B6]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Paths]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__aspnet_Pa__PathI__412EB0B6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
END


End
GO
/****** Object:  Default [DF__Forums__Premoder__05D8E0BE]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Forums__Premoder__05D8E0BE]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Forums__Premoder__05D8E0BE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forums] ADD  DEFAULT (0) FOR [Premoderated]
END


End
GO
/****** Object:  Default [DF__Forums__MembersO__06CD04F7]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Forums__MembersO__06CD04F7]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Forums__MembersO__06CD04F7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forums] ADD  DEFAULT (0) FOR [MembersOnly]
END


End
GO
/****** Object:  Default [DF__Forums__OrderByN__07C12930]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Forums__OrderByN__07C12930]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forums]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Forums__OrderByN__07C12930]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Forums] ADD  DEFAULT (0) FOR [OrderByNumber]
END


End
GO
/****** Object:  Default [DF__aspnet_Us__UserI__7F60ED59]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Us__UserI__7F60ED59]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__aspnet_Us__UserI__7F60ED59]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (newid()) FOR [UserId]
END


End
GO
/****** Object:  Default [DF__aspnet_Us__Mobil__00551192]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Us__Mobil__00551192]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__aspnet_Us__Mobil__00551192]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (null) FOR [MobileAlias]
END


End
GO
/****** Object:  Default [DF__aspnet_Us__IsAno__014935CB]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Us__IsAno__014935CB]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__aspnet_Us__IsAno__014935CB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (0) FOR [IsAnonymous]
END


End
GO
/****** Object:  Default [DF__aspnet_Ro__RoleI__2E1BDC42]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Ro__RoleI__2E1BDC42]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Roles]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__aspnet_Ro__RoleI__2E1BDC42]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Roles] ADD  DEFAULT (newid()) FOR [RoleId]
END


End
GO
/****** Object:  Default [DF__ForumTopi__LastM__151B244E]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__ForumTopi__LastM__151B244E]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumTopics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ForumTopi__LastM__151B244E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ForumTopics] ADD  CONSTRAINT [DF__ForumTopi__LastM__151B244E]  DEFAULT (0) FOR [LastMessageID]
END


End
GO
/****** Object:  Default [DF__ForumTopi__IsSti__160F4887]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__ForumTopi__IsSti__160F4887]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumTopics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ForumTopi__IsSti__160F4887]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ForumTopics] ADD  CONSTRAINT [DF__ForumTopi__IsSti__160F4887]  DEFAULT (0) FOR [IsSticky]
END


End
GO
/****** Object:  Default [DF__ForumTopi__IsClo__17036CC0]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__ForumTopi__IsClo__17036CC0]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumTopics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ForumTopi__IsClo__17036CC0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ForumTopics] ADD  CONSTRAINT [DF__ForumTopi__IsClo__17036CC0]  DEFAULT (0) FOR [IsClosed]
END


End
GO
/****** Object:  Default [DF__ForumTopi__Views__17F790F9]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__ForumTopi__Views__17F790F9]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumTopics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ForumTopi__Views__17F790F9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ForumTopics] ADD  CONSTRAINT [DF__ForumTopi__Views__17F790F9]  DEFAULT (0) FOR [ViewsCount]
END


End
GO
/****** Object:  Default [DF__ForumTopi__Repli__18EBB532]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__ForumTopi__Repli__18EBB532]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumTopics]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ForumTopi__Repli__18EBB532]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ForumTopics] ADD  CONSTRAINT [DF__ForumTopi__Repli__18EBB532]  DEFAULT (0) FOR [RepliesCount]
END


End
GO
/****** Object:  Default [DF__aspnet_Me__Passw__108B795B]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Me__Passw__108B795B]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Membership]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__aspnet_Me__Passw__108B795B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Membership] ADD  DEFAULT (0) FOR [PasswordFormat]
END


End
GO
/****** Object:  Default [DF__aspnet_Perso__Id__48CFD27E]    Script Date: 04/15/2012 19:01:00 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Perso__Id__48CFD27E]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__aspnet_Perso__Id__48CFD27E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
END


End
GO
/****** Object:  Default [DF__ForumMess__Visib__0B91BA14]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__ForumMess__Visib__0B91BA14]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumMessages]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__ForumMess__Visib__0B91BA14]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ForumMessages] ADD  CONSTRAINT [DF__ForumMess__Visib__0B91BA14]  DEFAULT (1) FOR [Visible]
END


End
GO
/****** Object:  Default [DF_ForumMessages_HelpfulCount]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_ForumMessages_HelpfulCount]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumMessages]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ForumMessages_HelpfulCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ForumMessages] ADD  CONSTRAINT [DF_ForumMessages_HelpfulCount]  DEFAULT (0) FOR [HelpfulCount]
END


End
GO
/****** Object:  Default [DF_ForumMessages_HelpfulCount1]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_ForumMessages_HelpfulCount1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumMessages]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ForumMessages_HelpfulCount1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ForumMessages] ADD  CONSTRAINT [DF_ForumMessages_HelpfulCount1]  DEFAULT (0) FOR [TotalReviewsCount]
END


End
GO
/****** Object:  Default [DF_USER_INFO_USER_ID]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_USER_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_USER_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_USER_ID]  DEFAULT (newid()) FOR [USER_ID]
END


End
GO
/****** Object:  Default [DF_USER_INFO_USER_GROUP_ID]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_USER_GROUP_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_USER_GROUP_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_USER_GROUP_ID]  DEFAULT ((0)) FOR [USER_GROUP_ID]
END


End
GO
/****** Object:  Default [DF_USER_INFO_DELETE_FLG]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_DELETE_FLG]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_DELETE_FLG]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_DELETE_FLG]  DEFAULT ((0)) FOR [DELETE_FLG]
END


End
GO
/****** Object:  Default [DF_USER_INFO_FNAME]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_FNAME]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_FNAME]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_FNAME]  DEFAULT ('') FOR [FNAME]
END


End
GO
/****** Object:  Default [DF_USER_INFO_MNAME]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_MNAME]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_MNAME]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_MNAME]  DEFAULT ('') FOR [MNAME]
END


End
GO
/****** Object:  Default [DF_USER_INFO_DEGREE_ID]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_DEGREE_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_DEGREE_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_DEGREE_ID]  DEFAULT ((1)) FOR [DEGREE_ID]
END


End
GO
/****** Object:  Default [DF_USER_INFO_SPECIALTY]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_SPECIALTY]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_SPECIALTY]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_SPECIALTY]  DEFAULT ('') FOR [SPECIALTY]
END


End
GO
/****** Object:  Default [DF_USER_INFO_AFFILIATION]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_AFFILIATION]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_AFFILIATION]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_AFFILIATION]  DEFAULT ('') FOR [AFFILIATION]
END


End
GO
/****** Object:  Default [DF_USER_INFO_ADDRESS1]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_ADDRESS1]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_ADDRESS1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_ADDRESS1]  DEFAULT ('') FOR [ADDRESS1]
END


End
GO
/****** Object:  Default [DF_USER_INFO_ADDRESS2]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_ADDRESS2]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_ADDRESS2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_ADDRESS2]  DEFAULT ('') FOR [ADDRESS2]
END


End
GO
/****** Object:  Default [DF_USER_INFO_CITY]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_CITY]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_CITY]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_CITY]  DEFAULT ('') FOR [CITY]
END


End
GO
/****** Object:  Default [DF_USER_INFO_STATE_ID]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_STATE_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_STATE_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_STATE_ID]  DEFAULT ((0)) FOR [STATE_ID]
END


End
GO
/****** Object:  Default [DF_USER_INFO_STATE_TEXT]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_STATE_TEXT]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_STATE_TEXT]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_STATE_TEXT]  DEFAULT ('') FOR [STATE_TEXT]
END


End
GO
/****** Object:  Default [DF_USER_INFO_ZIP]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_ZIP]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_ZIP]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_ZIP]  DEFAULT ('') FOR [ZIP]
END


End
GO
/****** Object:  Default [DF_USER_INFO_COUNTRY_ID]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_COUNTRY_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_COUNTRY_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_COUNTRY_ID]  DEFAULT ((0)) FOR [COUNTRY_ID]
END


End
GO
/****** Object:  Default [DF_USER_INFO_PHONE]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_PHONE]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_PHONE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_PHONE]  DEFAULT ('') FOR [PHONE]
END


End
GO
/****** Object:  Default [DF_USER_INFO_ORGANIZATION]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_ORGANIZATION]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_ORGANIZATION]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_ORGANIZATION]  DEFAULT ('') FOR [ORGANIZATION]
END


End
GO
/****** Object:  Default [DF_USER_INFO_IS_ACCREDITED]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_IS_ACCREDITED]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_IS_ACCREDITED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_IS_ACCREDITED]  DEFAULT ((0)) FOR [IS_ACCREDITED]
END


End
GO
/****** Object:  Default [DF_USER_INFO_RND_REG_CODE]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_RND_REG_CODE]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_RND_REG_CODE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_RND_REG_CODE]  DEFAULT ('') FOR [RND_REG_CODE]
END


End
GO
/****** Object:  Default [DF_USER_INFO_DATE_CREATED]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_DATE_CREATED]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_DATE_CREATED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_DATE_CREATED]  DEFAULT (getdate()) FOR [DATE_CREATED]
END


End
GO
/****** Object:  Default [DF_USER_INFO_LAST_MODIFIED]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_LAST_MODIFIED]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_LAST_MODIFIED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_LAST_MODIFIED]  DEFAULT (getdate()) FOR [LAST_MODIFIED]
END


End
GO
/****** Object:  Default [DF_USER_INFO_EMAIL_LIST_FLG]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_EMAIL_LIST_FLG]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_EMAIL_LIST_FLG]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_EMAIL_LIST_FLG]  DEFAULT ((0)) FOR [EMAIL_LIST_FLG]
END


End
GO
/****** Object:  Default [DF_USER_INFO_YOUR_ROLE_ID]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_YOUR_ROLE_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_YOUR_ROLE_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_YOUR_ROLE_ID]  DEFAULT ((1)) FOR [YOUR_ROLE_ID]
END


End
GO
/****** Object:  Default [DF_USER_INFO_HEIGHT]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_HEIGHT]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_HEIGHT]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_HEIGHT]  DEFAULT ((0)) FOR [HEIGHT]
END


End
GO
/****** Object:  Default [DF_USER_INFO_GENDER_ID]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_GENDER_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_GENDER_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_GENDER_ID]  DEFAULT ((0)) FOR [GENDER_ID]
END


End
GO
/****** Object:  Default [DF_USER_INFO_FAMILY_STATUS_ID]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_FAMILY_STATUS_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_FAMILY_STATUS_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_FAMILY_STATUS_ID]  DEFAULT ((0)) FOR [FAMILY_STATUS_ID]
END


End
GO
/****** Object:  Default [DF_USER_INFO_DATE_BIRTH]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_DATE_BIRTH]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_DATE_BIRTH]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_DATE_BIRTH]  DEFAULT (getdate()) FOR [DATE_BIRTH]
END


End
GO
/****** Object:  Default [DF_USER_INFO_REGISTRATION_FLG]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_REGISTRATION_FLG]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_REGISTRATION_FLG]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_REGISTRATION_FLG]  DEFAULT ((0)) FOR [REGISTRATION_FLG]
END


End
GO
/****** Object:  Default [DF_USER_INFO_ACCOUNT_CREDITS]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_ACCOUNT_CREDITS]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_ACCOUNT_CREDITS]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_ACCOUNT_CREDITS]  DEFAULT ((0)) FOR [ACCOUNT_CREDITS]
END


End
GO
/****** Object:  Default [DF_USER_INFO_ACCOUTN_FROM_RELATIONSHIP]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_USER_INFO_ACCOUTN_FROM_RELATIONSHIP]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_USER_INFO_ACCOUTN_FROM_RELATIONSHIP]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USER_INFO] ADD  CONSTRAINT [DF_USER_INFO_ACCOUTN_FROM_RELATIONSHIP]  DEFAULT ((0)) FOR [ACCOUNT_FROM_RELATIONSHIP_ID]
END


End
GO
/****** Object:  Default [DF_PAL_STARTS_ACTIVE_FLG]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_PAL_STARTS_ACTIVE_FLG]') AND parent_object_id = OBJECT_ID(N'[dbo].[PAL_STARTS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PAL_STARTS_ACTIVE_FLG]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PAL_STARTS] ADD  CONSTRAINT [DF_PAL_STARTS_ACTIVE_FLG]  DEFAULT (0) FOR [ACTIVE_FLG]
END


End
GO
/****** Object:  Default [DF_PAL_STARTS_COACH_ID]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_PAL_STARTS_COACH_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PAL_STARTS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PAL_STARTS_COACH_ID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PAL_STARTS] ADD  CONSTRAINT [DF_PAL_STARTS_COACH_ID]  DEFAULT (0) FOR [COACH_ID]
END


End
GO
/****** Object:  Default [DF_PAL_STARTS_PROMGRAM_COMPLETION_FLG]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_PAL_STARTS_PROMGRAM_COMPLETION_FLG]') AND parent_object_id = OBJECT_ID(N'[dbo].[PAL_STARTS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PAL_STARTS_PROMGRAM_COMPLETION_FLG]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PAL_STARTS] ADD  CONSTRAINT [DF_PAL_STARTS_PROMGRAM_COMPLETION_FLG]  DEFAULT (0) FOR [PROGRAM_COMPLETION_FLG]
END


End
GO
/****** Object:  Default [DF_PAL_STARTS_PROGRAM_COMPLETION_DATE]    Script Date: 04/15/2012 19:01:01 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_PAL_STARTS_PROGRAM_COMPLETION_DATE]') AND parent_object_id = OBJECT_ID(N'[dbo].[PAL_STARTS]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PAL_STARTS_PROGRAM_COMPLETION_DATE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PAL_STARTS] ADD  CONSTRAINT [DF_PAL_STARTS_PROGRAM_COMPLETION_DATE]  DEFAULT (getdate()) FOR [PROGRAM_COMPLETION_DATE]
END


End
GO
/****** Object:  ForeignKey [FK__aspnet_Pa__Appli__403A8C7D]    Script Date: 04/15/2012 19:01:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pa__Appli__403A8C7D]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Paths]'))
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK_Forums_ForumGroups]    Script Date: 04/15/2012 19:01:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Forums_ForumGroups]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forums]'))
ALTER TABLE [dbo].[Forums]  WITH CHECK ADD  CONSTRAINT [FK_Forums_ForumGroups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[ForumGroups] ([GroupID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Forums_ForumGroups]') AND parent_object_id = OBJECT_ID(N'[dbo].[Forums]'))
ALTER TABLE [dbo].[Forums] CHECK CONSTRAINT [FK_Forums_ForumGroups]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__Appli__7E6CC920]    Script Date: 04/15/2012 19:01:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Us__Appli__7E6CC920]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Users]'))
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Ro__Appli__2D27B809]    Script Date: 04/15/2012 19:01:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Ro__Appli__2D27B809]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Roles]'))
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK_ForumUsersInGroup_ForumUserGroups]    Script Date: 04/15/2012 19:01:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumUsersInGroup_ForumUserGroups]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumUsersInGroup]'))
ALTER TABLE [dbo].[ForumUsersInGroup]  WITH NOCHECK ADD  CONSTRAINT [FK_ForumUsersInGroup_ForumUserGroups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[ForumUserGroups] ([GroupID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumUsersInGroup_ForumUserGroups]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumUsersInGroup]'))
ALTER TABLE [dbo].[ForumUsersInGroup] CHECK CONSTRAINT [FK_ForumUsersInGroup_ForumUserGroups]
GO
/****** Object:  ForeignKey [FK_tbl_TempProduct_tbl_TempCategory]    Script Date: 04/15/2012 19:01:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tbl_TempProduct_tbl_TempCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[tbl_TempProduct]'))
ALTER TABLE [dbo].[tbl_TempProduct]  WITH CHECK ADD  CONSTRAINT [FK_tbl_TempProduct_tbl_TempCategory] FOREIGN KEY([intCategoryId])
REFERENCES [dbo].[tbl_TempCategory] ([intTempCategoryId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tbl_TempProduct_tbl_TempCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[tbl_TempProduct]'))
ALTER TABLE [dbo].[tbl_TempProduct] CHECK CONSTRAINT [FK_tbl_TempProduct_tbl_TempCategory]
GO
/****** Object:  ForeignKey [FK_ForumGroupPermissions_Forums]    Script Date: 04/15/2012 19:01:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumGroupPermissions_Forums]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumGroupPermissions]'))
ALTER TABLE [dbo].[ForumGroupPermissions]  WITH CHECK ADD  CONSTRAINT [FK_ForumGroupPermissions_Forums] FOREIGN KEY([ForumID])
REFERENCES [dbo].[Forums] ([ForumID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumGroupPermissions_Forums]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumGroupPermissions]'))
ALTER TABLE [dbo].[ForumGroupPermissions] CHECK CONSTRAINT [FK_ForumGroupPermissions_Forums]
GO
/****** Object:  ForeignKey [FK_ForumGroupPermissions_ForumUserGroups]    Script Date: 04/15/2012 19:01:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumGroupPermissions_ForumUserGroups]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumGroupPermissions]'))
ALTER TABLE [dbo].[ForumGroupPermissions]  WITH CHECK ADD  CONSTRAINT [FK_ForumGroupPermissions_ForumUserGroups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[ForumUserGroups] ([GroupID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumGroupPermissions_ForumUserGroups]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumGroupPermissions]'))
ALTER TABLE [dbo].[ForumGroupPermissions] CHECK CONSTRAINT [FK_ForumGroupPermissions_ForumUserGroups]
GO
/****** Object:  ForeignKey [FK_ForumTopics_Forums]    Script Date: 04/15/2012 19:01:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumTopics_Forums]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumTopics]'))
ALTER TABLE [dbo].[ForumTopics]  WITH NOCHECK ADD  CONSTRAINT [FK_ForumTopics_Forums] FOREIGN KEY([ForumID])
REFERENCES [dbo].[Forums] ([ForumID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumTopics_Forums]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumTopics]'))
ALTER TABLE [dbo].[ForumTopics] CHECK CONSTRAINT [FK_ForumTopics_Forums]
GO
/****** Object:  ForeignKey [FK_ForumSubforums_Forums]    Script Date: 04/15/2012 19:01:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumSubforums_Forums]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumSubforums]'))
ALTER TABLE [dbo].[ForumSubforums]  WITH CHECK ADD  CONSTRAINT [FK_ForumSubforums_Forums] FOREIGN KEY([ParentForumID])
REFERENCES [dbo].[Forums] ([ForumID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumSubforums_Forums]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumSubforums]'))
ALTER TABLE [dbo].[ForumSubforums] CHECK CONSTRAINT [FK_ForumSubforums_Forums]
GO
/****** Object:  ForeignKey [FK_ForumSubforums_Forums1]    Script Date: 04/15/2012 19:01:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumSubforums_Forums1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumSubforums]'))
ALTER TABLE [dbo].[ForumSubforums]  WITH CHECK ADD  CONSTRAINT [FK_ForumSubforums_Forums1] FOREIGN KEY([SubForumID])
REFERENCES [dbo].[Forums] ([ForumID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumSubforums_Forums1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumSubforums]'))
ALTER TABLE [dbo].[ForumSubforums] CHECK CONSTRAINT [FK_ForumSubforums_Forums1]
GO
/****** Object:  ForeignKey [FK__aspnet_Pr__UserI__239E4DCF]    Script Date: 04/15/2012 19:01:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pr__UserI__239E4DCF]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Profile]'))
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK_ForumNewTopicSubscriptions_Forums]    Script Date: 04/15/2012 19:01:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumNewTopicSubscriptions_Forums]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumNewTopicSubscriptions]'))
ALTER TABLE [dbo].[ForumNewTopicSubscriptions]  WITH NOCHECK ADD  CONSTRAINT [FK_ForumNewTopicSubscriptions_Forums] FOREIGN KEY([ForumID])
REFERENCES [dbo].[Forums] ([ForumID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumNewTopicSubscriptions_Forums]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumNewTopicSubscriptions]'))
ALTER TABLE [dbo].[ForumNewTopicSubscriptions] CHECK CONSTRAINT [FK_ForumNewTopicSubscriptions_Forums]
GO
/****** Object:  ForeignKey [FK_ForumModerators_Forums]    Script Date: 04/15/2012 19:01:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumModerators_Forums]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumModerators]'))
ALTER TABLE [dbo].[ForumModerators]  WITH NOCHECK ADD  CONSTRAINT [FK_ForumModerators_Forums] FOREIGN KEY([ForumID])
REFERENCES [dbo].[Forums] ([ForumID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumModerators_Forums]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumModerators]'))
ALTER TABLE [dbo].[ForumModerators] CHECK CONSTRAINT [FK_ForumModerators_Forums]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__RoleI__31EC6D26]    Script Date: 04/15/2012 19:01:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Us__RoleI__31EC6D26]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]'))
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__UserI__30F848ED]    Script Date: 04/15/2012 19:01:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Us__UserI__30F848ED]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]'))
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Me__Appli__0EA330E9]    Script Date: 04/15/2012 19:01:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Me__Appli__0EA330E9]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Membership]'))
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Me__UserI__0F975522]    Script Date: 04/15/2012 19:01:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Me__UserI__0F975522]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Membership]'))
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__45F365D3]    Script Date: 04/15/2012 19:01:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pe__PathI__45F365D3]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers]'))
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__49C3F6B7]    Script Date: 04/15/2012 19:01:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pe__PathI__49C3F6B7]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]'))
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__UserI__4AB81AF0]    Script Date: 04/15/2012 19:01:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pe__UserI__4AB81AF0]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]'))
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK_ForumMessages_ForumTopics]    Script Date: 04/15/2012 19:01:01 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumMessages_ForumTopics]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumMessages]'))
ALTER TABLE [dbo].[ForumMessages]  WITH NOCHECK ADD  CONSTRAINT [FK_ForumMessages_ForumTopics] FOREIGN KEY([TopicID])
REFERENCES [dbo].[ForumTopics] ([TopicID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumMessages_ForumTopics]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumMessages]'))
ALTER TABLE [dbo].[ForumMessages] CHECK CONSTRAINT [FK_ForumMessages_ForumTopics]
GO
/****** Object:  ForeignKey [FK_ForumPolls_ForumTopics]    Script Date: 04/15/2012 19:01:01 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumPolls_ForumTopics]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumPolls]'))
ALTER TABLE [dbo].[ForumPolls]  WITH NOCHECK ADD  CONSTRAINT [FK_ForumPolls_ForumTopics] FOREIGN KEY([TopicID])
REFERENCES [dbo].[ForumTopics] ([TopicID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumPolls_ForumTopics]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumPolls]'))
ALTER TABLE [dbo].[ForumPolls] CHECK CONSTRAINT [FK_ForumPolls_ForumTopics]
GO
/****** Object:  ForeignKey [FK_ForumSubscriptions_ForumTopics]    Script Date: 04/15/2012 19:01:01 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumSubscriptions_ForumTopics]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumSubscriptions]'))
ALTER TABLE [dbo].[ForumSubscriptions]  WITH NOCHECK ADD  CONSTRAINT [FK_ForumSubscriptions_ForumTopics] FOREIGN KEY([TopicID])
REFERENCES [dbo].[ForumTopics] ([TopicID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumSubscriptions_ForumTopics]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumSubscriptions]'))
ALTER TABLE [dbo].[ForumSubscriptions] CHECK CONSTRAINT [FK_ForumSubscriptions_ForumTopics]
GO
/****** Object:  ForeignKey [FK_USER_INFO_aspnet_Membership]    Script Date: 04/15/2012 19:01:01 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_USER_INFO_aspnet_Membership]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
ALTER TABLE [dbo].[USER_INFO]  WITH CHECK ADD  CONSTRAINT [FK_USER_INFO_aspnet_Membership] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[aspnet_Membership] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_USER_INFO_aspnet_Membership]') AND parent_object_id = OBJECT_ID(N'[dbo].[USER_INFO]'))
ALTER TABLE [dbo].[USER_INFO] CHECK CONSTRAINT [FK_USER_INFO_aspnet_Membership]
GO
/****** Object:  ForeignKey [FK_ForumUploadedFiles_ForumMessages]    Script Date: 04/15/2012 19:01:01 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumUploadedFiles_ForumMessages]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumUploadedFiles]'))
ALTER TABLE [dbo].[ForumUploadedFiles]  WITH NOCHECK ADD  CONSTRAINT [FK_ForumUploadedFiles_ForumMessages] FOREIGN KEY([MessageID])
REFERENCES [dbo].[ForumMessages] ([MessageID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumUploadedFiles_ForumMessages]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumUploadedFiles]'))
ALTER TABLE [dbo].[ForumUploadedFiles] CHECK CONSTRAINT [FK_ForumUploadedFiles_ForumMessages]
GO
/****** Object:  ForeignKey [FK_PAL_STARTS_PROGRAMS]    Script Date: 04/15/2012 19:01:01 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PAL_STARTS_PROGRAMS]') AND parent_object_id = OBJECT_ID(N'[dbo].[PAL_STARTS]'))
ALTER TABLE [dbo].[PAL_STARTS]  WITH CHECK ADD  CONSTRAINT [FK_PAL_STARTS_PROGRAMS] FOREIGN KEY([PROGRAM_ID])
REFERENCES [dbo].[PROGRAMS] ([PROGRAM_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PAL_STARTS_PROGRAMS]') AND parent_object_id = OBJECT_ID(N'[dbo].[PAL_STARTS]'))
ALTER TABLE [dbo].[PAL_STARTS] CHECK CONSTRAINT [FK_PAL_STARTS_PROGRAMS]
GO
/****** Object:  ForeignKey [FK_PAL_STARTS_USER_INFO]    Script Date: 04/15/2012 19:01:01 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PAL_STARTS_USER_INFO]') AND parent_object_id = OBJECT_ID(N'[dbo].[PAL_STARTS]'))
ALTER TABLE [dbo].[PAL_STARTS]  WITH CHECK ADD  CONSTRAINT [FK_PAL_STARTS_USER_INFO] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[USER_INFO] ([USER_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PAL_STARTS_USER_INFO]') AND parent_object_id = OBJECT_ID(N'[dbo].[PAL_STARTS]'))
ALTER TABLE [dbo].[PAL_STARTS] CHECK CONSTRAINT [FK_PAL_STARTS_USER_INFO]
GO
/****** Object:  ForeignKey [FK_PAL_ENTRIES_USER_INFO]    Script Date: 04/15/2012 19:01:01 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PAL_ENTRIES_USER_INFO]') AND parent_object_id = OBJECT_ID(N'[dbo].[PAL_ENTRIES]'))
ALTER TABLE [dbo].[PAL_ENTRIES]  WITH CHECK ADD  CONSTRAINT [FK_PAL_ENTRIES_USER_INFO] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[USER_INFO] ([USER_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PAL_ENTRIES_USER_INFO]') AND parent_object_id = OBJECT_ID(N'[dbo].[PAL_ENTRIES]'))
ALTER TABLE [dbo].[PAL_ENTRIES] CHECK CONSTRAINT [FK_PAL_ENTRIES_USER_INFO]
GO
/****** Object:  ForeignKey [FK_DD_ENTRIES_USER_INFO]    Script Date: 04/15/2012 19:01:01 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DD_ENTRIES_USER_INFO]') AND parent_object_id = OBJECT_ID(N'[dbo].[DD_ENTRIES]'))
ALTER TABLE [dbo].[DD_ENTRIES]  WITH CHECK ADD  CONSTRAINT [FK_DD_ENTRIES_USER_INFO] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[USER_INFO] ([USER_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DD_ENTRIES_USER_INFO]') AND parent_object_id = OBJECT_ID(N'[dbo].[DD_ENTRIES]'))
ALTER TABLE [dbo].[DD_ENTRIES] CHECK CONSTRAINT [FK_DD_ENTRIES_USER_INFO]
GO
/****** Object:  ForeignKey [FK_DD_USERS_USER_INFO]    Script Date: 04/15/2012 19:01:01 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DD_USERS_USER_INFO]') AND parent_object_id = OBJECT_ID(N'[dbo].[DD_USERS]'))
ALTER TABLE [dbo].[DD_USERS]  WITH CHECK ADD  CONSTRAINT [FK_DD_USERS_USER_INFO] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[USER_INFO] ([USER_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DD_USERS_USER_INFO]') AND parent_object_id = OBJECT_ID(N'[dbo].[DD_USERS]'))
ALTER TABLE [dbo].[DD_USERS] CHECK CONSTRAINT [FK_DD_USERS_USER_INFO]
GO
/****** Object:  ForeignKey [FK_ForumPollOptions_ForumPolls]    Script Date: 04/15/2012 19:01:01 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumPollOptions_ForumPolls]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumPollOptions]'))
ALTER TABLE [dbo].[ForumPollOptions]  WITH NOCHECK ADD  CONSTRAINT [FK_ForumPollOptions_ForumPolls] FOREIGN KEY([PollID])
REFERENCES [dbo].[ForumPolls] ([PollID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumPollOptions_ForumPolls]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumPollOptions]'))
ALTER TABLE [dbo].[ForumPollOptions] CHECK CONSTRAINT [FK_ForumPollOptions_ForumPolls]
GO
/****** Object:  ForeignKey [FK_ForumPollAnswers_ForumPollOptions]    Script Date: 04/15/2012 19:01:01 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumPollAnswers_ForumPollOptions]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumPollAnswers]'))
ALTER TABLE [dbo].[ForumPollAnswers]  WITH NOCHECK ADD  CONSTRAINT [FK_ForumPollAnswers_ForumPollOptions] FOREIGN KEY([OptionID])
REFERENCES [dbo].[ForumPollOptions] ([OptionID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ForumPollAnswers_ForumPollOptions]') AND parent_object_id = OBJECT_ID(N'[dbo].[ForumPollAnswers]'))
ALTER TABLE [dbo].[ForumPollAnswers] CHECK CONSTRAINT [FK_ForumPollAnswers_ForumPollOptions]
GO
/****** Object:  ForeignKey [FK_DD_ENTRY_DETAILS_DD_ENTRIES]    Script Date: 04/15/2012 19:01:01 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DD_ENTRY_DETAILS_DD_ENTRIES]') AND parent_object_id = OBJECT_ID(N'[dbo].[DD_ENTRY_DETAILS]'))
ALTER TABLE [dbo].[DD_ENTRY_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_DD_ENTRY_DETAILS_DD_ENTRIES] FOREIGN KEY([DD_ENTRY_ID])
REFERENCES [dbo].[DD_ENTRIES] ([DD_ENTRY_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DD_ENTRY_DETAILS_DD_ENTRIES]') AND parent_object_id = OBJECT_ID(N'[dbo].[DD_ENTRY_DETAILS]'))
ALTER TABLE [dbo].[DD_ENTRY_DETAILS] CHECK CONSTRAINT [FK_DD_ENTRY_DETAILS_DD_ENTRIES]
GO

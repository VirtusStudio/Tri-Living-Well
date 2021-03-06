/*
starting from version 2.2.0 NEW TABLES are added:
ForumTopicSubscriptions is added (stores subscriptions to new topics in a forum)
ForumGroupPermissions is added (usersgroup's permissions)
ForumUserGroups is added (groups of users)
ForumUsersInGroup is added (user in groups) */

CREATE TABLE [dbo].[ForumNewTopicSubscriptions] (
	[UserID] [int] NOT NULL ,
	[ForumID] [int] NOT NULL 
)
GO

CREATE TABLE [dbo].[ForumGroupPermissions] (
	[ForumID] [int] NOT NULL ,
	[GroupID] [int] NOT NULL ,
	[AllowReading] [bit] NOT NULL ,
	[AllowPosting] [bit] NOT NULL
)
GO

CREATE TABLE [dbo].[ForumUserGroups] (
	[GroupID] [int] IDENTITY(1, 1) NOT NULL ,
	[Title] [varchar] (50) NOT NULL
)
GO

CREATE TABLE [dbo].[ForumUsersInGroup] (
	[GroupID] [int] NOT NULL ,
	[UserID] [int] NOT NULL
)
GO

ALTER TABLE [dbo].[ForumNewTopicSubscriptions] ADD 
	PRIMARY KEY 
	(
		[UserID],
		[ForumID]
	)
GO

ALTER TABLE [dbo].[ForumGroupPermissions] ADD 
	PRIMARY KEY  
	(
		[ForumID],
		[GroupID]
	)
GO

ALTER TABLE [dbo].[ForumUserGroups] ADD 
	PRIMARY KEY 
	(
		[GroupID]
	)
GO

ALTER TABLE [dbo].[ForumUsersInGroup] ADD 
	PRIMARY KEY 
	(
		[UserID],
		[GroupID]
	)
GO
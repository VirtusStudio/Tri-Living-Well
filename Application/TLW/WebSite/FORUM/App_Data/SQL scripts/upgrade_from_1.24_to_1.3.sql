/*
1) starting from version 1.3 forum tables are renamed.
   Prefix 'Forum' is added to some tables.
   This is made to prevent conflicts with exisiting website databases, which can already contain tables "Users" or "Administrators"
2) starting from version 1.3 AspNetFrum supports private messaging.
   Table named "ForumPersonalMessages" is beeing added to the database.*/

sp_rename 'dbo.Administrators', 'ForumAdministrators'
go

sp_rename 'dbo.Messages', 'ForumMessages'
go

sp_rename 'dbo.Topics', 'ForumTopics'
go

sp_rename 'dbo.Moderators', 'ForumModerators'
go

sp_rename 'dbo.Subscriptions', 'ForumSubscriptions'
go

sp_rename 'dbo.Users', 'ForumUsers'
go

CREATE TABLE [dbo].[ForumPersonalMessages] (
	[MessageID] [int] IDENTITY (1, 1) NOT NULL ,
	[FromUserID] [int] NOT NULL ,
	[ToUserID] [int] NOT NULL ,
	[Body] [nvarchar] (4000) NOT NULL ,
	[CreationDate] [datetime] NOT NULL ,
	[New] [bit] NOT NULL 
)
GO

ALTER TABLE [dbo].[ForumPersonalMessages] WITH NOCHECK ADD 
	CONSTRAINT [DF_ForumPersonalMessages_New] DEFAULT (1) FOR [New],
	CONSTRAINT [PK_ForumPersonalMessages] PRIMARY KEY  
	(
		[MessageID]
	) 
GO
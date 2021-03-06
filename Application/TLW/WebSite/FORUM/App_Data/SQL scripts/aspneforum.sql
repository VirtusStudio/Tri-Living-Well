/*NOTE: this script creates all the necessary tables, but it DOES NOT create any database*/

CREATE TABLE ForumAdministrators (
	UserID int NOT NULL PRIMARY KEY
)
GO

CREATE TABLE ForumGroups (
	GroupID int IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	GroupName nvarchar (50) NOT NULL 
)
GO

CREATE TABLE Forums (
	ForumID int IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	Title nvarchar (50)  NOT NULL ,
	[Description] nvarchar (255) NOT NULL ,
	Premoderated bit NOT NULL DEFAULT 0,
	GroupID int NOT NULL,
	MembersOnly bit NOT NULL DEFAULT 0,
	OrderByNumber int NOT NULL DEFAULT 0
)
GO

CREATE TABLE ForumSubforums(
	ParentForumID int NOT NULL,
	SubForumID int NOT NULL
)
GO

CREATE TABLE ForumMessages (
	MessageID int IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	TopicID int NOT NULL ,
	UserID int NOT NULL ,
	Body ntext NOT NULL ,
	CreationDate datetime NOT NULL ,
	Visible bit NOT NULL DEFAULT 1 
)
GO

CREATE TABLE ForumModerators (
	UserID int NOT NULL ,
	ForumID int NOT NULL 
)
GO

CREATE TABLE ForumSubscriptions (
	UserID int NOT NULL ,
	TopicID int NOT NULL 
)
GO

CREATE TABLE ForumGroupPermissions (
	ForumID int NOT NULL ,
	GroupID int NOT NULL ,
	AllowReading bit NOT NULL ,
	AllowPosting bit NOT NULL
)
GO

CREATE TABLE ForumUserGroups (
	GroupID int IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	Title nvarchar (50) NOT NULL
)
GO

CREATE TABLE ForumUsersInGroup (
	GroupID int NOT NULL ,
	UserID int NOT NULL
)
GO

CREATE TABLE ForumNewTopicSubscriptions (
	UserID int NOT NULL ,
	ForumID int NOT NULL 
)
GO

CREATE TABLE ForumTopics (
	TopicID int IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	ForumID int NOT NULL ,
	UserID int NOT NULL ,
	[Subject] nvarchar (255) NOT NULL ,
	Visible bit NOT NULL ,
	LastMessageID int NOT NULL DEFAULT (0),
	IsSticky int NOT NULL DEFAULT (0),
	IsClosed bit NOT NULL DEFAULT (0),
	ViewsCount int NOT NULL DEFAULT (0),
	RepliesCount int NOT NULL DEFAULT (0)
)
GO

CREATE TABLE ForumUsers (
	UserID int IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	UserName nvarchar (50) NOT NULL ,
	Email nvarchar (50) NOT NULL ,
	[Password] nvarchar (50) NOT NULL ,
	Homepage nvarchar (50) NULL ,
	Interests nvarchar (255) NULL ,
	PostsCount int NOT NULL DEFAULT (0),
	RegistrationDate datetime NOT NULL DEFAULT (getdate()),
	[Disabled] bit NOT NULL DEFAULT (0),
	ActivationCode nvarchar(50) NOT NULL DEFAULT (''),
	AvatarFileName nvarchar(50) NULL,
	Signature nvarchar(1000) NULL
)
GO

CREATE TABLE ForumPersonalMessages (
	MessageID int IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	FromUserID int NOT NULL ,
	ToUserID int NOT NULL ,
	Body ntext NOT NULL ,
	CreationDate datetime NOT NULL ,
	New bit NOT NULL DEFAULT (1)
)
GO

CREATE TABLE ForumUploadedFiles (
	FileID int IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	FileName nvarchar (255)  NOT NULL ,
	MessageID int NOT NULL ,
	UserID int NOT NULL 
)
GO

CREATE TABLE ForumPolls (
	PollID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	TopicID int NOT NULL,
	Question nvarchar(255) NOT NULL
)
GO

CREATE TABLE ForumPollOptions (
	OptionID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	PollID int NOT NULL,
	OptionText nvarchar(50) NOT NULL
)
GO

CREATE TABLE ForumPollAnswers (
	UserID int NOT NULL,
	OptionID int NOT NULL
)
GO

/*adding complex keys*/
ALTER TABLE ForumPollAnswers ADD 
	PRIMARY KEY 
	(
		UserID,
		OptionID
	)
GO

ALTER TABLE ForumModerators ADD 
	PRIMARY KEY 
	(
		UserID,
		ForumID
	)
GO

ALTER TABLE ForumSubscriptions ADD 
	PRIMARY KEY 
	(
		UserID,
		TopicID
	)
GO

ALTER TABLE ForumNewTopicSubscriptions ADD 
	PRIMARY KEY 
	(
		UserID,
		ForumID
	)
GO

ALTER TABLE ForumGroupPermissions ADD 
	PRIMARY KEY 
	(
		ForumID,
		GroupID
	)
GO

ALTER TABLE ForumUsersInGroup ADD 
	PRIMARY KEY 
	(
		UserID,
		GroupID
	)
GO

ALTER TABLE ForumSubforums ADD 
	PRIMARY KEY 
	(
		ParentForumID,
		SubForumID
	)
GO

INSERT INTO ForumUsers (UserName, Email, Password)
VALUES ('admin', 'admin@none', 'admin')

INSERT INTO ForumAdministrators (UserID)
VALUES (1)

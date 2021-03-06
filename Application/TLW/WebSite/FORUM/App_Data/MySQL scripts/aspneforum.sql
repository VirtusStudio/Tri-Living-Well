/*NOTE: this script creates all the necessary tables, but it DOES NOT create any database*/

CREATE TABLE ForumAdministrators (
	UserID int NOT NULL PRIMARY KEY
);

CREATE TABLE ForumGroups (
	GroupID int auto_increment NOT NULL PRIMARY KEY,
	GroupName varchar (50) NOT NULL 
);

CREATE TABLE Forums (
	ForumID int auto_increment NOT NULL PRIMARY KEY,
	Title varchar (50)  NOT NULL ,
	Description varchar (255) NOT NULL ,
	Premoderated bool NOT NULL DEFAULT 0,
	GroupID int NOT NULL,
	MembersOnly bool NOT NULL DEFAULT 0,
	OrderByNumber int NOT NULL DEFAULT 0
);

CREATE TABLE ForumSubforums(
	ParentForumID int NOT NULL,
	SubForumID int NOT NULL
);

CREATE TABLE ForumMessages (
	MessageID int auto_increment NOT NULL PRIMARY KEY,
	TopicID int NOT NULL ,
	UserID int NOT NULL ,
	Body text NOT NULL ,
	CreationDate datetime NOT NULL ,
	Visible bool NOT NULL DEFAULT 1 
);

CREATE TABLE ForumModerators (
	UserID int NOT NULL ,
	ForumID int NOT NULL 
);

CREATE TABLE ForumSubscriptions (
	UserID int NOT NULL ,
	TopicID int NOT NULL 
);

CREATE TABLE ForumGroupPermissions (
	ForumID int NOT NULL ,
	GroupID int NOT NULL ,
	AllowReading bool NOT NULL ,
	AllowPosting bool NOT NULL
);

CREATE TABLE ForumUserGroups (
	GroupID int auto_increment NOT NULL PRIMARY KEY,
	Title varchar (50) NOT NULL
);

CREATE TABLE ForumUsersInGroup (
	GroupID int NOT NULL ,
	UserID int NOT NULL
);

CREATE TABLE ForumNewTopicSubscriptions (
	UserID int NOT NULL ,
	ForumID int NOT NULL 
);

CREATE TABLE ForumTopics (
	TopicID int auto_increment NOT NULL PRIMARY KEY,
	ForumID int NOT NULL ,
	UserID int NOT NULL ,
	Subject varchar (255) NOT NULL ,
	Visible bool NOT NULL ,
	LastMessageID int NOT NULL DEFAULT 0,
	IsSticky int NOT NULL DEFAULT 0,
	IsClosed bit NOT NULL DEFAULT 0,
	ViewsCount int NOT NULL DEFAULT 0,
	RepliesCount int NOT NULL DEFAULT 0
);

CREATE TABLE ForumUsers (
	UserID int auto_increment NOT NULL PRIMARY KEY,
	UserName varchar (50) NOT NULL ,
	Email varchar (50) NOT NULL ,
	Password varchar (50) NOT NULL ,
	Homepage varchar (50) NULL ,
	Interests varchar (255) NULL ,
	PostsCount int NOT NULL DEFAULT 0,
	RegistrationDate timestamp NOT NULL DEFAULT current_timestamp,
	Disabled bool NOT NULL DEFAULT 0,
	ActivationCode varchar(50) NOT NULL DEFAULT '',
	AvatarFileName varchar(50) NULL,
	Signature varchar(1000) NULL
);

CREATE TABLE ForumPersonalMessages (
	MessageID int auto_increment NOT NULL PRIMARY KEY,
	FromUserID int NOT NULL ,
	ToUserID int NOT NULL ,
	Body text NOT NULL ,
	CreationDate datetime NOT NULL ,
	New bool NOT NULL DEFAULT 1
);

CREATE TABLE ForumUploadedFiles (
	FileID int auto_increment NOT NULL PRIMARY KEY,
	FileName varchar (255) NOT NULL ,
	MessageID int NOT NULL ,
	UserID int NOT NULL 
);

CREATE TABLE ForumPolls (
	PollID int auto_increment NOT NULL PRIMARY KEY,
	TopicID int NOT NULL,
	Question varchar(255) NOT NULL
);

CREATE TABLE ForumPollOptions (
	OptionID int auto_increment NOT NULL PRIMARY KEY,
	PollID int NOT NULL,
	OptionText varchar(50) NOT NULL
);

CREATE TABLE ForumPollAnswers (
	UserID int NOT NULL,
	OptionID int NOT NULL
);

/*adding complex keys*/
ALTER TABLE ForumPollAnswers ADD 
	PRIMARY KEY 
	(
		UserID,
		OptionID
	);

ALTER TABLE ForumModerators ADD 
	PRIMARY KEY 
	(
		UserID,
		ForumID
	);

ALTER TABLE ForumSubscriptions ADD 
	PRIMARY KEY 
	(
		UserID,
		TopicID
	);

ALTER TABLE ForumNewTopicSubscriptions ADD 
	PRIMARY KEY 
	(
		UserID,
		ForumID
	);

ALTER TABLE ForumGroupPermissions ADD 
	PRIMARY KEY 
	(
		ForumID,
		GroupID
	);

ALTER TABLE ForumUsersInGroup ADD 
	PRIMARY KEY 
	(
		UserID,
		GroupID
	);
	
ALTER TABLE ForumSubforums ADD 
	PRIMARY KEY 
	(
		ParentForumID,
		SubForumID
	);

INSERT INTO ForumUsers (UserName, Email, Password)
VALUES ('admin', 'admin@none', 'admin');

INSERT INTO ForumAdministrators (UserID)
VALUES (1);

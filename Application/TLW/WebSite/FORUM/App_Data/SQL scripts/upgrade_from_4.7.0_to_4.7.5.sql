/*
starting from 4.7.5 POLLS are added */

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
/*
starting from 4.7.5 POLLS are added */

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
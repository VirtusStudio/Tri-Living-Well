/* starting from version 3.3.0 SubForums feature is added
 so, new table is added to the db - ForumSubforums.*/

CREATE TABLE ForumSubforums(
	ParentForumID int NOT NULL,
	SubForumID int NOT NULL
)
GO

ALTER TABLE ForumSubforums ADD 
	PRIMARY KEY 
	(
		ParentForumID,
		SubForumID
	)
GO
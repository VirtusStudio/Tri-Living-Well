/* starting from version 4.2.0 file uploading feature added
 so a new table - ForumUploadedFiles - is being added*/

CREATE TABLE ForumUploadedFiles (
	FileID int IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	FileName nvarchar (255)  NOT NULL ,
	MessageID int NOT NULL ,
	UserID int NOT NULL 
)
GO
/* starting from version 4.2.0 file uploading feature added
 so a new table - ForumUploadedFiles - is being added */

CREATE TABLE ForumUploadedFiles (
	FileID int auto_increment NOT NULL PRIMARY KEY,
	FileName varchar (255)  NOT NULL ,
	MessageID int NOT NULL ,
	UserID int NOT NULL 
);
/* starting from version 4.0 a new nullable field is added
 to ForumUsers table - "AvatarFileName"*/

ALTER TABLE ForumUsers ADD
	AvatarFileName varchar(50) NULL;
/* starting from version 4.0 a new nullable field is added
 to ForumUsers table - "AvatarFileName"*/

ALTER TABLE ForumTopics ADD
	IsSticky int NOT NULL DEFAULT 0;
/*starting from version 4.0.3 "sticky" topics feature added
to ForumTopics table - IsSticky (int datatype - for proper sorting)*/

ALTER TABLE ForumTopics ADD
	IsSticky int NOT NULL DEFAULT (0)
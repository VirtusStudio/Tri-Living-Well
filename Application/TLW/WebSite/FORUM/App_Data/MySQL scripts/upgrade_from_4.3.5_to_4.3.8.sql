/* starting from version 4.3.8 "ViewsCount" column added - to count how many usere have read the topic*/

ALTER TABLE ForumTopics ADD
	ViewsCount int NOT NULL DEFAULT 0;
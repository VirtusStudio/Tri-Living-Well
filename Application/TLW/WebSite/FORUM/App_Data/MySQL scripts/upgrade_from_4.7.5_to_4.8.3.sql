/*
starting from 4.8.3 RepliesCount column is added to the ForumTopics table, to prevent joins and speed up things */

ALTER TABLE ForumTopics ADD RepliesCount int NOT NULL DEFAULT 0;

/* also the Body column in forummessages table is changed to text from varchar */

ALTER TABLE ForumMessages MODIFY COLUMN Body text NOT NULL;
ALTER TABLE ForumPersonalMessages MODIFY COLUMN Body text NOT NULL;
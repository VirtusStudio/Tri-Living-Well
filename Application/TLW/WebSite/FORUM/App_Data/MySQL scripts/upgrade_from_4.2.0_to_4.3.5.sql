/* starting from version 4.3.5 you can CLOSE topics, so "IsClosed" column added */

ALTER TABLE ForumTopics ADD IsClosed bool NOT NULL DEFAULT 0;
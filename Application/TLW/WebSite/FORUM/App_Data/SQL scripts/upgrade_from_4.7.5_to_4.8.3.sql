/*
starting from 4.8.3 RepliesCount column is added to the ForumTopics table, to prevent joins and speed up things */

ALTER TABLE ForumTopics ADD RepliesCount int NOT NULL DEFAULT (0)
GO

/* also the Body column in forummessages table is changed to ntext from nvarchar */

ALTER TABLE ForumMessages ALTER COLUMN Body ntext NOT NULL
GO
ALTER TABLE ForumPersonalMessages ALTER COLUMN Body ntext NOT NULL
GO
/* starting from version 3.0.0 NEW COLUMN are added to the ForumUsers table:
 "IsActive"
 "ActivationCode"*/

ALTER TABLE ForumUsers ADD
	Disabled bit NOT NULL DEFAULT 0,
	ActivationCode nvarchar(50) NOT NULL DEFAULT ''
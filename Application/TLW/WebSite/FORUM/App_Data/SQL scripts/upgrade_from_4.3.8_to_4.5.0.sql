/* IMPORTANT!!!!!!!!
starting from version 4.5 the "Password" column has been changed to nvarchar(50) from nvarchar(20) to hold larger MD5 hashes */

ALTER TABLE ForumUsers ALTER COLUMN [Password] nvarchar(50)

/*adding Signature column to ForumUsers*/

ALTER TABLE ForumUsers ADD Signature nvarchar(1000) NULL
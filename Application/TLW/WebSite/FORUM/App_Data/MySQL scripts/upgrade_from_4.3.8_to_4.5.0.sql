/* IMPORTANT!!!!!!!!
starting from version 4.4.4 "Password" column has been changed to varchar(50) from varchar(20) to hold large MD5 hashes */

ALTER TABLE ForumUsers MODIFY COLUMN [Password] varchar(50);

/*adding Signature column to ForumUsers*/

ALTER TABLE ForumUsers ADD Signature varchar(1000) NULL;
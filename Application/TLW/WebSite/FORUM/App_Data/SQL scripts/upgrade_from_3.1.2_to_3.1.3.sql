/* starting from version 3.1.3 some columns are renamed, to comply with MySQL reserved words:
 "Group" column in "ForumGroups" table is renamed to "GroupName"*/

EXEC sp_rename 
    @objname = 'ForumGroups.Group', 
    @newname = 'GroupName', 
    @objtype = 'COLUMN'
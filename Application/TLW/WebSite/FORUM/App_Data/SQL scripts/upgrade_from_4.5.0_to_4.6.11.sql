/*
starting from 4.6.11 forum has a new columm - "MembersOnly" */

ALTER TABLE Forums ADD MembersOnly bit NOT NULL DEFAULT(0)
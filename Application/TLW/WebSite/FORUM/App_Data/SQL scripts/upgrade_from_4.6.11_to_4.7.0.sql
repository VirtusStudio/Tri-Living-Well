/*
starting from 4.7.0 forum has a new columm - "OrderByNumber" */

ALTER TABLE Forums ADD OrderByNumber int NOT NULL DEFAULT (0)
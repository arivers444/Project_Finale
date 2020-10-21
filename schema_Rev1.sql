-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Hall_Of_Fame" (
    "playerID" varchar   NOT NULL,
    "yearID" int(4)   NOT NULL,
    "votedBy" varchar   NOT NULL,
    "ballots" int   NOT NULL,
    "needed" int   NOT NULL,
    "votes" int   NOT NULL,
    "inducted" varchar(1)   NOT NULL,
    "category" varchar   NOT NULL,
    "needed_note" varchar   NOT NULL,
    CONSTRAINT "pk_Hall_Of_Fame" PRIMARY KEY (
        "playerID"
     )
);

CREATE TABLE "Batting" (
    "playerID" varchar   NOT NULL,
    "G" int   NOT NULL,
    "AB" int   NOT NULL,
    "R" int   NOT NULL,
    "H" int   NOT NULL,
    "2B" int   NOT NULL,
    "3B" int   NOT NULL,
    "HR" int   NOT NULL,
    "RBI" int   NOT NULL,
    "SB" int   NOT NULL,
    "CS" int   NOT NULL,
    "BB" int   NOT NULL,
    "SO" int   NOT NULL,
    "IBB" int   NOT NULL,
    "HBP" int   NOT NULL,
    "SH" int   NOT NULL,
    "SF" int   NOT NULL,
    "GIDP" int   NOT NULL,
    "AVG" float   NOT NULL,
    CONSTRAINT "pk_Batting" PRIMARY KEY (
        "playerID"
     )
);

CREATE TABLE "Fielding" (
    "playerID" varchar   NOT NULL,
    "G" int   NOT NULL,
    "GS" int   NOT NULL,
    "InnOuts" int   NOT NULL,
    "PO" int   NOT NULL,
    "A" int   NOT NULL,
    "E" int   NOT NULL,
    "DP" int   NOT NULL,
    "PB" int   NOT NULL,
    "WP" int   NOT NULL,
    "SB" int   NOT NULL,
    "CS" int   NOT NULL,
    "ZR" int   NOT NULL,
    CONSTRAINT "pk_Fielding" PRIMARY KEY (
        "playerID"
     )
);

CREATE TABLE "Pitching" (
    "playerID" varchar   NOT NULL,
    "W" int   NOT NULL,
    "L" int   NOT NULL,
    "G" int   NOT NULL,
    "GS" int   NOT NULL,
    "CG" int   NOT NULL,
    "SHO" int   NOT NULL,
    "SV" int   NOT NULL,
    "IPouts" int   NOT NULL,
    "H" int   NOT NULL,
    "ER" int   NOT NULL,
    "HR" int   NOT NULL,
    "BB" int   NOT NULL,
    "SO" int   NOT NULL,
    "BAOpp" float   NOT NULL,
    "ERA" float   NOT NULL,
    "IBB" int   NOT NULL,
    "WP" int   NOT NULL,
    "HBP" int   NOT NULL,
    "BK" int   NOT NULL,
    "BFP" int   NOT NULL,
    "GF" int   NOT NULL,
    "R" int   NOT NULL,
    "SH" int   NOT NULL,
    "SF" int   NOT NULL,
    "GIDP" int   NOT NULL,
    CONSTRAINT "pk_Pitching" PRIMARY KEY (
        "playerID"
     )
);

CREATE TABLE "Awards" (
    "playerID" varchar   NOT NULL,
    "award_count" int   NOT NULL,
    "year_count" int   NOT NULL,
    "lgID_count" varchar   NOT NULL,
    "tie_count" varchar   NOT NULL,
    "notes_count" varchar   NOT NULL,
    CONSTRAINT "pk_Awards" PRIMARY KEY (
        "playerID"
     )
);

ALTER TABLE "Hall_Of_Fame" ADD CONSTRAINT "fk_Hall_Of_Fame_playerID" FOREIGN KEY("playerID")
REFERENCES "Batting" ("playerID");

ALTER TABLE "Fielding" ADD CONSTRAINT "fk_Fielding_playerID" FOREIGN KEY("playerID")
REFERENCES "Batting" ("playerID");

ALTER TABLE "Pitching" ADD CONSTRAINT "fk_Pitching_playerID" FOREIGN KEY("playerID")
REFERENCES "Hall_Of_Fame" ("playerID");

ALTER TABLE "Awards" ADD CONSTRAINT "fk_Awards_playerID" FOREIGN KEY("playerID")
REFERENCES "Hall_Of_Fame" ("playerID");


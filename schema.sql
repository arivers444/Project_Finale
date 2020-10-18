-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Hall_Of_Fame" (
    "playerID" varchar   NOT NULL,
    "yearID" int   NOT NULL,
    "votedBy" varchar   NOT NULL,
    "ballots" int,
    "needed" int,
    "votes" int,
    "inducted" varchar   NOT NULL,
    "category" varchar   NOT NULL,
    "needed_note",
    CONSTRAINT "pk_Hall_Of_Fame" PRIMARY KEY (
        "playerID","yearID"
     )
);

CREATE TABLE "Batting" (
    "playerID" varchar   NOT NULL,
    "yearID" int   NOT NULL,
    "stint" int   NOT NULL,
    "teamID" varchar   NOT NULL,
    "lgID" varchar   NOT NULL,
    "G" int   NOT NULL,
    "AB" int   NOT NULL,
    "R" int   NOT NULL,
    "H" int   NOT NULL,
    "2B" int   NOT NULL,
    "3B" int   NOT NULL,
    "HR" int   NOT NULL,
    "RBI" int,
    "SB" int,
    "CS" int,
    "BB" int,
    "SO" int,
    "IBB" int,
    "HBP" int,
    "SH" int,
    "SF" int,
    "GIDP" int,
    CONSTRAINT "pk_Batting" PRIMARY KEY (
        "playerID","yearID","stint"
     )
);

CREATE TABLE "Fielding" (
    "playerID" varchar   NOT NULL,
    "yearID" int   NOT NULL,
    "stint" int   NOT NULL,
    "teamID" varchar   NOT NULL,
    "lgID" varchar   NOT NULL,
    "POS" varchar   NOT NULL,
    "G" int   NOT NULL,
    "GS" int,
    "InnOuts" int,
    "PO" int,
    "A" int,
    "E" int,
    "DP" int,
    "PB" int,
    "WP" int,
    "SB" int,
    "CS" int,
    "ZR" int,
    CONSTRAINT "pk_Fielding" PRIMARY KEY (
        "playerID","yearID","stint","POS"
     )
);

CREATE TABLE "Pitching" (
    "playerID" varchar   NOT NULL,
    "yearID" int   NOT NULL,
    "stint" int   NOT NULL,
    "teamID" varchar   NOT NULL,
    "lgID" varchar   NOT NULL,
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
    "BAOpp" float,
    "ERA" float,
    "IBB" int,
    "WP" int,
    "HBP" int,
    "BK" int,
    "BFP" int,
    "GF" int,
    "R" int,
    "SH" int,
    "SF" int,
    "GIDP" int,
    CONSTRAINT "pk_Pitching" PRIMARY KEY (
        "playerID","yearID","stint"
     )
);

CREATE TABLE "Awards" (
    "playerID" varchar   NOT NULL,
    "awardID" varchar   NOT NULL,
    "yearID" int   NOT NULL,
    "lgID" varchar,
    "tie" varchar,
    "notes" varchar,
    CONSTRAINT "pk_Awards" PRIMARY KEY (
        "playerID","awardID","yearID"
     )
);

ALTER TABLE "Hall_Of_Fame" ADD CONSTRAINT "fk_Hall_Of_Fame_playerID_yearID" FOREIGN KEY("playerID", "yearID")
REFERENCES "Batting" ("playerID", "yearID");

ALTER TABLE "Fielding" ADD CONSTRAINT "fk_Fielding_playerID_yearID_stint" FOREIGN KEY("playerID", "yearID", "stint")
REFERENCES "Batting" ("playerID", "yearID", "stint");

ALTER TABLE "Pitching" ADD CONSTRAINT "fk_Pitching_playerID_yearID" FOREIGN KEY("playerID", "yearID")
REFERENCES "Hall_Of_Fame" ("playerID", "yearID");

ALTER TABLE "Awards" ADD CONSTRAINT "fk_Awards_playerID_yearID" FOREIGN KEY("playerID", "yearID")
REFERENCES "Hall_Of_Fame" ("playerID", "yearID");


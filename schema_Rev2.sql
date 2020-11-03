-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "People" (
    "playerID" varchar   NOT NULL,
    "birthCountry" varchar,
    "nameFirst" varchar,
    "nameLast" varchar   NOT NULL,
    "weight" int,
    "height" int,
    "bats" varchar,
    "throws" varchar,
    CONSTRAINT "pk_People" PRIMARY KEY (
        "playerID"
     )
);

CREATE TABLE "Hall_Of_Fame" (
    "playerID" varchar   NOT NULL,
    "yearID" int,
    "votedBy" varchar,
    "ballots" float,
    "needed" float,
    "votes" float,
    "inducted" varchar(1)   NOT NULL,
    "category" varchar,
    "needed_note" varchar,
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
    "RBI" float   NOT NULL,
    "SB" float   NOT NULL,
    "CS" float   NOT NULL,
    "BB" int   NOT NULL,
    "SO" float   NOT NULL,
    "IBB" float   NOT NULL,
    "HBP" float   NOT NULL,
    "SH" float   NOT NULL,
    "SF" float   NOT NULL,
    "GIDP" float   NOT NULL,
    "AVG" float,
    CONSTRAINT "pk_Batting" PRIMARY KEY (
        "playerID"
     )
);

CREATE TABLE "Fielding" (
    "playerID" varchar   NOT NULL,
    "G" int   NOT NULL,
    "GS" float   NOT NULL,
    "InnOuts" float   NOT NULL,
    "PO" int   NOT NULL,
    "A" int   NOT NULL,
    "E" float   NOT NULL,
    "DP" int   NOT NULL,
    "PB" float   NOT NULL,
    "WP" float   NOT NULL,
    "SB" float,
    "CS" float,
    "ZR" float,
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
    "InningsPitchedouts" int   NOT NULL,
    "H_allowed" int   NOT NULL,
    "ER" int   NOT NULL,
    "HR_allowed" int   NOT NULL,
    "BB_allowed" int   NOT NULL,
    "StruckOut" int   NOT NULL,
    "BAOpp" float,
    "ERA" float,
    "IBB_allowed" float   NOT NULL,
    "WP" int   NOT NULL,
    "HitBatsmen" float   NOT NULL,
    "BK" int   NOT NULL,
    "BFP" float   NOT NULL,
    "GF" int   NOT NULL,
    "R_allowed" int   NOT NULL,
    "SH_allowed" float   NOT NULL,
    "SF_allowed" float   NOT NULL,
    "GIDP_pitcher" float   NOT NULL,
    CONSTRAINT "pk_Pitching" PRIMARY KEY (
        "playerID"
     )
);

CREATE TABLE "Awards" (
    "playerID" varchar   NOT NULL,
    "award_count" int   NOT NULL,
    "year_count" int   NOT NULL,
    "lgID_count" int,
    "tie_count" int,
    "notes_count" int,
    CONSTRAINT "pk_Awards" PRIMARY KEY (
        "playerID"
     )
);

ALTER TABLE "Hall_Of_Fame" ADD CONSTRAINT "fk_Hall_Of_Fame_playerID" FOREIGN KEY("playerID")
REFERENCES "People" ("playerID");

ALTER TABLE "Batting" ADD CONSTRAINT "fk_Batting_playerID" FOREIGN KEY("playerID")
REFERENCES "People" ("playerID");

ALTER TABLE "Fielding" ADD CONSTRAINT "fk_Fielding_playerID" FOREIGN KEY("playerID")
REFERENCES "People" ("playerID");

ALTER TABLE "Pitching" ADD CONSTRAINT "fk_Pitching_playerID" FOREIGN KEY("playerID")
REFERENCES "People" ("playerID");

ALTER TABLE "Awards" ADD CONSTRAINT "fk_Awards_playerID" FOREIGN KEY("playerID")
REFERENCES "People" ("playerID");


-- Confirm tables loaded with data
SELECT * FROM "Pitching";
SELECT * FROM "Batting";
SELECT * FROM "Fielding";
SELECT * FROM "Hall_Of_Fame";
SELECT * FROM "Awards";

-- Join database tables to form new table to pass to ML model
SELECT h."playerID",
	h."inducted",
	b."R",
	b."H",
	b."2B",
	b."3B",
	b."HR",
	b."RBI",
	b."SB",
	b."CS",
	b."BB",
	b."SO",
	b."IBB",
	b."SH",
	b."SF",
	b."GIDP",
	b."AVG",
	f."PO",
	f."A",
	f."E",
	f."DP",
	p."W",
	p."L",
	p."CG",
	p."SHO",
	p."SV",
	p."H_allowed",
	p."ER",
	p."HR_allowed",
	p."BB_allowed",
	p."StruckOut",
	p."BAOpp",
	p."ERA",
	p."WP",
	p."HitBatsmen",
	p."BK",
	p."R_allowed",
	p."SH_allowed",
	p."SF_allowed",
	p."GIDP_pitcher",
	a."award_count"
INTO ml_table
FROM "Hall_Of_Fame" AS h
	INNER JOIN "Batting" as b
	ON (h."playerID" = b."playerID")
	INNER JOIN "Fielding" as f
	ON (h."playerID" = f."playerID")
	INNER JOIN "Pitching" as p
	ON (h."playerID" = p."playerID")
	INNER JOIN "Awards" as a
	ON (h."playerID" = a."playerID");


-- Confirm ML table loaded with data
SELECT * FROM "ml_table";


-- Join database tables to form Pitching table to pass to ML model
SELECT h."playerID",
	h."inducted",
	p."W",
	p."L",
	p."CG",
	p."SHO",
	p."SV",
	p."H_allowed",
	p."ER",
	p."HR_allowed",
	p."BB_allowed",
	p."StruckOut",
	p."BAOpp",
	p."ERA",
	p."WP",
	p."HitBatsmen",
	p."BK",
	p."R_allowed",
	p."SH_allowed",
	p."SF_allowed",
	p."GIDP_pitcher",
	a."award_count"
INTO ml_pitching
FROM "Hall_Of_Fame" AS h
	INNER JOIN "Pitching" as p
	ON (h."playerID" = p."playerID")
	INNER JOIN "Awards" as a
	ON (h."playerID" = a."playerID");
	
-- Join database tables to form Batting/Fielding table to pass to ML model
SELECT h."playerID",
	h."inducted",
	b."R",
	b."H",
	b."2B",
	b."3B",
	b."HR",
	b."RBI",
	b."SB",
	b."CS",
	b."BB",
	b."SO",
	b."IBB",
	b."SH",
	b."SF",
	b."GIDP",
	b."AVG",
	f."PO",
	f."A",
	f."E",
	f."DP",
	a."award_count"
INTO ml_BattingFielding
FROM "Hall_Of_Fame" AS h
	INNER JOIN "Batting" as b
	ON (h."playerID" = b."playerID")
	INNER JOIN "Fielding" as f
	ON (h."playerID" = f."playerID")
	INNER JOIN "Awards" as a
	ON (h."playerID" = a."playerID");
	
-- Join database tables to form Batting table to pass to ML model
SELECT h."playerID",
	h."inducted",
	b."R",
	b."H",
	b."2B",
	b."3B",
	b."HR",
	b."RBI",
	b."SB",
	b."CS",
	b."BB",
	b."SO",
	b."IBB",
	b."SH",
	b."SF",
	b."GIDP",
	b."AVG",
	a."award_count"
INTO ml_batting
FROM "Hall_Of_Fame" AS h
	INNER JOIN "Batting" as b
	ON (h."playerID" = b."playerID")
	INNER JOIN "Fielding" as f
	ON (h."playerID" = f."playerID")
	INNER JOIN "Awards" as a
	ON (h."playerID" = a."playerID");
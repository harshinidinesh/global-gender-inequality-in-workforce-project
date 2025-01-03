-- Date: November 23,2024 
-- Group Name: Gender Equality Workforce 
-- By: Harshini Dinesh, Diya Kumar, Shreya Pillamari, Samantha Pierre and Shivani Rajan.


-- SQL CODE FOR CS 3200 Project. Topic is on gender Inquality.
-- We will be looking into Women in Politics and Identifying elements that contribute to gender.
-- inequality.




-- Question 1. Representation in Senior Positions
-- Write an SQL query to find the countries where the share of women in
-- senior positions in the public sector was below 30% in both 2011 and 2021
SELECT c.name AS country
FROM PublicSectorPositions p
JOIN Country c ON p.country_id = c.country_id
WHERE p.senior_positions_2011 < 30 
  AND p.senior_positions_2021 < 30;



-- Question 2. Women in Parliament
-- Retrieve the names of countries where the percentage of women in parliament,
-- is less than the percentage of women in ministerial positions.
SELECT c.name AS country
FROM GovernmentRepresentation g
JOIN Country c ON g.country_id = c.country_id
WHERE g.parliament_positions < g.ministerial_positions;



-- Question 3.  Gender Pay Gap
-- Write a query to list the top 5 countries with the largest gender pay gap,
-- (defined as the inverse of % of median wages of men).
SELECT c.name AS country
FROM EconomicParticipation e
JOIN Country c ON e.country_id = c.country_id
ORDER BY (100 - e.gender_pay_gap) DESC
LIMIT 5;


-- Question 4. Labor Force Participation
-- Identify the countries where female labor force participation is less than 50%.
SELECT c.name AS country
FROM EconomicParticipation e
JOIN Country c ON e.country_id = c.country_id
WHERE e.female_labor_participation < 50;



-- Question 5.  Change in Senior Positions
-- List the countries where the share of women in senior positions in the public sector,
-- increased by at least 10 percentage points between 2011 and 2021.
SELECT c.name AS country
FROM PublicSectorPositions p
JOIN Country c ON p.country_id = c.country_id
WHERE p.senior_positions_2021 - p.senior_positions_2011 >= 10;


-- Question 6. Correlation between Leadership and Pay
-- Find all countries where the share of women in senior positions in the public sector 
-- in 2021 exceeds 40%, but the gender pay gap is greater than 15%.
SELECT c.name AS country
FROM PublicSectorPositions p
JOIN EconomicParticipation e ON p.country_id = e.country_id
JOIN Country c ON p.country_id = c.country_id
WHERE p.senior_positions_2021 > 40
  AND (100 - e.gender_pay_gap) > 15;


-- Question 7. Parental Leave Inequity
-- Write a query to identify countries where the duration of paid leave earmarked for mothers 
-- is at least five times the duration of paid leave earmarked for fathers.
SELECT c.name AS country
FROM FamilyLeave f
JOIN Country c ON f.country_id = c.country_id
WHERE f.leave_mothers >= 5 * f.leave_fathers;


-- Question 8. Low Representation and Pay Gap
-- List countries where women hold less than 20% of ministerial positions and the gender wage 
-- gap exceeds 10%.
SELECT c.name AS country
FROM GovernmentRepresentation g
JOIN EconomicParticipation e ON g.country_id = e.country_id
JOIN Country c ON g.country_id = c.country_id
WHERE g.ministerial_positions < 20
  AND (100 - e.gender_pay_gap) > 10;



-- Question 9. Comparison of Women’s Leadership and Development Index
-- Retrieve the countries where the share of women in senior positions (2021) exceeds 50% 
-- and the Gender Development Index is below 1.
SELECT c.name AS country
FROM PublicSectorPositions p
JOIN EconomicParticipation e ON p.country_id = e.country_id
JOIN Country c ON p.country_id = c.country_id
WHERE p.senior_positions_2021 > 50 
  AND e.gender_development_index < 1;

-- Question 10. regional Disparities
-- Group countries by GEO Region (or a similar field if added) and calculate the average share of 
-- women in senior positions in the public sector for 2011 and 2021. 
-- Identify regions with the largest and smallest improvements over time.

SELECT c.name,
       AVG(p.senior_positions_2021) - AVG(p.senior_positions_2011) AS improvement
FROM PublicSectorPositions p
JOIN Country c ON p.country_id = c.country_id
GROUP BY c.name
ORDER BY improvement DESC;







-- Question 11. Leadership vs. Labor Force Participation
-- Write a query to find countries where women make up at least 50% of senior positions in 2021 
-- but their labor force participation is less than 60%.

SELECT c.name AS country
FROM PublicSectorPositions p
JOIN EconomicParticipation e ON p.country_id = e.country_id
JOIN Country c ON p.country_id = c.country_id
WHERE p.senior_positions_2021 >= 50
  AND e.female_labor_participation < 60;


-- Question 12. Ranking Gender Equality in Leadership
-- Rank countries by the combined average of the share of women in senior positions (2021), 
-- women in ministerial positions, and women in parliament. 
-- Display their rank along with their names and scores.
SELECT c.name AS country,
       (p.senior_positions_2021 + g.ministerial_positions + g.parliament_positions) / 3 AS average_score
FROM PublicSectorPositions p
JOIN GovernmentRepresentation g ON p.country_id = g.country_id
JOIN Country c ON p.country_id = c.country_id
ORDER BY average_score DESC;


-- Question 13. Leadership vs. Family Leave Policies
-- Identify countries where the share of women in senior positions (2021) exceeds 40%, but the 
-- shareable paid family leave weeks most often taken by mothers exceeds 80%.

SELECT c.name AS country
FROM PublicSectorPositions p
JOIN FamilyLeave f ON p.country_id = f.country_id
JOIN Country c ON p.country_id = c.country_id
WHERE p.senior_positions_2021 > 40
  AND f.leave_shareable > 80;



-- Question 14. Combined Inequity Score
-- Create a custom "inequity score" for each country as follows: (100 - % female labor force participation) 
-- + (gender pay gap) + (100 - % of women in senior positions in 2021) + (100 - % of women in parliament).
-- Rank the countries by this score to find the top 5 with the greatest inequities.

SELECT c.name AS country,
       (100 - e.female_labor_participation) +
       (100 - e.gender_pay_gap) +
       (100 - p.senior_positions_2021) +
       (100 - g.parliament_positions) AS inequity_score
FROM EconomicParticipation e
JOIN PublicSectorPositions p ON e.country_id = p.country_id
JOIN GovernmentRepresentation g ON e.country_id = g.country_id
JOIN Country c ON e.country_id = c.country_id
ORDER BY inequity_score DESC
LIMIT 5;

-- Question 15, Procedure 1. Report on Gender Equality
-- Creates a procedure to generate a report on gender equality in a specific country
-- in relation to the database's average data
-- when the user inputs a country's name . 

-- Drop the table if it exists
DROP TABLE IF EXISTS gender_equality_report;
CREATE TABLE IF NOT EXISTS gender_equality_report (
	country_id INT,
	country_name VARCHAR(255),
    gender_wage_gap FLOAT,
    avg_gender_wage_gap FLOAT,
    female_labor_participation FLOAT,
    avg_female_labor_participation FLOAT,
    leave_difference FLOAT,
    ministerial_positions FLOAT,
    avg_ministerial_positions FLOAT,
    parliament_positions FLOAT,
    avg_parliament_positions FLOAT,
    diff_senior_positions FLOAT,
    senior_positions_2011 FLOAT,
    senior_positions_2021 FLOAT
);

DROP PROCEDURE IF EXISTS genderequalityreport;

DELIMITER //
CREATE PROCEDURE genderequalityreport
(
	IN country_name_param varchar(255)
)
BEGIN
	-- variable declarations  
    DECLARE country_id_var int;
    DECLARE country_name_var varchar(255);
    DECLARE gender_wage_gap_var float;
    DECLARE female_labor_participation_var float;
    DECLARE leave_mothers_var float;
	DECLARE leave_fathers_var float;
    DECLARE parliament_positions_var float;
    DECLARE ministerial_positions_var float;
	DECLARE senior_positions_2011_var float;
    DECLARE senior_positions_2021_var float;
    DECLARE avg_gender_wage_gap_var float;
    DECLARE avg_female_labor_participation_var float;
    DECLARE avg_parliament_positions_var float;
    DECLARE avg_ministerial_positions_var float;
    DECLARE avg_senior_positions_2011_var float;
    DECLARE avg_senior_positions_2021_var float;
    DECLARE diff_leave_var float;
    DECLARE diff_senior_positions_var float;
	DECLARE message varchar(255); -- The error message
    
    
    -- selects country_id and country_name from the database
    -- based on the country name the user inputs
    SELECT country_id, name
    INTO country_id_var, country_name_var
    FROM country
    WHERE name = country_name_param;
    
    -- checks if the country exists in the database
    IF country_name_var IS NULL THEN
		SET message = CONCAT('Country "', country_name_param, '" not found in the database.');
		SIGNAL SQLSTATE 'HY000' SET MESSAGE_TEXT = message;
    END IF;
    
    -- selects relevant values into variables, getting country-specific data and averages
    SELECT 
		gender_wage_gap, 
        female_labor_participation 
    INTO 
		gender_wage_gap_var, 
        female_labor_participation_var
    FROM economicparticipation
    WHERE country_id = country_id_var;
    
    -- calculates the average gender wage gap for all countries, ignoring null values
    SELECT AVG(gender_wage_gap) 
    INTO avg_gender_wage_gap_var
    FROM economicparticipation
    WHERE gender_wage_gap IS NOT NULL;
    
	-- calculates the average female labor participation for all countries, ignoring null values
    SELECT AVG(female_labor_participation) 
    INTO avg_female_labor_participation_var
    FROM economicparticipation
    WHERE female_labor_participation IS NOT NULL;
    
	SELECT leave_mothers, leave_fathers
    INTO leave_mothers_var, leave_fathers_var
    FROM familyleave
    WHERE country_id = country_id_var;
    
    SELECT ministerial_positions, parliament_positions
    INTO ministerial_positions_var, parliament_positions_var
    FROM governmentrepresentation
    WHERE country_id = country_id_var;
    
    SELECT 
        AVG(ministerial_positions) as avg_ministerial_positions_var, 
        AVG(parliament_positions) as avg_parliament_positions_var
    INTO 
        avg_ministerial_positions_var, 
        avg_parliament_positions_var
    FROM governmentrepresentation
    WHERE ministerial_positions IS NOT NULL AND parliament_positions IS NOT NULL;
    
    SELECT 
        senior_positions_2011 as senior_positions_2011_var, 
        senior_positions_2021 as senior_positions_2021_var
    INTO 
        senior_positions_2011_var, 
        senior_positions_2021_var
    FROM publicsectorpositions
    WHERE country_id = country_id_var;
    
    -- calculates how much more days of paid family leave mothers get than fathers
    -- since they are expected to rear children
    IF leave_mothers_var IS NOT NULL and leave_fathers_var IS NOT NULL THEN
		SET diff_leave_var = leave_mothers_var - leave_fathers_var;
    ELSE    
        SET diff_leave_var = NULL;
	END IF; 

    -- calculates how many more women have senior positions in the public sector
    -- in 2021 compared to 2011
    -- shows how more women have gotten positions which were previously held by mostly men
	IF senior_positions_2021_var IS NOT NULL and senior_positions_2011_var IS NOT NULL THEN
		SET diff_senior_positions_var = senior_positions_2021_var - senior_positions_2011_var;
    ELSE    
        SET diff_senior_positions_var = NULL;
	END IF; 
	-- No exceptions thrown, so insert the country's records into the report
    -- Generate the report and insert the results into the gender_equality_report table
    INSERT INTO gender_equality_report (
		country_id,
        country_name,
        gender_wage_gap, 
        avg_gender_wage_gap, 
        female_labor_participation, 
        avg_female_labor_participation, 
        leave_difference, 
        ministerial_positions, 
        avg_ministerial_positions, 
        parliament_positions, 
        avg_parliament_positions, 
        diff_senior_positions, 
        senior_positions_2011, 
        senior_positions_2021
    )
    VALUES (
		country_id_var,
        country_name_var, 
        gender_wage_gap_var, 
        avg_gender_wage_gap_var, 
        female_labor_participation_var, 
        avg_female_labor_participation_var, 
        diff_leave_var, 
        ministerial_positions_var, 
        avg_ministerial_positions_var, 
        parliament_positions_var, 
        avg_parliament_positions_var, 
        diff_senior_positions_var, 
        senior_positions_2011_var, 
        senior_positions_2021_var
    );	

END //
DELIMITER ;


-- TEST CASE 1 - generates gender equality report for Austria
call genderequalityreport('Austria');
-- TEST CASE 2 - generates gender equality report for Korea
call genderequalityreport('Korea');
-- TEST CASE 3 - generates gender equality report for Portugal
call genderequalityreport('Portugal');
-- TEST CASE 4 - generates gender equality report for Spain
call genderequalityreport('Spain');

-- Takes in all test cases and
-- returns all country records that are called in one table: gender_equality_report
SELECT * FROM gender_equality_report;

-- Trigger 1 - when a country updates its gender wage gap, the corresponding average wage gap
-- needs to be recalculated and when a country updates its female labor participation data (%), the 
-- corresponding average female labor participation data (%) needs to be recalculated
DROP TRIGGER IF EXISTS update_avg_wage_labor;

DELIMITER //
CREATE TRIGGER update_avg_wage_labor
AFTER UPDATE ON economicparticipation
FOR EACH ROW
BEGIN
    DECLARE avg_gender_wage_gap_var float;
    DECLARE avg_female_labor_participation_var float;
	DECLARE country_id_var int;
    DECLARE country_name_var varchar(255);
    
    -- calculates the new average gender wage gap after an update
    SELECT AVG(gender_wage_gap) 
    INTO avg_gender_wage_gap_var
    FROM economicparticipation
    WHERE gender_wage_gap IS NOT NULL;
    
    -- calculates the new average female labor participation after an update
    SELECT AVG(female_labor_participation) 
    INTO avg_female_labor_participation_var
    FROM economicparticipation
    WHERE female_labor_participation IS NOT NULL;
    
    -- Set the country ID for the updated row
    SET country_id_var = NEW.country_id;

    -- Retrieve the country's name for reporting
    SELECT name INTO country_name_var
    FROM country
    WHERE country_id = country_id_var;
    
    -- checks if the country's gender wage gap was updated
    IF NEW.gender_wage_gap != OLD.gender_wage_gap THEN
        -- Retrieve the country's name for reporting
        UPDATE gender_equality_report
        SET 
			gender_wage_gap = NEW.gender_wage_gap,
			avg_gender_wage_gap = avg_gender_wage_gap_var
        WHERE country_id = country_id_var;
    END IF;
    
     -- checks if the country's female labor participation was updated
    IF NEW.female_labor_participation != OLD.female_labor_participation THEN
        -- Retrieve the country's name for reporting
        UPDATE gender_equality_report
        SET 
			female_labor_participation = NEW.female_labor_participation,
			avg_female_labor_participation = avg_female_labor_participation_var
        WHERE country_id = country_id_var;
    END IF;
    
END //
DELIMITER ;

-- Test cases to check if Trigger 1 runs as needed updating 
-- gender wage gap and female labor participation in the gender equality report table
-- Test Case 1
UPDATE economicparticipation
SET 
	gender_wage_gap = 22.2,
	female_labor_participation = 46.71
WHERE country_id = (SELECT country_id FROM country WHERE name = 'Austria');

-- Test Case 2
UPDATE economicparticipation
SET 
	gender_wage_gap = 17.3,
    female_labor_participation = 54.25
WHERE country_id = (SELECT country_id FROM country WHERE name = 'Korea');

-- Test Case 3
UPDATE economicparticipation
SET 
	gender_wage_gap = 7.7,
    female_labor_participation = 51.33
WHERE country_id = (SELECT country_id FROM country WHERE name = 'Portugal');

-- Test Case 4
UPDATE economicparticipation
SET 
	gender_wage_gap = 5.2,
    female_labor_participation = 57.46
WHERE country_id = (SELECT country_id FROM country WHERE name = 'Spain');

-- Shows how Trigger 1 ran on all four test cases and updated the genderequalityreport table
SELECT * FROM gender_equality_report;

-- Trigger 2 - when a country updates its number of women in ministerial positions, the corresponding average ministerial position
-- needs to be recalculated, and when a country updates its number of women in parliament positions, the corresponding average parliament position
-- needs to be recalculated

DROP TRIGGER IF EXISTS update_avg_min_parl;

DELIMITER //
CREATE TRIGGER update_avg_min_parl
AFTER UPDATE ON governmentrepresentation
FOR EACH ROW
BEGIN
    DECLARE avg_ministerial_positions_var float;
    DECLARE avg_parliament_positions_var float;
	DECLARE country_id_var int;
    DECLARE country_name_var varchar(255);
    
    -- calculates the new average ministerial positions after an update
    SELECT AVG(ministerial_positions) 
    INTO avg_ministerial_positions_var
    FROM governmentrepresentation
    WHERE ministerial_positions IS NOT NULL;
    
    -- calculates the new average parliament positions after an update
    SELECT AVG(parliament_positions) 
    INTO avg_parliament_positions_var
    FROM governmentrepresentation
    WHERE parliament_positions IS NOT NULL;
    
    -- Set the country ID for the updated row
    SET country_id_var = NEW.country_id;

    -- Retrieve the country's name for reporting
    SELECT name INTO country_name_var
    FROM country
    WHERE country_id = country_id_var;
    
    -- checks if the country's women in ministerial positions was updated
    IF NEW.ministerial_positions != OLD.ministerial_positions THEN
        -- Retrieve the country's name for reporting
        UPDATE gender_equality_report
        SET 
			ministerial_positions = NEW.ministerial_positions,
			avg_ministerial_positions = avg_ministerial_positions_var
        WHERE country_id = country_id_var;
    END IF;
    
     -- checks if the country's women in parliament positions was updated
    IF NEW.parliament_positions != OLD.parliament_positions THEN
        -- Retrieve the country's name for reporting
        UPDATE gender_equality_report
        SET 
			parliament_positions = NEW.parliament_positions,
			avg_parliament_positions = avg_parliament_positions_var
        WHERE country_id = country_id_var;
    END IF;
    
END //
DELIMITER ;
-- Test cases to check if Trigger 2 runs as needed updating 
-- ministerial positions and parliament positions
-- Test Case 1
UPDATE governmentrepresentation
SET 
    ministerial_positions = 26,
    parliament_positions = 41
WHERE country_id = (SELECT country_id FROM country WHERE name = 'Austria');

-- Test Case 2
UPDATE governmentrepresentation
SET 
    ministerial_positions = 21,
    parliament_positions = 27.2
WHERE country_id = (SELECT country_id FROM country WHERE name = 'Korea');

-- Test Case 3
UPDATE governmentrepresentation
SET 
    ministerial_positions = 44.1,
    parliament_positions = 35.7
WHERE country_id = (SELECT country_id FROM country WHERE name = 'Portugal');

-- Test Case 4
UPDATE governmentrepresentation
SET 
    ministerial_positions = 61.4,
    parliament_positions = 45.6
WHERE country_id = (SELECT country_id FROM country WHERE name = 'Spain');

-- Shows how Trigger 2 ran on all four test cases and updated the genderequalityreport table
SELECT * FROM gender_equality_report;

-- Question 16, Procedure 2. 
-- Identifies countries that give equal days in family leave for 
-- both mothers and fathers, ensuring fairness among genders.
DROP PROCEDURE IF EXISTS countriesfamilyleaveforboth;

DELIMITER //
CREATE PROCEDURE countriesfamilyleaveforboth
(
	IN country_name_param varchar(255)
)
BEGIN
	DECLARE leave_mothers INT;
    DECLARE leave_fathers INT;
    DECLARE country_name_var varchar(255);
    DECLARE message varchar(255);
    
    -- gets the number of leave days for mothers and fathers when the data is not null
    SELECT c.name, fl.leave_mothers, fl.leave_fathers
    INTO country_name_var, leave_mothers, leave_fathers
    FROM country c
    JOIN familyleave fl ON c.country_id = fl.country_id
    WHERE c.name = country_name_param
		AND fl.leave_mothers IS NOT NULL 
		AND fl.leave_fathers IS NOT NULL;
	
    -- checks if both mothers and fathers have equal leave days
    IF leave_mothers IS NULL OR leave_fathers IS NULL THEN
		SET message = 'No data found for the given country in the database, so cannot identify if family leave days are equal for both mothers and fathers. Therefore, disparities might exist.';
		SELECT country_name_param as country, leave_mothers, leave_fathers, message;
    ELSEIF leave_mothers = leave_fathers THEN
		SET message = 'The family leave days are equal for both mothers and fathers, so disparities might not exist.';
		SELECT country_name_param as country, leave_mothers, leave_fathers, message;
	ELSEIF leave_mothers != leave_fathers THEN
		SET message = 'The family leave days are not equal for both mothers and fathers, so disparities exist.';
		SELECT country_name_param as country, leave_mothers, leave_fathers, message;
    END IF;
        
END //
DELIMITER ;

-- Test case on Australia -- contains unequal family leave days
call countriesfamilyleaveforboth('Australia');
-- Test case on Czech - contains null data so message should result accordingly
call countriesfamilyleaveforboth('Czech');
-- Test case on Germany -- contains unequal family leave days
call countriesfamilyleaveforboth('Germany');
-- Test case on China -- country not in the database
call countriesfamilyleaveforboth('China');
-- Test case on Spain - the only country that gives both genders equal days of family leave
call countriesfamilyleaveforboth('Spain');
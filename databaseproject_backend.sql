CREATE DATABASE if not exists gender_development_database;
USE gender_development_database;


CREATE TABLE if not exists Country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE if not exists PublicSectorPositions (
    country_id INT NOT NULL,
    senior_positions_2011 FLOAT,
    senior_positions_2021 FLOAT,
    FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

CREATE TABLE if not exists GovernmentRepresentation (
    country_id INT NOT NULL,
    ministerial_positions FLOAT,
    parliament_positions FLOAT,
    FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

CREATE TABLE if not exists EconomicParticipation (
    country_id INT NOT NULL,
    gender_wage_gap FLOAT,
    female_labor_participation FLOAT,
    gender_development_index FLOAT,
    gender_pay_gap FLOAT,
    FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

CREATE TABLE if not exists FamilyLeave (
    country_id INT NOT NULL,
    leave_mothers FLOAT,
    leave_fathers FLOAT,
    leave_shareable FLOAT,
    FOREIGN KEY (country_id) REFERENCES Country(country_id)
);


INSERT INTO Country (country_id, name) VALUES (1, 'Australia');
INSERT INTO Country (country_id, name) VALUES (2, 'Austria');
INSERT INTO Country (country_id, name) VALUES (3, 'Belgium');
INSERT INTO Country (country_id, name) VALUES (4, 'Canada');
INSERT INTO Country (country_id, name) VALUES (5, 'Chile');
INSERT INTO Country (country_id, name) VALUES (6, 'Colombia');
INSERT INTO Country (country_id, name) VALUES (7, 'Costa Rica');
INSERT INTO Country (country_id, name) VALUES (8, 'Czechia');
INSERT INTO Country (country_id, name) VALUES (9, 'Denmark');
INSERT INTO Country (country_id, name) VALUES (10, 'Estonia');
INSERT INTO Country (country_id, name) VALUES (11, 'Finland');
INSERT INTO Country (country_id, name) VALUES (12, 'France');
INSERT INTO Country (country_id, name) VALUES (13, 'Germany');
INSERT INTO Country (country_id, name) VALUES (14, 'Greece');
INSERT INTO Country (country_id, name) VALUES (15, 'Hungary');
INSERT INTO Country (country_id, name) VALUES (16, 'Iceland');
INSERT INTO Country (country_id, name) VALUES (17, 'Ireland');
INSERT INTO Country (country_id, name) VALUES (18, 'Israel');
INSERT INTO Country (country_id, name) VALUES (19, 'Italy');
INSERT INTO Country (country_id, name) VALUES (20, 'Japan');
INSERT INTO Country (country_id, name) VALUES (21, 'Korea');
INSERT INTO Country (country_id, name) VALUES (22, 'Latvia');
INSERT INTO Country (country_id, name) VALUES (23, 'Lithuania');
INSERT INTO Country (country_id, name) VALUES (24, 'Luxembourg');
INSERT INTO Country (country_id, name) VALUES (25, 'Mexico');
INSERT INTO Country (country_id, name) VALUES (26, 'Netherlands');
INSERT INTO Country (country_id, name) VALUES (27, 'New Zealand');
INSERT INTO Country (country_id, name) VALUES (28, 'Norway');
INSERT INTO Country (country_id, name) VALUES (29, 'Poland');
INSERT INTO Country (country_id, name) VALUES (30, 'Portugal');
INSERT INTO Country (country_id, name) VALUES (31, 'Slovak Rep.');
INSERT INTO Country (country_id, name) VALUES (32, 'Slovenia');
INSERT INTO Country (country_id, name) VALUES (33, 'Spain');
INSERT INTO Country (country_id, name) VALUES (34, 'Sweden');
INSERT INTO Country (country_id, name) VALUES (35, 'Switzerland');
INSERT INTO Country (country_id, name) VALUES (36, 'Türkiye');
INSERT INTO Country (country_id, name) VALUES (37, 'United Kingdom');
INSERT INTO Country (country_id, name) VALUES (38, 'United States');
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (1, NULL, NULL);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (2, 31.2, 40.5);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (3, 11.9, 25.3);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (4, NULL, NULL);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (5, NULL, NULL);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (6, NULL, NULL);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (7, NULL, NULL);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (8, 27.8, 28.3);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (9, 22.2, 26.4);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (10, 41.9, 48.5);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (11, 24.4, 56.3);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (12, 30.1, 31.1);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (13, 15.6, 30.2);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (14, 41.7, 56.4);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (15, 26.0, 18.7);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (16, 39.5, 50.0);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (17, 22.1, 33.3);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (18, NULL, NULL);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (19, 31.5, 32.1);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (20, NULL, NULL);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (21, NULL, NULL);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (22, 50.0, 55.0);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (23, 45.4, 52.2);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (24, 15.0, 28.1);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (25, NULL, NULL);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (26, 26.1, 39.9);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (27, NULL, NULL);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (28, 35.0, 39.7);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (29, 40.8, 45.2);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (30, 39.0, 50.8);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (31, 53.1, 49.8);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (32, 55.3, 57.1);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (33, 39.9, 43.1);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (34, 44.8, 48.9);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (35, NULL, NULL);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (36, 5.3, 17.7);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (37, 27.8, 34.8);
INSERT INTO PublicSectorPositions (country_id, senior_positions_2011, senior_positions_2021) VALUES (38, NULL, NULL);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (1, NULL, NULL);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (2, 25.0, 40.4);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (3, 57.1, 42.7);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (4, NULL, NULL);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (5, NULL, NULL);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (6, NULL, NULL);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (7, NULL, NULL);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (8, 7.1, 26.0);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (9, 31.8, 43.6);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (10, 42.9, 27.7);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (11, 64.3, 45.5);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (12, 35.3, 37.8);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (13, 50.0, 35.1);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (14, 10.5, 21.0);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (15, 9.1, 13.1);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (16, 41.7, 47.6);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (17, 23.1, 23.1);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (18, NULL, NULL);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (19, 26.7, 32.3);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (20, NULL, NULL);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (21, NULL, NULL);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (22, 42.9, 29.0);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (23, 42.9, 28.4);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (24, 37.5, 35.0);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (25, NULL, NULL);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (26, 50.0, 40.7);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (27, NULL, NULL);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (28, 50.0, 46.2);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (29, 17.6, 28.3);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (30, 41.2, 36.1);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (31, 14.3, 22.0);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (32, 38.5, 37.8);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (33, 63.6, 42.4);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (34, 47.8, 46.4);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (35, NULL, NULL);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (36, 5.9, 17.4);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (37, 33.3, 34.5);
INSERT INTO GovernmentRepresentation (country_id, ministerial_positions, parliament_positions) VALUES (38, 33.3, 29.4);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (1, NULL, NULL, NULL, NULL);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (2, 12.143697036, 56.75, 0.972, 12.1);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (3, 1.10677769575472, 50.55, 0.975, 1.1);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (4, NULL, NULL, NULL, NULL);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (5, NULL, NULL, NULL, NULL);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (6, NULL, NULL, NULL, NULL);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (7, NULL, NULL, NULL, NULL);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (8, 13.170419834, 51.95, 0.988, 13.6);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (9, 5.8370885927, 59.52, 0.981, 5.8);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (10, 20.520922353, 61.14, 1.022, 20.5);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (11, 17.516859387, 57.72, 0.989, 14.6);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (12, 11.558211206, 52.78, 0.986, 9.3);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (13, 14.380132185, 56.45, 0.966, 14.4);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (14, 8.0841903851, 45.19, 0.969, 8.1);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (15, 13.335555556, 53.98, 0.989, 12.7);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (16, 8.69431875780435, 70.07, 0.975, 8.7);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (17, 7.4708014499, 59.87, 0.991, 2.0);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (18, NULL, NULL, NULL, NULL);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (19, 3.2885733835, 41.27, 0.969, 3.3);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (20, NULL, NULL, NULL, NULL);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (21, NULL, NULL, NULL, NULL);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (22, 24.914726383, NULL, 1.022, 24.9);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (23, 10.34326718, 57.08, 1.028, 10.3);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (24, 0.441118842603704, 57.82, 0.993, NULL);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (25, NULL, NULL, NULL, NULL);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (26, 14.760322734, 61.72, 0.96, 14.8);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (27, NULL, NULL, NULL, NULL);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (28, 4.5200892857, 61.77, 0.986, 4.5);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (29, 10.170974578, 51.58, 1.009, 10.2);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (30, 6.0972381541, 55.29, 0.998, 6.1);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (31, 13.808194646, 56.29, 1.002, 13.8);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (32, 8.3182733516, 53.85, 0.999, 8.3);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (33, 6.7220834134, 52.63, 0.988, 6.7);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (34, 7.2972972973, 63.38, 0.983, 7.7);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (35, NULL, NULL, NULL, NULL);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (36, 9.980806142, 35.35, 0.941, NULL);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (37, 13.255172414, NULL, 0.976, 14.5);
INSERT INTO EconomicParticipation (country_id, gender_wage_gap, female_labor_participation, gender_development_index, gender_pay_gap) VALUES (38, 16.389351082, NULL, 1.005, 17.0);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (1, 12.0, 2.0, 6.0);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (2, 24.66667, 12.99667, 35.33333);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (3, 32.33333, 20.333, NULL);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (4, 21.0, 5.0, 30.0);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (5, 30.0, 1.0, NULL);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (6, 18.0, 2.0, NULL);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (7, 17.32, 1.6, NULL);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (8, 28.0, 2.0, 40.62595);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (9, 18.0, 2.0, 32.0);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (10, 14.28571, 4.285714, 67.85714);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (11, 17.5, 9.0, 143.53);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (12, 42.0, 31.0, NULL);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (13, 22.6666, 8.7, 35.3334);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (14, 51.6666, 11.4666, NULL);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (15, 24.0, 1.0, 136.0);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (16, 26.0, 20.0, 6.0);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (17, 31.0, 7.0, NULL);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (18, 15.0, NULL, NULL);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (19, 21.7, 2.0, 26.0);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (20, 58.0, 52.0, NULL);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (21, 64.85714, 54.0, NULL);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (22, 16.0, 1.428571, 78.0);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (23, 18.0, 4.0, 44.0);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (24, 46.0, 28.0, NULL);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (25, 12.0, 1.0, NULL);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (26, 16.0, 6.0, NULL);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (27, 26.0, NULL, NULL);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (28, 18.0, 15.0, 68.0);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (29, 20.0, 2.0, 32.0);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (30, 23.28571, 22.28571, 6.854286);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (31, 34.0, 28.0, 102.0);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (32, 19.33, 4.285714, 32.81);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (33, 16.0, 16.0, NULL);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (34, 12.85714, 14.28571, 42.85714);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (35, 14.0, 2.0, NULL);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (36, 16.0, 1.0, NULL);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (37, 39.0, 2.0, NULL);
INSERT INTO FamilyLeave (country_id, leave_mothers, leave_fathers, leave_shareable) VALUES (38, NULL, NULL, NULL);


-- DELETE FROM FamilyLeave;
-- DELETE FROM EconomicParticipation;
-- DELETE FROM GovernmentRepresentation;
-- DELETE FROM PublicSectorPositions;
-- DELETE FROM Country;





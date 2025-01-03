# Gender Inequality in the Global Worforce
Introduction & Purpose

Gender inequality is a significant global issue affecting economic, political, and social systems. This project explores key factors contributing to these disparities, including workforce representation, economic participation, and family leave policies, using the gender_development_database to track trends and insights and inform the public.

The SQL database focuses on gender inequality across various countries, analyzing key metrics like gender wage gaps, labor force participation, public sector leadership, and policy inequities. It allows users to query specific data, compare countries, and generate tailored gender equality reports. With interconnected tables, database procedures, and triggers and updates, the system ensures data accuracy and consistency.

By connecting policy, economics, and representation, this tool helps deepen our understanding of gender inequality and supports efforts to address these inequities effectively.

Techniques used

Data Cleaning
Data Loading and Merging
Database Design
- Backend SQL
- Queries
- Procedures
- Tests
- Triggers
- ER diagram
  
Insights

Our database, gender_development_database, is used to analyze data related to gender development metrics across different countries. The country table is the central entity in this database- each county is uniquely identified by country_id and name. This table is the reference point for all the other tables, creating a one-to-many relationship. The table FamilyLeave has information about family leave policies, with leave_mothers, leave_fathers, and leave_shareable. The table PublicSectorPositions focuses on gender representation in public sector roles- and uses two timeframes (2011 and 2021)  to provide analysis overtime of public sector roles. The table GovernmentRepresentation tracks women’s participation in government positions. The table for EconomicParticipation provides information on a few economic standards: gender wage gap, female labor force participation, gender development index, and gender pay gap. Every single one of these tables has a relationship with the country table, and each table contains a foreign key, country_id, which references the primary key in the country table. This ensures that all data in the related tables are connected to specific countries. The gender_equality_report table generates reports on gender equality for specific countries, including metrics like gender_wage_gap, female_labor participation, and calculated values like leave_difference. It references the Country table through country_id and provides insights for comparing companies. Essentially, this table helps analyze gender development metrics.

To comprehensively analyze global gender inequality in the workforce, we gathered and processed data from multiple reputable sources, which made sure we had a strong base for our research. Our primary dataset included information on variables such as women’s representation in public sector leadership, government roles, economic participation, and family leave policies across various countries. This data was sourced from international databases, such as World Bank, UN Women, and OECD. To maintain the reliability of our data, we prioritized that it be from within the last five years. Before breaking down our data in MySQL, we gathered as much qualitative insights into gender development indices, pay gaps, labor force participation rates, and family leave durations. To ensure accuracy we cross referenced the data against official publications and reports. Data discrepancies or missing entries were also noted for potential imputation or exclusion. This data was broken down into a few subcategories (country information, public sector representation, government representation, economic indicators, and family leave entitlements) that became cleaned and structured data which was exported as a CSV file, and served as the input for the backend database. 

The data generated through this process of manual web scraping and inserting was compiled and then placed into a SQL backend file to generate the database with the data loaded. The backend of our project was primarily built using MySQL. We broke down the data into easily approachable variables such as Country, which stores the country ID and name of the country, PublicSectorPositions, which tracks the percentage of women in senior public sector positions, GovernmentRepresentation, the variable that records the percentage of women in ministerial and parliamentary positions, EconomicParticipation, which follows the values of paid family leave for mothers, fathers, and shareable leave. To populate the database, we used structured INSERT statements based on the preprocessed data. With values that we couldn’t generate, we initialized them with NULL because we still needed those spots to be filled in some way. This way of creating the backend of the project ensures that the database is scalable and able to handle queries and analysis.

We created our SQL database with the ability for users to ask the following questions (among others) regarding our gender inequality data:

1. Which countries had lower than 30%  of women in senior positions in the public sector in both 2011 and 2021?
2. Which countries had a lower percentage of women in parliament than the percentage of women in ministerial positions?
3. What were the top 5 countries with the largest gender pay gap?
4. Which countries had a female labor force participation below 50%?
5. In which countries did the share of women in senior positions in the public sector, increase by at least 10 percentage points between 2011 and 2021?
6. Which countries had their share of women in senior positions in the public sector in 2021 exceed 40%, while the gender pay gap was greater than 15%?
7. In which countries did the duration of paid leave earmarked for mothers be at least five times the duration of paid leave earmarked for fathers?
8. In which countries did women hold less than 20% of ministerial positions while the gender wage gap exceeded 10%?
9. In which countries did the share of women in senior positions (2021) exceed 50% while the Gender Development Index was below 1?
10. Can you  group countries by GEO Region, calculate the average share of women in senior positions in the public sector for 2011 and 2021, and identify regions with the largest and smallest improvements over time?
11. Which countries have women making up at least 50% of senior positions in 2021 but their labor force participation is less than 60%?
12. Can you rank countries by the combined average of the share of women in senior positions (2021), women in ministerial positions, and women in parliament?
13. In which countries do the share of women in senior positions (2021) exceed 40%, and the shareable paid family leave weeks most often taken by mothers exceeds 80%.?
14. What is the inequity score for each country and can you rank them to show the top 5 countries with the greatest inequities?

To answer these questions, we used a series of join, group by, ordering, and aggregation queries. We then created two procedures so that users can retrieve the information they need from our database. Our first procedure called ‘gender_equality_report’ was created so that when a user inputs a specific country name, they can get a report on gender equality in that specific country in relation to the database's average data. For example, if a user inputted ‘Korea’ as a country that they wanted a gender equality report on, the procedure would run and generate a report with its country_id, country_name, gender_wage_gap, avg_gender_wage_gap, female_labor_participation, avg_female_labor_participation, and more. 

To ensure that this procedure runs smoothly we also created two triggers that recalculates average values (i.e. average gender wage gap, average women in ministerial positions)  when a country updates its specific value (i.e. Korea’s gender wage gap, Korea’s number of women in ministerial positions). Finally, we created another procedure called ‘countriesfamilyleaveforboth’ which identifies whether a user-inputted country gives equal or unequal days in family leave for both mothers and fathers. This helps users get data and compare countries with large versus small disparities or gender inequalities. We also created multiple test cases to see if both procedures work accurately and efficiently.

Code structure

A database which contain procedures, tests, triggers, and queries designed to help the user access gender inequality data on various countries and answer their questions. Could be easily run through MySQL. This project also includes csv files for datasets we used, and pdf files for our comprehensive final report and presentation.

Sources

The primary datasets used in our report were found on this website and its various charts' csv files:
www.oecd.org/en/topics/gender-equality-and-work.html.

Contributions

Harshini Dinesh (4381hdinesh@gmail.com)
Found the OECD websites where we got our initial data sources from, added data to the spreadsheet, and edited the queries to remove any errors.
Created the procedures, triggers, and multiple test cases in SQL, wrote the User Cases section of the project report, and contributed to the slideshow.

Samantha Pierre (samanthapierre800@gmail.com)
Created the SQL Questions that we used to construct our queries, created queries 1-14, and helped find data sources.
Hosted multiple zoom meetings for project check-ins, added SQL comments, and contributed to the slideshow. 

Shreya Pillamari (spillamari26@gmail.com)
Created the backend script creating the categories and filling the insert statements, helped find data sources.
Wrote the Data sources, Methods, and Conclusion sections of the project report.

Diya Kumar (emaildiyakm@gmail.com)
Created the ER Diagram and helped find data sources.
Wrote the Introduction, Abstract, and Database Design part of the project report, and contributed to the slideshow. 

Shivani Rajan (Shivanirajan23@gmail.com)
Created the ER Diagram and helped find data sources.
Wrote the Introduction, Abstract, and Database Design section of the project report, and contributed to the slideshow.

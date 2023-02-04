SELECT *
FROM [dbo].[fbi_data_project]

--We want to see only the violence related crimes, the year, total arrests and the population.
SELECT id, population, total_arrests, homicide, rape, robbery, aggravated_assault, violent_crime, other_assault, other_sex_offenses, against_family
FROM [dbo].[fbi_data_project]

--Now we want to see how much percentage of the population was arrested each year, ordered by the year ascending.
SELECT year, population, total_arrests, (total_arrests/population)*100 as ArrestedPercetage 
FROM [dbo].[fbi_data_project]
ORDER BY year

--This didn't work because the datatypes of those two columns were integers so we need to change them.
--We run the code again and we get the percentages now along with the ROUND function to give us a smaller number of percentage.
SELECT year, population, total_arrests, ROUND(CAST((total_arrests/population)*100 AS DECIMAL(10, 2)), 2) as ArrestedPercentage 
FROM [dbo].[fbi_data_project]
ORDER BY year

--We now want to check which year had the highest number of homicide arrests
SELECT TOP 1 year, MAX(homicide) as highest_homicide
FROM [dbo].[fbi_data_project]
GROUP BY year
ORDER BY highest_homicide DESC

--We can also try and see how many arrests against fraud were made in 2010
SELECT year, fraud 
FROM [dbo].[fbi_data_project]
WHERE year like '2010'

--We can try and see which year had the highest arrests for burglary
SELECT TOP 1 year, MAX(burglary) as highest_burglary
FROM [dbo].[fbi_data_project]
GROUP BY year
ORDER BY highest_burglary DESC

--We can also try and see which year had the highest arrests for arson
SELECT TOP 1 year, MAX(arson) as highest_arson
FROM [dbo].[fbi_data_project]
GROUP BY year
ORDER BY highest_arson DESC

--We can again try and see which year had the highest arrests for forgery
SELECT TOP 1 year, MAX(forgery) as highest_forgery
FROM [dbo].[fbi_data_project]
GROUP BY year
ORDER BY highest_forgery DESC

--We can try and see which years had the highest arrests for robbery
SELECT TOP 22 year, MAX(robbery) as highest_robbery
FROM [dbo].[fbi_data_project]
GROUP BY year
ORDER BY highest_robbery DESC

--Here it would be useful to see how much the homicide arrests have increased or decreased during the 22 years we have
SELECT TOP 22 year, homicide
FROM [dbo].[fbi_data_project]
ORDER BY year ASC

--Another useful thing we could observe would be the number of arrests every different decade.
SELECT SUM(total_arrests) as nineties_arrests
FROM [dbo].[fbi_data_project]
WHERE year < 2001

SELECT SUM(total_arrests) as two_thousands_arrests
FROM [dbo].[fbi_data_project]
WHERE year >= 2001 AND year <= 2010

SELECT SUM(total_arrests) as two_thousand_tens_arrests
FROM [dbo].[fbi_data_project]
WHERE year >= 2011 AND year <= 2020

SELECT SUM(homicide) as homicide_sum
FROM [dbo].[fbi_data_project]

--We can now find out what the highest crimes were during those 22 years we have in our dataset
SELECT SUM(homicide) as sum_homicide, SUM(rape) as sum_rape, SUM(robbery) as sum_robbery, SUM(aggravated_assault) as sum_aggravated_assault,
SUM(burglary) as sum_burglary, SUM(larceny) as sum_larceny, SUM(motor_vehicle_theft) as sum_motor_vehicle_theft, SUM(arson) as sum_arson, 
SUM(violent_crime) as sum_violent_crime, SUM(property_crime) as sum_property_crime, SUM(other_assault) as sum_other_assault, SUM(forgery) as
sum_forgery, SUM(fraud) as sum_fraud, SUM(embezzlement) as sum_embezzlement, SUM(stolen_property) as sum_stolen_property, SUM(vandalism) as
sum_vandalism, SUM(weapons) as sum_weapons, SUM(prostitution) as sum_prostitution, SUM(other_sex_offenses) as sum_other_sex_offenses, 
SUM(drug_abuse) as sum_drug_abuse, SUM(gambling) as sum_gambling, SUM(against_family) as sum_against_family, SUM(dui) as sum_dui, 
SUM(liquor_laws) as sum_liquor_laws, SUM(drunkenness) as sum_drunkenness, SUM(disorderly_conduct) as sum_disorderly_donduct, SUM(vagrancy)
as sum_vagrancy, SUM(other) as sum_other, SUM(suspicion) as sum_suspicion, SUM(curfew_loitering) as sum_curfew_loitering
FROM [dbo].[fbi_data_project]


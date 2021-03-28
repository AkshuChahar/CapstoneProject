-- Databricks notebook source
SELECT * FROM athlete_events

-- COMMAND ----------

SELECT COUNT(DISTINCT ID) AS TotalAthletes FROM athlete_events

-- COMMAND ----------

SELECT ID, COUNT(*) AS NumMedals
FROM athlete_events
WHERE Medal <> 'NA'
GROUP BY ID
ORDER BY ID ASC

-- COMMAND ----------

SELECT * FROM noc_regions

-- COMMAND ----------

DROP TABLE athlete_events_updated; 

CREATE TABLE athlete_events_updated
USING CSV
AS ( SELECT ID, Name, Sex, Age, Height, Weight, Team, NOC, Year, Season, Event, Medal
     FROM athlete_events
     WHERE Medal <> 'NA' 
     ORDER BY ID);

-- COMMAND ----------

REFRESH TABLE athlete_events_updated

-- COMMAND ----------

SELECT * FROM athlete_events_updated
ORDER BY ID

-- COMMAND ----------

SELECT Age, COUNT(*) AS Num_medalists
FROM athlete_events_updated
WHERE Medal = 'Silver'
GROUP BY Age
ORDER BY Age

-- COMMAND ----------

SELECT Team, COUNT(*) AS Num_medals, AVG(Age) AS Average_Age
FROM athlete_events_updated
GROUP BY Team
ORDER BY Num_medals DESC
LIMIT 10

-- COMMAND ----------



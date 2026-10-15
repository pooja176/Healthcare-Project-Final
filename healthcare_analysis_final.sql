-- ======================================================
-- Project: Healthcare Cost Analysis
-- Database: healthcare_analysis
-- Table: healthcare_data
-- Tool: MySQL Workbench
-- ======================================================

-- 1. View Complete Data
SELECT * FROM healthcare_analysis.healthcare_data;

-- 2. Check Table Structure
DESCRIBE healthcare_analysis.healthcare_data;

-- 3. Overall KPIs for Power BI Cards (5.37M, 27.62, 4K)
SELECT
    COUNT(*) AS Total_Patients,
    AVG(Treatment_Cost) AS Avg_Treatment_Cost,
    SUM(hospital_visits) AS Total_Visits,
    SUM(Treatment_Cost) AS Total_Cost,
    AVG(BMI) AS Avg_BMI
FROM healthcare_analysis.healthcare_data;

-- 4. Average Cost Analysis by Diabetes
SELECT Diabetes, COUNT(*) AS Total, AVG(Treatment_Cost) AS AVG_Cost
FROM healthcare_analysis.healthcare_data
GROUP BY Diabetes;

-- 5. Average Cost Analysis by Smoker
SELECT Smoker, COUNT(*) AS Total, AVG(Treatment_Cost) AS AVG_Cost
FROM healthcare_analysis.healthcare_data
GROUP BY Smoker;

-- 6. Average Cost Analysis by Gender
SELECT Gender, COUNT(*) AS Total, AVG(Treatment_Cost) AS AVG_Cost
FROM healthcare_analysis.healthcare_data
GROUP BY Gender;

-- 7. Cost Analysis by Existing Age_Group Column
SELECT Age_Group, COUNT(*) AS Total, AVG(Treatment_Cost) AS AVG_Cost
FROM healthcare_analysis.healthcare_data
GROUP BY Age_Group
ORDER BY AVG_Cost DESC;

-- 8. Cost Analysis by Calculated Age Group using CASE
SELECT
CASE
    WHEN Age < 30 THEN 'Young'
    WHEN Age BETWEEN 30 AND 50 THEN 'Adult'
    ELSE 'Senior'
END AS Age_Group_Calculated,
COUNT(*) AS Total, AVG(Treatment_Cost) AS AVG_Cost
FROM healthcare_analysis.healthcare_data
GROUP BY Age_Group_Calculated;

-- 9. Cost Analysis by Blood Pressure Group
SELECT
CASE
    WHEN Blood_Pressure < 120 THEN 'Normal'
    WHEN Blood_Pressure BETWEEN 120 AND 140 THEN 'Elevated'
    ELSE 'High'
END AS BP_Group,
COUNT(*) AS Total, AVG(Treatment_Cost) AS AVG_Cost
FROM healthcare_analysis.healthcare_data
GROUP BY BP_Group;

-- 10. Cost Analysis by Cholesterol Level Group
SELECT
CASE
    WHEN Cholesterol_Level < 200 THEN 'Normal'
    ELSE 'High'
END AS Cholesterol_Group,
COUNT(*) AS Total, AVG(Treatment_Cost) AS AVG_Cost
FROM healthcare_analysis.healthcare_data
GROUP BY Cholesterol_Group;

-- 11. Patient Distribution by Region
SELECT Region, COUNT(*) AS Total
FROM healthcare_analysis.healthcare_data
GROUP BY Region;
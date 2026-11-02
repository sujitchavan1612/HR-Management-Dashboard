create database HR_Management;
use HR_Management;
select * from HR_employee_count;
show tables;
use HR_Management;
show tables;
select * from hr_employees_cleaned;
SELECT COUNT(*) AS Total_Records FROM hr_employees_cleaned;
DESCRIBE hr_employees_cleaned;
SELECT *
FROM hr_employees_cleaned
WHERE ï»¿EmployeeID IS NULL;
DESCRIBE hr_employees_cleaned;
ALTER TABLE hr_employees_cleaned
RENAME COLUMN `ï»¿EmployeeID` TO EmployeeID;
SELECT *
FROM hr_employees_cleaned
WHERE EmployeeID IS NULL;
describe hr_employees_cleaned;
SELECT COUNT(*) AS Missing_EmployeeIDs
FROM hr_employees_cleaned
WHERE EmployeeID IS NULL;
SELECT COUNT(*) AS Total_Employees
FROM hr_employees_cleaned;
SELECT EmployeeID, COUNT(*) AS Duplicate_Count
FROM hr_employees_cleaned
GROUP BY EmployeeID
HAVING COUNT(*) > 1;
SELECT COUNT(DISTINCT EmployeeID) AS Unique_Employees
FROM hr_employees_cleaned;
SELECT
    COUNT(*) AS Total_Records,
    SUM(EmployeeID IS NULL) AS Missing_EmployeeID,
    SUM(Age IS NULL) AS Missing_Age,
    SUM(Gender IS NULL) AS Missing_Gender,
    SUM(Department IS NULL) AS Missing_Department,
    SUM(JobRole IS NULL) AS Missing_JobRole,
    SUM(SalaryINR IS NULL) AS Missing_Salary
FROM hr_employees_cleaned;
SELECT * FROM hr_employees_cleaned WHERE Age < 18 OR Age > 65;
SELECT * FROM hr_employees_cleaned WHERE SalaryINR <= 0;
SELECT
    EmployeeID,
    Age,
    Gender,
    Department,
    JobRole,
    SalaryINR,
    COUNT(*) AS Duplicate_Count
FROM hr_employees_cleaned
GROUP BY EmployeeID, Age, Gender,Department,JobRole,SalaryINR HAVING COUNT(*) > 1;
SELECT
    Department,
    COUNT(*) AS Total_Employees
FROM hr_employees_cleaned
GROUP BY Department
ORDER BY Total_Employees DESC;
SELECT
    JobRole,
    COUNT(*) AS Total_Employees
FROM hr_employees_cleaned
GROUP BY JobRole
ORDER BY Total_Employees DESC;
SELECT
    EmploymentStatus,
    COUNT(*) AS Total_Employees
FROM hr_employees_cleaned
GROUP BY EmploymentStatus
ORDER BY Total_Employees DESC;
SELECT COUNT(*) AS Missing_Exit_Dates
FROM hr_employees_cleaned
WHERE EmploymentStatus = 'Exited'
AND ExitDate IS NULL;
SELECT COUNT(*) AS Active_With_ExitDate
FROM hr_employees_cleaned
WHERE EmploymentStatus = 'Active'
AND ExitDate IS NOT NULL;
SELECT COUNT(*) AS Invalid_Date_Records FROM hr_employees_cleaned WHERE ExitDate IS NOT NULL
AND ExitDate < HireDate;
SELECT
    EmployeeID,
    HireDate,
    ExitDate,
    EmploymentStatus
FROM hr_employees_cleaned
WHERE ExitDate IS NOT NULL
AND ExitDate < HireDate
LIMIT 20;
SELECT
    MIN(HireDate) AS Earliest_HireDate,
    MAX(HireDate) AS Latest_HireDate,
    MIN(ExitDate) AS Earliest_ExitDate,
    MAX(ExitDate) AS Latest_ExitDate
FROM hr_employees_cleaned;
SELECT COUNT(*) AS Invalid_Date_Records
FROM hr_employees_cleaned
WHERE EmploymentStatus = 'Exited'
AND ExitDate IS NOT NULL
AND ExitDate < HireDate;
SELECT
    EmploymentStatus,
    COUNT(*) AS Total_Employees,
    MIN(HireDate) AS First_Hire_Date,
    MAX(HireDate) AS Last_Hire_Date,
    MIN(ExitDate) AS First_Exit_Date,
    MAX(ExitDate) AS Last_Exit_Date
FROM hr_employees_cleaned
GROUP BY EmploymentStatus;
SELECT
    EmployeeID,
    HireDate,
    ExitDate
FROM hr_employees_cleaned
WHERE EmploymentStatus = 'Exited'
AND ExitDate < HireDate;
CREATE OR REPLACE VIEW vw_hr_dashboard AS
SELECT *
FROM hr_employees_cleaned;
SELECT
    EmployeeID,
    HireDate,
    ExitDate
FROM hr_employees_cleaned
WHERE EmploymentStatus = 'Exited'
AND ExitDate < HireDate;
CREATE OR REPLACE VIEW vw_hr_dashboard AS
SELECT *
FROM hr_employees_cleaned;
SELECT *
FROM vw_hr_dashboard;
SELECT COUNT(*) AS Total_Employees
FROM vw_hr_dashboard;
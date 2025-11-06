
-- single line comment
/*
single quotes for string literals
List: IN (list items)
LIKE with % wildcard in strings allows search for matching string pattern, e.g. LIKE '%Surgery'
standard comparison operators, e.g. >=
BETWEEN to results in range, e.g. AdmittedDate BETWEEN '2024-02-27' AND '2024-03-02'
aliasing a table with FROM TableName tablealias improves autocomplete and readability in complex queries
(INNER) JOIN: Returns records that have matching values in both tables
LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table
RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table
FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table
JOIN format is JOIN Table1 on Table1.column = Table2.column

SELECT 
    ps.PatientId
    ,ps.Hospital
    ,ps.Ward
    ,ps.AdmittedDate
    ,ps.DischargeDate
    ,DATEADD(WEEK, -2, ps.AdmittedDate) AS ReminderDate
    ,DATEDIFF(DAY, ps.AdmittedDate, ps.DischargeDate) AS DaysInHospital
FROM PatientStay ps
WHERE ps.Hospital IN ('PRUH', 'Kingston')
ORDER BY ps.PatientId DESC
*/

SELECT * FROM PatientStay
SELECT * FROM DimHospital
SELECT * FROM DimHospitalBad

SELECT 
    p.PatientId
    ,p.AdmittedDate
    ,p.DischargeDate
    ,h.HospitalType
    ,p.Hospital
    ,h.Hospital
FROM PatientStay p RIGHT JOIN DimHospitalBad h ON p.Hospital = h.Hospital
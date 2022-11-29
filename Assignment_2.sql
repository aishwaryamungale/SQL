-- ==================== Assignment 1 ====================
-- ====================  Question 1  ====================
USE ASSIGNMENT;
SELECT * FROM EMPLOYEE
WHERE SALARY > 3000;

-- ====================  Question 2  ====================
ALTER TABLE STUDENTS ADD COLUMN GRADES VARCHAR(255);
SET SQL_SAFE_UPDATES = 0;

UPDATE STUDENTS SET GRADES = "Second Class"
WHERE MARKS <= 50.0 and MARKS >= 40.0;

UPDATE STUDENTS SET GRADES = "First Class"
WHERE MARKS <= 80 and MARKS > 50;

UPDATE STUDENTS SET GRADES = "Distinction"
WHERE MARKS <= 100 and MARKS > 80;

-- ====================  Question 2(a)  ====================
SELECT COUNT(*) FROM STUDENTS
WHERE GRADES = "First Class";

-- ====================  Question 2(b)  ====================
SELECT COUNT(*) FROM STUDENTS
WHERE GRADES ="Distinction";

-- ====================  Question 3  ====================
SELECT CITY FROM STATION
WHERE ID%2=0;

-- ====================  Question 4  ====================
SELECT (COUNT(CITY) - COUNT(DISTINCT CITY)) AS DIFFERENCE FROM STATION 
WHERE ID%2=0;

-- ====================  Question  5    ====================
-- ====================  Question 5(a)  ====================
SELECT DISTINCT CITY FROM STATION
WHERE (LEFT(LOWER(CITY),1) = 'a' or LEFT(LOWER(CITY),1) = 'e' or LEFT(LOWER(CITY),1) =  'i' or LEFT(LOWER(CITY),1) =  'o' or LEFT(LOWER(CITY),1) =  'u');

-- ====================  Question 5(b)  ====================
SELECT DISTINCT CITY FROM STATION
WHERE (LEFT(LOWER(CITY),1) = 'a' or LEFT(LOWER(CITY),1) = 'e' or LEFT(LOWER(CITY),1) =  'i' or LEFT(LOWER(CITY),1) =  'o' or LEFT(LOWER(CITY),1) =  'u')
AND (RIGHT(LOWER(CITY),1) = 'a' or RIGHT(LOWER(CITY),1) = 'e' or RIGHT(LOWER(CITY),1) =  'i' or RIGHT(LOWER(CITY),1) =  'o' or RIGHT(LOWER(CITY),1) =  'u');

-- ====================  Question 5(c)  ====================
SELECT DISTINCT CITY FROM STATION
WHERE (LEFT(LOWER(CITY),1) != 'a' and LEFT(LOWER(CITY),1) != 'e' and LEFT(LOWER(CITY),1) !=  'i' and LEFT(LOWER(CITY),1) !=  'o' and LEFT(LOWER(CITY),1) !=  'u');

-- ====================  Question 5(d)  ====================
SELECT DISTINCT CITY FROM STATION
WHERE (LEFT(LOWER(CITY),1) != 'a' and LEFT(LOWER(CITY),1) != 'e' and LEFT(LOWER(CITY),1) !=  'i' and LEFT(LOWER(CITY),1) !=  'o' and LEFT(LOWER(CITY),1) !=  'u')
AND (RIGHT(LOWER(CITY),1) != 'a' or RIGHT(LOWER(CITY),1) != 'e' or RIGHT(LOWER(CITY),1) !=  'i' or RIGHT(LOWER(CITY),1) !=  'o' or RIGHT(LOWER(CITY),1) !=  'u');

-- ====================  Question  6    ====================
SELECT first_name,last_name FROM EMP
WHERE SALARY > 2000 AND DATEDIFF(DATE(NOW()),HIRE_DATE)/30 > 36
ORDER BY SALARY DESC;

-- ====================  Question  7    ====================
SELECT  DEPTNO,SUM(SALARY) AS TOTAL_SALARY FROM EMPLOYEE
group by DEPTNO
order by DEPTNO;

-- ====================  Question  8    ====================
SELECT NAME FROM CITY
WHERE POPULATION > 100000;

-- ====================  Question  9    ====================
SELECT SUM(POPULATION) AS TOTAL_POPULATION FROM CITY
WHERE DISTRICT = 'California';

-- ====================  Question  10    ====================
SELECT  DISTRICT,ROUND(AVG(POPULATION),0) AS AVERAGE_POPULATION FROM CITY
group by DISTRICT
order by DISTRICT;

-- ====================  Question  11    ====================
SELECT C.customernumber, C.customername, O.ordernumber, O.status, O.comments  FROM CUSTOMERS C INNER JOIN 
(SELECT  * FROM ORDERS O WHERE COMMENTS LIKE '%dispute%')  O
ON C.CUSTOMERNUMBER=O.CUSTOMERNUMBER;






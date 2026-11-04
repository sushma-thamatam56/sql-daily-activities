CREATE DATABASE CompanyDB;
USE CompanyDB;
CREATE TABLE Employee
(
    empid INT PRIMARY KEY,
    ename VARCHAR(30),
    gender VARCHAR(10),
    dept VARCHAR(20),
    job VARCHAR(20),
    sal DECIMAL(10,2),
    city VARCHAR(20),
    age INT
);
INSERT INTO Employee VALUES
(101,'Ravi','Male','IT','Developer',55000,'Hyderabad',25),
(102,'Sita','Female','HR','HR Executive',40000,'Chennai',28),
(103,'Arjun','Male','IT','Tester',45000,'Bangalore',26),
(104,'Priya','Female','Finance','Accountant',60000,'Hyderabad',30),
(105,'Kiran','Male','Sales','Sales Executive',35000,'Mumbai',24),
(106,'Anjali','Female','IT','Developer',70000,'Hyderabad',29),
(107,'Rahul','Male','HR','Manager',65000,'Delhi',35),
(108,'Sneha','Female','Sales','Sales Executive',38000,'Mumbai',27),
(109,'Vijay','Male','Finance','Manager',80000,'Chennai',40),
(110,'Divya','Female','IT','Developer',75000,'Bangalore',31),
(111,'Ajay','Male','IT','Developer',52000,'Hyderabad',27),
(112,'Pooja','Female','HR','HR Executive',42000,'Delhi',26),
(113,'Manoj','Male','Sales','Manager',68000,'Mumbai',36),
(114,'Neha','Female','Finance','Accountant',58000,'Hyderabad',29),
(115,'Karthik','Male','IT','Tester',48000,'Bangalore',25),
(116,'Meena','Female','Sales','Sales Executive',39000,'Chennai',28),
(117,'Surya','Male','Finance','Accountant',61000,'Hyderabad',33),
(118,'Lavanya','Female','IT','Developer',72000,'Hyderabad',30),
(119,'Ramesh','Male','HR','Manager',67000,'Delhi',38),
(120,'Keerthi','Female','Sales','Manager',69000,'Mumbai',34);

-- Display the total salary of employees in each department.
SELECT dept,sum(sal) AS TOTAL_SALARY 
FROM Employee
GROUP BY dept;

-- Display the number of employees in each department.
SELECT dept,COUNT(*) AS NUM_OF_EMP
FROM Employee
GROUP BY dept;

-- Display the average salary of employees in each department.
SELECT dept,AVG(sal) AS AVG_SAL
FROM Employee
GROUP BY dept;

-- Display the minimum salary in each department.
SELECT dept,MIN(sal) AS MIN_SAL
FROM Employee
GROUP BY dept;

-- Display the maximum salary in each department.
SELECT dept,MAX(sal) AS MAX_SAL
FROM Employee
GROUP BY dept;

-- Display the total number of employees based on gender.
SELECT gender,COUNT(*) AS NUM_OF_EMP
FROM Employee
GROUP BY gender;

-- Display the average salary of employees based on gender.
SELECT gender,AVG(sal) AS AVG_SAL
FROM Employee
GROUP BY gender;

-- Display the number of employees for each job role.
SELECT job,COUNT(*) AS NUM_OF_EMP
FROM Employee
GROUP BY job;

-- Display the total salary for each department and job.
SELECT dept,job,sum(sal) AS TOTAL_SALARY
FROM Employee
GROUP BY dept,job;

-- Display the number of employees in each city.
SELECT city,count(empid) AS NO_OF_EMP
FROM Employee
GROUP BY city;

-- Display departments having more than 5 employees.
SELECT dept,count(empid) AS NO_OF_EMP
FROM Employee
GROUP BY dept
HAVING NO_OF_EMP>5;

-- Display departments whose average salary is greater than 50000.
SELECT dept,avg(sal) AS AVG_SAL
FROM Employee
GROUP BY dept
HAVING AVG_SAL>5000;

-- DOUBT
-- Display job roles where the maximum salary is greater than 80000.
SELECT job,max(sal) AS MAX_SAL
FROM Employee
GROUP BY job
HAVING MAX_SAL>80000;

-- Display cities having more than 3 employees.
SELECT city,count(empid) AS CNT_EMP
FROM Employee
GROUP BY city
HAVING CNT_EMP>3;

-- Display genders whose total salary is greater than 200000.
SELECT gender,sum(sal) AS TOTAL_SALARY
FROM Employee
GROUP BY gender
HAVING TOTAL_SALARY>20000;

-- Display departments where the minimum salary is greater than 30000.
SELECT dept,min(sal) AS MIN_SAL
FROM Employee
GROUP BY dept
HAVING MIN_SAL>30000;

-- Display job roles having at least 2 employees.
SELECT job, COUNT(*) AS total_employees
FROM Employee
GROUP BY job
HAVING COUNT(*) >= 2;

-- Display departments where the total salary is less than 300000.
SELECT dept, SUM(sal) AS total_salary
FROM Employee
GROUP BY dept
HAVING total_salary < 300000;

-- Display cities where the average age is greater than 30
SELECT city, AVG(age) AS average_age
FROM Employee
GROUP BY city
HAVING AVG(age) > 30;

-- Display departments where the maximum salary is less than 70000.
SELECT dept, MAX(sal) AS maximum_salary
FROM Employee
GROUP BY dept
HAVING MAX(sal) < 70000;

-- Display all employee details sorted by salary in ascending order.
SELECT *
FROM Employee
ORDER BY sal ASC;

-- Display all employee details sorted by salary in descending order.
SELECT *
FROM Employee
ORDER BY sal DESC;

-- Display employees sorted by department in ascending order.
SELECT *
FROM Employee
ORDER BY dept ASC;

-- Display employees sorted by department (ascending) and salary (descending).
SELECT *
FROM Employee
ORDER BY dept ASC, sal DESC;

-- Display employees sorted by city and employee name.
SELECT *
FROM Employee
ORDER BY city ASC, ename ASC;

-- Display employees sorted by age from youngest to oldest.
SELECT *
FROM Employee
ORDER BY age ASC;

-- Display employees sorted by age from oldest to youngest.
SELECT *
FROM Employee
ORDER BY age DESC;

-- Display employees sorted by gender and then salary in descending order.
SELECT *
FROM Employee
ORDER BY gender ASC, sal DESC;

-- Display employees sorted by job, department, and salary
SELECT *
FROM Employee
ORDER BY job ASC, dept ASC, sal ASC;

-- Display employees sorted by department (ascending), job (ascending), and employee name (ascending).
SELECT *
FROM Employee
ORDER BY dept ASC, job ASC, ename ASC;

-- Department-wise average salary of employees whose salary is greater than ₹40,000.
SELECT dept, AVG(sal) AS average_salary
FROM Employee
WHERE sal > 40000
GROUP BY dept;


-- Count employees in each department whose age is greater than 25; show only departments with more than 2 employees.
SELECT dept, COUNT(*) AS total_employees
FROM Employee
WHERE age > 25
GROUP BY dept
HAVING COUNT(*) > 2;

-- Department-wise maximum salary of employees living in Hyderabad; show departments with maximum salary greater than ₹50,000.
SELECT dept, MAX(sal) AS maximum_salary
FROM Employee
WHERE city = 'Hyderabad'
GROUP BY dept
HAVING MAX(sal) > 50000;

-- Count male employees in each department; show departments with at least 2 male employees.
SELECT dept, COUNT(*) AS male_employees
FROM Employee
WHERE gender = 'Male'
GROUP BY dept
HAVING COUNT(*) >= 2;

-- City-wise average salary of employees whose age is greater than 25; show cities with average salary greater than ₹50,000
SELECT city, AVG(sal) AS average_salary
FROM Employee
WHERE age > 25
GROUP BY city
HAVING AVG(sal) > 50000;

-- Display the first 5 employees from the Employee table.
SELECT *
FROM Employee
LIMIT 5;

-- Display 5 employees, skipping the first 5 employees.
SELECT *
FROM Employee
LIMIT 5 OFFSET 5;

-- Display 3 employees with the highest salaries.
SELECT *
FROM Employee
ORDER BY sal DESC
LIMIT 3;

-- Display 4 employees, skipping the first 10 employees, ordered by employee ID in ascending order.
SELECT *
FROM Employee
ORDER BY empid ASC
LIMIT 4 OFFSET 10;

-- Display 5 employees with the lowest salaries, skipping the first 2 employees when ordered by salary in ascending order.
SELECT *
FROM Employee
ORDER BY sal ASC
LIMIT 5 OFFSET 2;

-- Display each department's total salary and sort the result by total salary in descending order.
SELECT dept,SUM(sal) AS TOTAL_SAL
FROM Employee
GROUP BY dept
ORDER BY TOTAL_SAL DESC;

-- Display departments having more than 3 employees and sort them by employee count in descending order.
SELECT dept,COUNT(empid) AS TOTAL_EMP
FROM Employee
GROUP BY dept
HAVING TOTAL_EMP>3
ORDER BY TOTAL_EMP DESC;

-- Display each job role's average salary where the average salary is greater than 45000 and sort by average salary.
SELECT job,AVG(sal) AS AVG_SAL
FROM Employee
GROUP BY job
HAVING AVG_SAL>45000
ORDER BY AVG_SAL;

-- Display cities having more than 2 employees and sort by city name.
SELECT city,COUNT(empid) AS TOTAL_EMP
FROM Employee
GROUP BY city
HAVING TOTAL_EMP>2
ORDER BY city;

-- Display departments and their maximum salary where the maximum salary is greater than 60000 and sort by maximum salary.
SELECT dept,MAX(sal) AS MAX_SALARY
FROM Employee
GROUP BY dept
HAVING MAX_SALARY>60000
ORDER BY MAX_SALARY;

-- Display genders and total salary where the total salary is greater than 100000 and sort by total salary.
SELECT gender,SUM(sal) AS TOTAL_SALARY
FROM Employee
GROUP BY gender
HAVING TOTAL_SALARY>100000
ORDER BY TOTAL_SALARY;

-- Display departments and employee count where the count is at least 4 and sort alphabetically by department.
SELECT dept,COUNT(empid) AS TOTAL_EMP
FROM Employee
GROUP BY dept
HAVING TOTAL_EMP >= 4
ORDER BY dept;

-- Display department-wise average salary and sort first by department, then by average salary in descending order.
SELECT dept,AVG(sal) AS AVG_SAL
FROM Employee
GROUP BY dept
ORDER BY dept ASC,AVG_SAL DESC;

-- Display job-wise minimum salary where the minimum salary is greater than 25000 and sort by minimum salary.
SELECT JOB,MIN(sal) AS MIN_SAL
FROM Employee
GROUP BY job
HAVING  MIN_SAL>25000
ORDER BY  MIN_SAL;

-- Display city-wise employee count where the count is greater than 1 and sort by employee count in descending order.
SELECT CITY,COUNT(empid) AS TOTAL_EMP
FROM Employee
GROUP BY CITY
HAVING TOTAL_EMP>1
ORDER BY TOTAL_EMP DESC;

/*/Find the second and third highest-paid job groups among employees working in 
Hyderabad, Chennai, or Bangalore. Consider employees whose age is between 25 and 
35. Display each job, employee count, and maximum salary, considering only groups
with at least 2 employees./*/

SELECT JOB,COUNT(empid) AS EMP_COUNT,MAX(sal) AS MAX_SAL,SUM(SAL) AS TOTAL_SAL
FROM Employee
WHERE AGE BETWEEN 25 AND 35 AND CITY IN('Hyderabad', 'Chennai', 'Bangalore')
GROUP BY JOB
HAVING EMP_COUNT >=2
ORDER BY MAX_SAL DESC
LIMIT 2
OFFSET 1;

/*/The HR manager wants to analyze gender-wise salary distribution across
 departments. Consider employees earning more than ₹35,000. Display the 
 department, gender, total employees, and average salary for groups with an
 average salary above ₹45,000. Sort by department name and average salary,
 then skip the first 2 records and display the next 5 records./*/
 
SELECT DEPT,GENDER,COUNT(EMPID) AS TOTAL_EMP,
        AVG(SAL) AS AVG_SAL
FROM Employee
WHERE SAL > 35000
GROUP BY DEPT,GENDER
HAVING AVG_SAL > 45000
ORDER BY DEPT ,AVG_SAL
LIMIT 5
OFFSET 2;

/*/Identify cities where the total salary of employees working as Managers or 
Developers exceeds ₹100,000. Consider only employees aged above 25. Display the
city, employee count, and total salary in descending order of total salary. 
Skip the first city and return the next 3 cities./*/

SELECT CITY,SUM(SAL) AS TOTAL_SAL,
        COUNT(EMPID) AS TOTAL_EMP
FROM Employee
WHERE AGE > 25 AND JOB IN('Manager','Developer')
GROUP BY CITY
HAVING TOTAL_SAL>100000
ORDER BY TOTAL_SAL DESC
LIMIT 3
OFFSET 1;

/*/Find departments with at least 2 employees whose salaries are between ₹40,000 
and ₹75,000 and whose ages are below 35. Display the department, minimum salary, 
maximum salary, and average salary. Include only departments whose average salary 
is above ₹50,000, sort by average salary in descending order, and return the top 2
results after skipping the first result./*/
SELECT DEPT,MIN(SAL) AS MIN_SAL,
       MAX(SAL) AS MAX_SAL,
       AVG(SAL) AS AVG_SAL,
       COUNT(EMPID) AS TOTAL_EMP
FROM Employee
WHERE SAL BETWEEN 40000 AND 75000 AND AGE <35
GROUP BY DEPT
HAVING AVG_SAL> 50000 AND TOTAL_EMP>=2
ORDER BY AVG_SAL DESC
LIMIT 2 OFFSET 1;






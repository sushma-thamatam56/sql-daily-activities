USE CompanyDB;
CREATE TABLE Emp (
    emp_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    commission DECIMAL(10,2)
);

INSERT INTO Emp
(emp_id, first_name, last_name, department, salary, bonus, commission)
VALUES
(101, 'John', 'Smith', 'IT', 48500.00, 2500.00, 1200.00),
(102, 'Sarah', 'Johnson', 'HR', 52750.00, 3000.00, 800.00),
(103, 'Michael', 'Brown', 'Sales', 61250.00, 4500.00, 3500.00),
(104, 'David', 'Wilson', 'IT', 73499.00, 5000.00, 2100.00),
(105, 'Emma', 'Davis', 'Finance', 45680.00, 2200.00, 1500.00),
(106, 'Robert', 'Miller', 'Sales', 58990.00, 3500.00, 4200.00),
(107, 'Olivia', 'Taylor', 'HR', 51025.00, 2800.00, 900.00),
(108, 'Daniel', 'Anderson', 'IT', 67555.00, 4200.00, 1800.00),
(109, 'Sophia', 'Thomas', 'Finance', 49875.00, 2500.00, 1300.00),
(110, 'James', 'Jackson', 'Sales', 80500.00, 6000.00, 5500.00),
(111, 'Emily', 'White', 'IT', 92549.00, 7500.00, 3200.00),
(112, 'William', 'Harris', 'Finance', 55999.00, 3100.00, 1700.00),
(113, 'Ava', 'Martin', 'HR', 47250.00, 2400.00, 700.00),
(114, 'Christopher', 'Thompson', 'Sales', 68765.00, 4000.00, 3900.00),
(115, 'Isabella', 'Garcia', 'IT', 75999.00, 5200.00, 2500.00);

-- Display each employee's salary rounded to the nearest thousand.
SELECT FIRST_NAME,ROUND(salary,-3) 
FROM EMP;

-- Display each employee's salary rounded to exactly two decimal places.
SELECT FIRST_NAME,ROUND(salary,2) AS EMP_SAL
FROM EMP;

-- Display the next whole-number value greater than or equal to each employee's salary.
SELECT  FIRST_NAME,CEIL(salary) 
FROM EMP;

-- Display the whole-number value immediately below each employee's salary.
SELECT  FIRST_NAME,FLOOR(salary) 
FROM EMP;

-- Calculate each employee's salary multiplied by itself.
SELECT  FIRST_NAME,POW(salary,2) 
FROM EMP;

-- Calculate the square root of each employee's salary.
SELECT FIRST_NAME,SQRT(salary) 
FROM EMP;

-- Display the absolute difference between each employee's salary and 60000.
SELECT FIRST_NAME,ABS(SALARY -60000) AS DIFF
FROM EMP;

-- Find the remainder when each employee's salary is divided by 1000.
SELECT FIRST_NAME,MOD(SALARY,1000)
FROM EMP;

-- Generate a different random value for every employee.
SELECT RAND(emp_id) AS RAND_ID
FROM EMP;

-- Display whether each employee's salary is positive, negative, or zero.
SELECT FIRST_NAME, SALARY, SIGN(SALARY) AS RESULT
FROM EMP;

-- Highest among salary, bonus, commission
SELECT emp_name,
       GREATEST(salary, bonus, commission) AS highest_value
FROM employees;

-- Lowest among salary, bonus, commission
SELECT emp_name,
       LEAST(salary, bonus, commission) AS lowest_value
FROM employees;

-- Names in uppercase
SELECT UPPER(emp_name) AS upper_name
FROM employees;

-- Names in lowercase
SELECT LOWER(emp_name) AS lower_name
FROM employees;

-- Length of first name
SELECT first_name, CHAR_LENGTH(first_name) AS name_length
FROM employees;

-- Length of full name
SELECT CONCAT(first_name, ' ', last_name) AS full_name,
       CHAR_LENGTH(CONCAT(first_name, ' ', last_name)) AS name_length
FROM employees;

-- First 3 characters of first name
SELECT first_name, LEFT(first_name, 3) AS first_3_chars
FROM employees;

-- Last 3 characters of last name
SELECT last_name, RIGHT(last_name, 3) AS last_3_chars
FROM employees;

-- First 4 characters of first name
SELECT first_name, LEFT(first_name, 4) AS first_4_chars
FROM employees;

-- Combine first and last names
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

-- Combine names and department with hyphens
SELECT CONCAT(first_name, '-', last_name, '-', department) AS employee_details
FROM employees;

-- Replace 'a' with '@'
SELECT REPLACE(emp_name, 'a', '@') AS modified_name
FROM employees;

-- Remove leading and trailing spaces
SELECT TRIM(emp_name) AS trimmed_name
FROM employees;

-- Add '*' on the left to make length 10
SELECT LPAD(first_name, 10, '*') AS padded_name
FROM employees;

-- Add '*' on the right to make length 10
SELECT RPAD(first_name, 10, '*') AS padded_name
FROM employees;

-- Position of 'a' in first name
SELECT first_name, INSTR(first_name, 'a') AS a_position
FROM employees;

-- First names containing 'an'
SELECT *
FROM employees
WHERE first_name LIKE '%an%';

-- Position of 'son' in last name
SELECT last_name, INSTR(last_name, 'son') AS son_position
FROM employees;

-- First names longer than 5 characters
SELECT *
FROM employees
WHERE CHAR_LENGTH(first_name) > 5;

-- Full name, length, and first 'a' position
SELECT CONCAT(first_name, ' ', last_name) AS full_name,
       CHAR_LENGTH(CONCAT(first_name, ' ', last_name)) AS name_length,
       INSTR(CONCAT(first_name, ' ', last_name), 'a') AS a_position
FROM employees;

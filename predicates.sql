CREATE DATABASE codegnan_jfs_58;
USE  codegnan_jfs_58;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    job_role VARCHAR(30),
    salary DECIMAL(10,2),
    city VARCHAR(30),
    manager_id INT,
    email VARCHAR(100),
    bonus DECIMAL(10,2)
);

INSERT INTO employees
(emp_id, emp_name, department, job_role, salary, city, manager_id, email, bonus)
VALUES
(101, 'Ravi',   'IT',      'Developer', 65000, 'Hyderabad', 201, 'ravi@gmail.com', 5000),
(102, 'Priya',  'HR',      'Manager',    75000, 'Bangalore', NULL, 'priya@gmail.com', 8000),
(103, 'Arun',   'IT',      'Tester',     45000, 'Chennai',   201, 'arun@gmail.com', NULL),
(104, 'Sneha',  'Finance', 'Analyst',    55000, 'Hyderabad', 202, 'sneha@gmail.com', 4000),
(105, 'Kiran',  'IT',      'Developer', 85000, 'Pune',      201, 'kiran@gmail.com', 10000),
(106, 'Anjali', 'HR',      'Recruiter',  42000, 'Chennai',   202, NULL, 3000),
(107, 'Vijay',  'Finance', 'Accountant', 48000, 'Bangalore', 202, 'vijay@gmail.com', NULL),
(108, 'Meena',  'Sales',   'Executive',  38000, 'Hyderabad', 203, 'meena@gmail.com', 2000),
(109, 'Rahul',  'Sales',   'Manager',    72000, 'Pune',      NULL, 'rahul@gmail.com', 7000),
(110, 'Divya',  'IT',      'Developer',  60000, 'Bangalore', 201, NULL, 5000),
(111, 'Suresh', 'Finance', 'Analyst',    52000, 'Chennai',   202, 'suresh@gmail.com', NULL),
(112, 'Pooja',  'HR',      'Executive',  35000, 'Hyderabad', 102, 'pooja@gmail.com', 1500),
(113, 'Amit',   'IT',      'Support',    40000, 'Pune',      201, 'amit@gmail.com', NULL),
(114, 'Neha',   'Sales',   'Executive',  46000, 'Bangalore', 203, NULL, 2500),
(115, 'Raj',    'IT',      'Architect',  95000, 'Hyderabad', NULL, 'raj@gmail.com', 15000);

-- Find all employees whose salary is between 40,000 and 60,000.
SELECT * from employees
where salary BETWEEN 40000 and 60000;

-- Find all employees whose salary is outside the range of 50,000 to 80,000.
SELECT * from employees
where salary NOT BETWEEN 50000 and 80000;

-- Find all employees who work in IT, HR, or Finance departments.
SELECT * from employees
WHERE department IN('IT', 'HR');

-- Find all employees who do not work in IT, HR, or Sales departments.
SELECT * from employees
WHERE department NOT IN('IT', 'HR','Sales');

-- Find all employees whose names start with the letter R.
SELECT * from employees
WHERE emp_name LIKE 'R%';

-- Find all employees whose names end with the letter a.
SELECT * from employees
WHERE emp_name LIKE '%a';

-- Find all employees whose names contain the letter i.
SELECT * from employees
WHERE emp_name LIKE '%i%';

-- Find all employees whose names do not start with the letter A.
SELECT * from employees
WHERE emp_name NOT LIKE 'A%';

-- Find all employees who do not have an email address.
SELECT * from employees
WHERE email is null;

-- Find all employees who have an email address.
SELECT * from employees
WHERE email is not null;

-- Find all employees who do not have a manager assigned.
SELECT * from employees
WHERE manager_id is  null;

-- Find all employees who have a manager assigned.
SELECT * from employees
WHERE manager_id is not null;

-- Find employees who work in IT, HR, or Finance and whose salary is between 40,000 and 70,000.
SELECT * from employees
WHERE department IN('IT', 'HR','finance') AND  salary BETWEEN 40000 and 70000;

-- Find employees who do not work in IT or HR and whose salary is outside the range of 40,000 to 70,000.
SELECT * from employees
WHERE department NOT IN('IT', 'HR') AND  salary NOT BETWEEN 40000 and 70000;

-- Find employees whose name starts with R or S and whose salary is greater than 40,000.
SELECT * from employees
WHERE emp_name LIKE 'R%' or 'S%' AND salary > 40000;

-- Find employees who work in IT, Finance, or Sales and have a bonus value.
SELECT * from employees
WHERE department IN('IT', 'sales','finance') and bonus is not null ;

-- Increase the salary by 10% for IT employees whose salary is less than 60,000.
UPDATE employees 
SET salary = salary + (salary * 10/100)
WHERE  department ='IT' AND  salary < 60000 AND emp_id>0;

-- Set the bonus to 5,000 for employees whose bonus is missing and whose salary is greater than 45,000.
UPDATE employees 
SET bonus = 50000
where bonus is null AND
      salary > 45000 AND emp_id>0;

-- Delete employees who work in the Sales department and whose salary is less than 45,000.
DELETE from employees
WHERE department = 'sales'
      AND salary< 45000;

-- Find employees whose salary is between 45,000 and 90,000, who work in IT, Finance, or Sales, whose name contains a, and who have both bonus and email details.
SELECT * FROM employees
WHERE salary BETWEEN 45000 AND 90000 AND 
      department IN ('IT', 'sales','finance') AND
	  bonus IS NOT NULL AND 
      emp_name LIKE '%A%' AND
      email IS NOT NULL;
      

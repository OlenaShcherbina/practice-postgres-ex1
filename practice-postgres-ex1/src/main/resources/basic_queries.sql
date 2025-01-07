--1. List all employees in the IT department
SELECT * FROM employees
WHERE department = 'IT'
ORDER BY name;

--2. Find employees with salaries greater than 70000

SELECT * FROM employees
WHERE salary > 70000
ORDER BY id;

--3. List all active employees ordered by hire date
SELECT * FROM employees
WHERE is_active =  true
ORDER BY hire_date;

--4. Find all employees hired between 2019 and 2020

SELECT * FROM employees
WHERE DATE_PART('YEAR', hire_date)>=2019
  AND DATE_PART('YEAR', hire_date)<=2020
ORDER BY hire_date;
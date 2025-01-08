--Logical Expressions
--1. Find all employees who are either in IT department OR earn more than 70000
--2. List employees who are both active AND hired after 2019
--3. Find employees who are NOT in the Marketing department
--4. (Advanced) Create a column showing TRUE if employee salary is above department average, FALSE otherwise

--1. Find all employees who are either in IT department OR earn more than 70000

SELECT * FROM employees
WHERE department = 'IT'
   OR salary > 70000
ORDER BY hire_date;

--2. List employees who are both active AND hired after 2019

SELECT * FROM employees
WHERE is_active =  true
  AND DATE_PART('YEAR', hire_date) >= 2019
ORDER BY hire_date;

--3. Find employees who are NOT in the Marketing department

--by dept_id
SELECT * FROM employees
WHERE dept_id != 4
ORDER BY name;

--or by department name

SELECT * FROM employees
WHERE department != 'Marketing'
ORDER BY name;

--4. (Advanced) Create a column showing TRUE if employee salary is above department average, FALSE otherwise
ALTER TABLE employees
    ADD COLUMN is_above_avg_salary BOOLEAN;

--found all employees with salary above the department average
SELECT id, salary, is_above_avg_salary FROM employees e1
GROUP BY department, id
HAVING salary > (SELECT AVG(salary) FROM employees e2
                 GROUP BY department
                 HAVING e1.department = e2.department);

--found all employees with salary below or equal to the department average
SELECT salary FROM employees e1
GROUP BY department, id
HAVING salary <= (SELECT AVG(salary) FROM employees e2
                  GROUP BY department
                  HAVING e1.department = e2.department);



UPDATE employees e1
SET is_above_avg_salary =
        CASE
            WHEN (e1.salary > (SELECT AVG(salary) FROM employees e2
                               GROUP BY department
                               HAVING e1.department = e2.department))
                THEN TRUE
            ELSE FALSE
            END;


ALTER TABLE employees
DROP COLUMN is_above_avg_salary;

SELECT * FROM employees;

SELECT e1.id, e1.name, e1.salary, e1.department, (e1.salary > (
    SELECT AVG(salary) FROM employees e2
    WHERE e1.department = e2.department
    GROUP BY e2.department
) )
FROM employees e1
GROUP BY e1.id, e1.name, e1.salary, e1.department
ORDER BY e1.id;
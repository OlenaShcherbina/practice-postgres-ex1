--Aggregation
--1. Calculate the average salary by department
--2. Find the department with the highest total salary
--3. Count the number of projects per department
--4. Calculate the total hours allocated per project
--5. Find departments where the average salary is above 70000

--1. Calculate the average salary by department
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
ORDER BY average_salary DESC;

--2. Find the department with the highest total salary
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY total_salary DESC
    LIMIT 1;

--3. Count the number of projects per department
SELECT dept_name AS department, count(project_id) AS num_of_projects
FROM departments
         JOIN projects ON departments.dept_id = projects.dept_id
GROUP BY department
ORDER BY num_of_projects DESC;

--4. Calculate the total hours allocated per project

SELECT project_name, SUM(hours_allocated) AS total_hours_allocated
FROM projects
         LEFT JOIN employee_projects ON projects.project_id = employee_projects.project_id
GROUP BY project_name;

--5. Find departments where the average salary is above 70000
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 70000;
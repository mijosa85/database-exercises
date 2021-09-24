SELECT * FROM roles, users;

SELECT * FROM roles
JOIN users 
ON roles.id = users.role_id;

SELECT * FROM roles
LEFT JOIN users 
ON roles.id = users.role_id;

SELECT * FROM roles
RIGHT JOIN users 
ON roles.id = users.role_id;

SELECT roles.name, COUNT(*) FROM roles
JOIN users
ON roles.id = users.role_id
GROUP BY roles.name;

USE employees;

-- 2
SELECT departments.dept_name AS "Department",
	CONCAT(first_name, " ", last_name) AS "Name"
FROM employees
JOIN dept_manager USING(emp_no)
JOIN departments USING(dept_no)
WHERE dept_manager.to_date > now()
ORDER BY Department ASC;
-- 3
SELECT departments.dept_name AS "Department",
	CONCAT(first_name, " ", last_name) AS "Name"
FROM employees
JOIN dept_manager USING(emp_no)
JOIN departments USING(dept_no)
WHERE (dept_manager.to_date > now()
	AND employees.gender = "F")
ORDER BY Department ASC;
--  4
SELECT titles.title AS "Title", COUNT(*) AS "Count" FROM titles
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE (departments.dept_name = "Customer Service"
	AND titles.to_date > now()
	AND dept_emp.to_date > now())
GROUP BY Title
ORDER BY Title;
-- 5
SELECT departments.dept_name AS "Department Name", 
	CONCAT(first_name, " ", last_name) AS "Name", 
	salaries.salary AS "Salary"
FROM employees 
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
JOIN dept_manager USING(emp_no)
JOIN salaries USING(emp_no)
WHERE (salaries.to_date > now()
	AND dept_manager.to_date > now())
ORDER BY departments.dept_name ASC;
-- 6
SELECT dept_emp.dept_no AS "dept_no", 
	departments.dept_name AS "dept_name",
	COUNT(dept_no) AS "num_employees"
FROM dept_emp
JOIN departments USING(dept_no)
WHERE dept_emp.to_date > now()
GROUP BY dept_emp.dept_no
ORDER BY dept_no;
-- 7
SELECT departments.dept_name AS "dept_name",
	AVG(salaries.salary) AS "average_salary"
FROM salaries
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE (salaries.to_date > NOW()
	AND dept_emp.to_date > NOW())
GROUP BY dept_name
ORDER BY average_salary DESC
LIMIT 1;
-- 8
SELECT first_name, last_name FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
JOIN salaries USING(emp_no)
WHERE departments.dept_name = "Marketing"
ORDER BY salaries.salary DESC
LIMIT 1;
-- 9
SELECT first_name, last_name, 
	salaries.salary AS "salary", 
	departments.dept_name AS "dept_name"
FROM employees
JOIN dept_manager USING(emp_no)
JOIN salaries USING(emp_no)
JOIN departments USING(dept_no)
WHERE (salaries.to_date > now()
	AND dept_manager.to_date > now())
ORDER BY salary DESC
LIMIT 1;
-- BONUS 1
SELECT CONCAT(a.first_name, " ", a.last_name) AS "Employee Name",
	d.dept_name AS "Department",
	CONCAT(b.first_name, " ", b.last_name) AS "Manager Name"
FROM employees a, employees b
JOIN dept_emp AS de 
	ON de.emp_no = b.emp_no
JOIN departments AS d
	ON d.dept_no = de.dept_no
JOIN dept_manager AS dm
	ON dm.emp_no = b.emp_no
WHERE (dm.to_date > now()
	AND de.to_date > now())
LIMIT 100;
-- BONUS 2
/*SELECT CONCAT(first_name, " ", last_name),
	dept_name as "dept",
	MAX(salaries.salary)
FROM departments, employees
JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE salaries.to_date > NOW()
ORDER BY salaries.salary
LIMIT 15;*/

SELECT departments.dept_name AS "Dept",
	MAX(salaries.salary),
	employees.first_name
FROM departments
JOIN dept_emp USING(dept_no)
JOIN salaries USING(emp_no)
JOIN employees ON dept_emp.emp_no = employees.emp_no
GROUP BY Dept
LIMIT 40;
	
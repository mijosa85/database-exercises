SELECT CONCAT(first_name, " ", last_name), emp_no, hire_date
FROM employees
WHERE hire_date =
(
	SELECT hire_date
	FROM employees
	WHERE emp_no = "101010"
);

SELECT title FROM 
(
	SELECT title FROM titles
	JOIN employees USING(emp_no)
	JOIN dept_emp USING(emp_no)
	WHERE (employees.first_name LIKE "Aamod"
		AND dept_emp.to_date > NOW())
) AS Titles
GROUP BY title;

SELECT COUNT(emp_no)
FROM employees
WHERE emp_no NOT IN
(
	SELECT emp_no
	FROM dept_emp
	WHERE to_date > NOW());
--  85108 people in emp table no longer work for the company

SELECT CONCAT(first_name, " ", last_name)
FROM employees
JOIN dept_manager USING(emp_no)
WHERE gender = "F";

/* Isamu Legleitner
Shirish Ossenbruggen
Karsten Sigstam
Krassimir Wegerle
Rosine Cools
Leon DasSarma
Peternela Onuegbe
Rutger Hofmeyr
Sanjoy Quadeer
Hilary Kambil
Tonny Butterworth
Marjo Giarratana
Xiaobin Spinelli */

SELECT CONCAT(first_name, " ", last_name), salaries.salary
FROM employees
JOIN salaries USING(emp_no)
WHERE (salaries.to_date > now() 
	AND salaries.salary >
		(
		SELECT AVG(salary)
		FROM salaries
		));
		
SELECT COUNT(salary)
FROM salaries
WHERE (to_date > NOW() 
	AND salary > 
	(
		SELECT MAX(salary) - STDDEV(salary) FROM salaries
		WHERE to_date > NOW()
	));
-- 83 people are within 1 Standard deviation of the maximum salary

SELECT
(
	SELECT COUNT(salary)
	FROM salaries
	WHERE (to_date > NOW() 
		AND salary > 
		(
			SELECT MAX(salary) - STDDEV(salary) FROM salaries
			WHERE to_date > NOW()
		))
) / COUNT(salary) * 100
FROM salaries;

SELECT dept_name
FROM departments
JOIN dept_manager AS dm USING(dept_no)
JOIN employees AS e USING(emp_no)
WHERE e.gender = "F"
	AND dm.to_date > NOW();

SELECT CONCAT(first_name, " ", last_name) as "Name"
FROM employees
JOIN salaries AS s USING(emp_no)
WHERE s.salary >= 
(
	SELECT MAX(salary) FROM salaries
);

SELECT dept_name
FROM departments
JOIN dept_emp USING(dept_no)
WHERE emp_no = 
(	
	SELECT emp_no
	FROM employees
	JOIN salaries AS s USING(emp_no)
	WHERE s.salary >= 
	(
		SELECT MAX(salary) FROM salaries
	)
);
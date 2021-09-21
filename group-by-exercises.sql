SELECT DISTINCT title FROM titles;
-- 7 unique titles

SELECT DISTINCT last_name FROM employees
WHERE last_name LIKE "e%e"
GROUP BY last_name;

SELECT DISTINCT CONCAT(first_name, " ", last_name)
FROM employees
WHERE last_name LIKE "e%e";

SELECT DISTINCT last_name, count(last_name)
FROM employees
WHERE (last_name LIKE "%q%"
	AND last_name NOT LIKE "%qu%")
GROUP BY last_name;
-- returns "Chleq", "Lindqvist", "Qiwen"

SELECT gender, COUNT(first_name) FROM employees
WHERE (first_name = "Irena" OR 
	first_name = "Vidya" OR 
	first_name = "Maya")
GROUP BY gender;

SELECT CONCAT(LOWER(SUBSTR(first_name, 1, 1)), 
	LOWER(SUBSTR(last_name, 1, 4)), "_", 
	SUBSTR(birth_date, 6, 2), 
	SUBSTR(birth_date, 3, 2))
AS username, count(*)
FROM employees
GROUP BY username
HAVING count(username) > 1;
-- 13251 duplicate usernames

SELECT AVG(salary) FROM salaries
WHERE to_date < now();
-- historical average salary: $63,054.43

SELECT AVG(salary) FROM salaries
WHERE to_date >= now();
-- current average salary: $72,012.24

SELECT AVG(salary), emp_no FROM salaries
WHERE to_date < now()
GROUP BY emp_no;

SELECT AVG(salary), emp_no FROM salaries
WHERE to_date >= now()
GROUP BY emp_no;

SELECT MAX(salary), emp_no FROM salaries
WHERE to_date >= now()
GROUP BY emp_no;

SELECT emp_no, MAX(salary) FROM salaries
WHERE to_date >= now()
GROUP BY emp_no
HAVING MAX(salary) > 150000;

SELECT AVG(salary), emp_no FROM salaries
WHERE to_date >= now()
GROUP BY emp_no
HAVING AVG(salary) BETWEEN 80000 AND 90000;

SELECT * FROM employees
WHERE first_name IN ('Irena', 'Maya', 'Vidya')
ORDER BY first_name;
-- first result: "Irena Reutenauer"
-- last result: "Vidya Simmon"

SELECT * FROM employees
WHERE first_name IN ('Irena', 'Maya', 'Vidya')
ORDER BY first_name, last_name;
-- first result: "Irena Acton"
-- last result: "Vidya Zweizig"

SELECT * FROM employees
WHERE first_name IN ('Irena', 'Maya', 'Vidya')
ORDER BY last_name, first_name;
-- first result: "Irena Acton"
-- last result: "Maya Zyda"

SELECT * FROM employees
WHERE last_name LIKE "e%e"
ORDER BY emp_no;
-- results returned: 899
-- first result: "Ramzi Erde", emp. #10021
-- last result: "Tadahiro Erde", emp. #. 499648

SELECT * FROM employees
WHERE last_name LIKE "e%e"
ORDER BY hire_date DESC;
-- results returned: 899
-- newest employee: "Teiji Eldridge"
-- oldest employee: "Sergi Erde"

SELECT * FROM employees
WHERE hire_date LIKE "199%"
AND birth_date LIKE "%12-25%"
ORDER BY birth_date, hire_date DESC;
-- 362 results returned
-- first: "Khun Bernini"
-- last: "Douadi Pettis"

/* FUNCTIONS EXERCISES */

SELECT *, UPPER(CONCAT(first_name, ' ', last_name))
AS full_name FROM employees
WHERE last_name LIKE 'e%e';

SELECT DATEDIFF(now(), hire_date) FROM employees
WHERE (birth_date LIKE "%12-25%"
	AND hire_date LIKE "199%");
	
SELECT MIN(salary), MAX(salary) FROM salaries;

SELECT CONCAT(LOWER(SUBSTR(first_name, 1, 1)), LOWER(SUBSTR(last_name, 1, 4)), "_", SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))
AS username, first_name, last_name, birth_date
FROM employees;

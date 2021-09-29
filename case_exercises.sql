USE employees;

SELECT emp_no, dept_emp.dept_no, hire_date, dept_emp.to_date,
	CASE WHEN dept_emp.to_date > NOW() THEN 1
	ELSE 0
	END AS "is_current_employee"
FROM employees
JOIN dept_emp USING(emp_no);

SELECT CONCAT(last_name, ", ", first_name) AS "Name",
	CASE
	WHEN SUBSTRING(last_name, 1, 1) IN ("a","b","c","d","e","f","g","h") THEN "A-H"
	WHEN SUBSTRING(last_name, 1, 1) IN ("i","j","k","l","m","n", "o", "p", "q") THEN "I-Q"
	WHEN SUBSTRING(last_name, 1, 1) IN ("r","s","t","u","v","x","y","z") THEN "R-Z"
	ELSE Null
	END AS "alpha_group"
FROM employees;

SELECT CASE 
	WHEN birth_date LIKE "194%" THEN "40s"
	WHEN birth_date LIKE "195%" THEN "50s"
	WHEN birth_date LIKE "196%" then "60s"
	WHEN birth_date LIKE "197%" then "70s"
	ELSE NULL
	END AS "Decade",
	COUNT(*)
FROM employees
GROUP BY Decade;

SELECT 
	CASE dept_name
	WHEN 'Customer Service' THEN 'Customer Service'
	WHEN 'Finance' THEN 'Finance & HR'
	WHEN 'Human Resources' THEN 'Finance & HR'
	WHEN 'Sales' THEN 'Sales & Marketing'
	WHEN 'Marketing' THEN 'Sales & Marketing'
	WHEN 'Production' THEN 'Prod & QM'
	WHEN 'Quality Management' THEN 'Prod & QM'
	WHEN 'Research' THEN 'R&D'
	WHEN 'Development' THEN 'R&D'
	END AS department,
	AVG(salaries.salary)
FROM departments
JOIN dept_emp USING(dept_no)
JOIN salaries USING(emp_no)
GROUP BY 1;
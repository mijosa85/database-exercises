USE employees;

CREATE TEMPORARY TABLE hopper_1567.employees_with_departments AS
SELECT first_name, last_name, dept_name
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE dept_emp.to_date > NOW();

ALTER TABLE hopper_1567.employees_with_departments
ADD full_name VARCHAR(30);

UPDATE hopper_1567.employees_with_departments
SET full_name = CONCAT(first_name, " ", last_name);

ALTER TABLE hopper_1567.employees_with_departments
DROP COLUMN first_name;

ALTER TABLE hopper_1567.employees_with_departments
DROP COLUMN last_name;

-- this table could be made using CONCAT in the CREATE TEMPORARY TABLE command

USE sakila;

CREATE TEMPORARY TABLE hopper_1567.sakila_payment AS 
SELECT * FROM payment;

ALTER TABLE hopper_1567.sakila_payment
MODIFY COLUMN amount dec(10,2);

UPDATE hopper_1567.sakila_payment
SET amount = amount * 100;

ALTER TABLE hopper_1567.sakila_payment
MODIFY COLUMN amount int;

SELECT departments.dept_name AS "Department", 
	(AVG(salary) - (SELECT AVG(salary) FROM salaries)) / STDDEV(salary) AS "Z-Score"
FROM salaries
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE salaries.to_date > NOW()
GROUP BY 1
ORDER BY 2 DESC;
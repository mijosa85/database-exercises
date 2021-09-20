SELECT * FROM employees
WHERE first_name in ('Irena', 'Vidya', 'Maya');
-- 709 records returned */

SELECT * FROM employees
WHERE first_name = 'Irena' 
OR first_name = 'Vidya' 
OR first_name = 'Maya';
-- 709 records returned 

SELECT * FROM employees
WHERE gender = 'M'
AND (first_name = 'Vidya' OR
	first_name = 'Maya' OR
	first_name = 'Irena');
-- 441 records returned

SELECT * FROM employees
WHERE last_name LIKE 'E%';
--  7330 records returned

SELECT * FROM employees
WHERE last_name LIKE 'E%'
OR last_name LIKE '%E';
-- 30723 records returned

SELECT * FROM employees
WHERE last_name NOT LIKE 'E%'
AND last_name LIKE '%E';
-- 23393 records returned

SELECT * FROM employees
WHERE last_name LIKE 'e%'
AND last_name LIKE '%e';
-- 899 records returned

SELECT * FROM employees
WHERE last_name LIKE 'e%';
-- 7330 records returned

SELECT * FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';
-- 135214 records returned

SELECT * FROM employees
WHERE birth_date LIKE '%12-25';
-- 842 records returned

SELECT * FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '%12-25';
-- 362 records returned

SELECT * FROM employees
WHERE last_name LIKE '%Q%';
-- 1873 records returned

SELECT * FROM employees
WHERE last_name LIKE '%Q%'
AND last_name NOT LIKE '%qu%';
-- 547 records returned
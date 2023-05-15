
SELECT * FROM "Employees";
SELECT * FROM "Titles";
SELECT * FROM "Salaries";
SELECT * FROM "Departments";
SELECT * FROM "DepartmentEmployee";
SELECT * FROM "DepartmentManager";


--Data Analysis

--1.List the employee number, last name, first name, sex, and salary of each employee.

SELECT emp."ID",emp."last_name",emp."first_name", emp."sex", sal."salary"
FROM "Employees" emp
INNER JOIN "Salaries" sal
ON (emp."ID" = sal."emp_id");


--2.List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT emp."first_name",emp."last_name", emp."hire_date"
FROM "Employees" emp
WHERE emp."hire_date" LIKE '%1986';


--3.List the manager of each department along with their department number, department name, 
--employee number, last name, and first name.

SELECT emp."ID",emp."last_name",emp."first_name", dept."ID" AS "Dept No.",dept."name" AS "Dept Name"
FROM "Employees" emp
INNER JOIN "DepartmentManager" dept_manager ON (emp."ID" = dept_manager."emp_id")
INNER JOIN "Departments" dept ON (dept."ID" = dept_manager."dept_id");

--4.List the department number for each employee along with that employee’s employee number,
--last name, first name, and department name.

--Creating View for Sales and Development Department required for Query 7 

CREATE VIEW Sales_Development_dept AS
SELECT emp."ID",emp."last_name",emp."first_name",dept_emp."dept_id" AS "Dept No.",dept."name" AS "Dept Name"
FROM "Employees" emp
INNER JOIN "DepartmentEmployee" dept_emp ON (emp."ID" = dept_emp."emp_id")
INNER JOIN "Departments" dept ON (dept."ID" = dept_emp."dept_id");

--5.List the first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B.

SELECT emp."first_name",emp."last_name", emp."sex"
FROM "Employees" emp
WHERE ((emp."first_name" = 'Hercules') AND (emp."last_name" LIKE 'B%'));

--6.List each employee in the Sales department, including their employee number, last name, 
--and first name.

SELECT emp."ID",emp."last_name",emp."first_name"
FROM "Employees" emp
WHERE emp."ID" IN
(
	SELECT dept_emp."emp_id" 
	FROM "DepartmentEmployee" dept_emp
	WHERE dept_emp."dept_id" IN
	(
		SELECT dept."ID"
		FROM "Departments" dept
		WHERE dept."name" = 'Sales'
	)
);

--7.List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT "ID","last_name","first_name","name"
FROM Sales_Development_dept
WHERE (("name" = 'Sales') OR ("name" = 'Development') );

--8.List the frequency counts, in descending order, of all the employee last names
--(that is, how many employees share each last name).

SELECT "last_name", COUNT(last_name) AS "Frequency Count"
FROM "Employees"
GROUP BY last_name
ORDER BY "Frequency Count" DESC;




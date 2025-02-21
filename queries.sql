--- List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
employees.emp_no as "Employee Number",
employees.last_name as "Last Name",
employees.first_name as "First Name",
employees.sex as "Sex",
salaries.salary as "Salary" 
FROM employees
INNER JOIN salaries ON employees.emp_no=salaries.emp_no

--- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT
first_name as "First Name",
last_name as "Last Name",
hire_date as "Hire Date"
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986

--- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT
dept_manager.dept_no as "Department Number",
departments.dept_name as "Department Name",
dept_manager.emp_no as "Employee Number",
employees.last_name as "Last Name",
employees.first_name as "First Name"
FROM dept_manager
INNER JOIN departments ON departments.dept_no = dept_manager.dept_no
INNER JOIN employees ON employees.emp_no = dept_manager.emp_no

--- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT
dept_emp.dept_no as "Department Number",
dept_emp.emp_no as "Employee Number",
employees.last_name as "Last Name",
employees.first_name as "First Name",
departments.dept_name as "Department Name"
FROM dept_emp
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON employees.emp_no = dept_emp.emp_no

--- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
first_name as "First Name",
last_name as "Last Name",
sex as "Sex"
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
dept_emp.emp_no as "Employee Number",
employees.last_name as "Last Name",
employees.first_name as "First Name",
departments.dept_name as "Department Name"
FROM dept_emp
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON employees.emp_no = dept_emp.emp_no
WHERE dept_emp.dept_no = 'd007'

--- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
dept_emp.emp_no as "Employee Number",
employees.last_name as "Last Name",
employees.first_name as "First Name",
departments.dept_name as "Department Name"
FROM dept_emp
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON employees.emp_no = dept_emp.emp_no
WHERE dept_emp.dept_no = 'd007' OR dept_emp.dept_no = 'd005'

--- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name as "Last Name", COUNT(*) 
FROM employees
GROUP BY last_name
ORDER BY COUNT(*) DESC

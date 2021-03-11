-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
From employees as e
JOIN salaries as s ON 
e.emp_no=s.emp_no
;
select * from employees;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name,last_name,hire_date
From employees
Where hire_date between '1986-01-01' and '1986-12-31'
;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no,d.dept_name,dm.emp_no,e.last_name,e.first_name
From department_manager as dm
INNER JOIN department as d
ON dm.dept_no=d.dept_no
INNER JOIN employees as e
ON dm.emp_no = e.emp_no
;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
From employees as e
INNER JOIN department_manager as dm
ON e.emp_no=dm.emp_no
INNER JOIN department as d
ON dm.dept_no=d.dept_no
;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name,last_name,sex
FROM employees
WHERE first_name='Hercules' AND last_name like 'B%'
;

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM employees as e
JOIN department_employees as de
ON e.emp_no=de.emp_no
INNER JOIN department as d
ON de.dept_no=d.dept_no
WHERE dept_name='Sales'
;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM employees as e
JOIN department_employees as de
ON e.emp_no=de.emp_no
INNER JOIN department as d
ON de.dept_no=d.dept_no
WHERE dept_name='Sales' OR dept_name='Development'
;

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) FROM Employees
GROUP BY last_name
ORDER BY count(last_name) desc
;
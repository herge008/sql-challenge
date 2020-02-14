-- 1.  List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees AS e
	LEFT JOIN salaries AS s ON s.emp_no = e.emp_no
ORDER BY e.last_name ASC, e.first_name ASC;

-- 2. List employees who were hired in 1986.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, e.hire_date
FROM employees AS e
WHERE e.hire_date LIKE '1986%'
ORDER BY e.last_name ASC, e.first_name ASC;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, e.hire_date, dm.to_date
FROM employees AS e
	INNER JOIN dept_manager AS dm ON dm.emp_no = e.emp_no
	LEFT JOIN departments AS d ON dm.dept_no = d.dept_no
--WHERE dm.to_date = '9999-01-01'
ORDER BY e.last_name ASC, e.first_name ASC;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	INNER JOIN dept_emp AS de ON de.emp_no = e.emp_no
	LEFT JOIN departments AS d ON d.dept_no = de.dept_no
	WHERE de.to_date = '9999-01-01'
ORDER BY e.last_name ASC, e.first_name ASC;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%'
ORDER BY last_name ASC;

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	INNER JOIN dept_emp AS de ON de.emp_no = e.emp_no
	LEFT JOIN departments AS d ON d.dept_no = de.dept_no
	WHERE de.to_date = '9999-01-01'
	AND d.dept_name = 'Sales'
ORDER BY e.last_name ASC, e.first_name ASC;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	INNER JOIN dept_emp AS de ON de.emp_no = e.emp_no
	LEFT JOIN departments AS d ON d.dept_no = de.dept_no
	WHERE de.to_date = '9999-01-01'
	AND d.dept_name IN ('Sales', 'Development')
ORDER BY e.last_name ASC, e.first_name ASC;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(gender) AS emp_count
FROM employees
GROUP BY last_name
ORDER BY emp_count DESC;
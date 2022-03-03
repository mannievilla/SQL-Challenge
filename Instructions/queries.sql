--1. 	List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        e.sex,
        s.salary
FROM employees as e
    LEFT JOIN salaries as s
    ON (e.emp_no = s.emp_no)
ORDER BY e.emp_no;

--2. 	List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
		
--3. 	List the manager of each department with the following information: department number, department name, 
--		the manager's employee number, last name, first name.
		
Select 	d.dept_no, 
		d.dept_name, 
		e.emp_no, 
		e.first_name, 
		e.last_name
	From dept_manager
		Left Join departments As d
		On (dept_manager.dept_no = d.dept_no)
			Join employees As e
			On (dept_manager.emp_no = e.emp_no);
		
--		4. List the department of each employee with the following information: employee number, last name, 
--		first name, and department name.

Select 	e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
	From dept_emp
		Left Join employees As e
		On (dept_emp.emp_no = e.emp_no)
			Join departments As d
			On (dept_emp.dept_no = d.dept_no);
			
		
--		5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

Select 	first_name,
		last_name,
		sex
	From employees
	Where first_name Like 'Hercules' AND last_name Like 'B%';


--		6. List all employees in the Sales department, including their employee number, last name, first name, and department name.


Select * From dept_emp
Select * From departments
Select * From employees


Select 	e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
	From employees As e
		Left Join dept_emp
		On (e.emp_no = dept_emp.emp_no)
			Join departments As d
				On (d.dept_no = dept_emp.dept_no)
				Where d.dept_name = 'Sales';


--		7. List all employees in the Sales and Development departments, including their employee number, last name, 
--		first name, and department name.

Select 	e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
	From employees As e
		Left Join dept_emp
		On (e.emp_no = dept_emp.emp_no)
			Join departments As d
				On (d.dept_no = dept_emp.dept_no)
				Where d.dept_name = 'Sales' Or d.dept_name = 'Development';


--		8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

Select last_name,
Count(Distinct last_name)
	From employees
	Group By last_name 
	Order by last_name Desc;
	
	
	


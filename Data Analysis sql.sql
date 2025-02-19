SELECT * FROM departments

SELECT * FROM titles

SELECT * FROM employees

SELECT * FROM dept_emp

SELECT * FROM dept_manager

SELECT * FROM salaries

-------------------------------------------------------

SELECT 
    employees.emp_no,
    employees.last_name,
    employees.first_name,
    employees.sex,
    salaries.salary
FROM 
    employees
JOIN 
    salaries ON employees.emp_no = salaries.emp_no;

-------------------------------------------------------

SELECT 
    first_name,
    last_name,
    hire_date
FROM 
    employees
WHERE 
    EXTRACT(YEAR FROM hire_date) = 1986;

-----------------------------------------------------------------

SELECT 
    departments.dept_no,
    departments.dept_name,
    dept_manager.emp_no,
    employees.last_name,
    employees.first_name
FROM 
    departments
JOIN 
    dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN 
    employees ON dept_manager.emp_no = employees.emp_no;

--------------------------------------------------------------------

SELECT 
    dept_emp.dept_no,
    employees.emp_no,
    employees.last_name,
    employees.first_name,
    departments.dept_name
FROM 
    employees
JOIN 
    dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN 
    departments ON dept_emp.dept_no = departments.dept_no;

---------------------------------------------------------------------

SELECT 
    first_name,
    last_name,
    sex
FROM 
    employees
WHERE 
    first_name = 'Hercules' 
    AND last_name LIKE 'B%';

--------------------------------------------------------------

SELECT 
    departments.dept_name,
    employees.emp_no,
    employees.last_name,
    employees.first_name
FROM 
    employees
JOIN 
    dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN 
    departments ON dept_emp.dept_no = departments.dept_no
WHERE 
    departments.dept_name = 'Sales';

--------------------------------------------------------------

SELECT 
    departments.dept_name,
    employees.emp_no,
    employees.last_name,
    employees.first_name
FROM 
    employees
JOIN 
    dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN 
    departments ON dept_emp.dept_no = departments.dept_no
WHERE 
    departments.dept_name IN ('Sales', 'Development');

---------------------------------------------------------------

SELECT 
    employees.last_name,
    COUNT(employees.last_name) AS last_name_count
FROM 
    employees
GROUP BY 
    employees.last_name
ORDER BY 
    last_name_count DESC;
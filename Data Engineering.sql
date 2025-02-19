DO $$ 
DECLARE 
    r RECORD;
BEGIN 
    FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = 'public') 
    LOOP 
        EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(r.tablename) || ' CASCADE';
    END LOOP; 
END $$;

CREATE TABLE departments (
    dept_no VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE titles (
    emp_title_id VARCHAR(50) PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(50) NOT NULL,
	birth_date Date NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date Date NOT NULL,
	Foreign Key (emp_title_id) References titles(emp_title_id)
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(10) NOT NULL,
	Primary Key (dept_no, emp_no),
	Foreign Key (dept_no) References departments(dept_no),
	Foreign Key (emp_no) References employees(emp_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(10) NOT NULL,
    emp_no INT NOT NULL,
	Primary Key (dept_no, emp_no),
	Foreign Key (dept_no) References departments(dept_no),
	Foreign Key (emp_no) References employees(emp_no)
);


CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary Decimal(10,2) NOT NULL,
	Foreign Key (emp_no) References employees(emp_no)
);


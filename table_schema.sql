--- Create The Tables

---Employees Table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(20) NOT NULL,
    birth_date DATE,
    first_name VARCHAR(30)  NOT NULL,
    last_name VARCHAR(30)  NOT NULL,
    sex VARCHAR(1),
    hire_date DATE NOT NULL
	
);

--- Department Table
CREATE TABLE departments (
    dept_no CHAR(10) PRIMARY KEY,
    dept_name VARCHAR(30) NOT NULL UNIQUE
);

-- Department_Employee Table
CREATE TABLE dept_emp (
    emp_no INT NOT NULL PRIMARY KEY,
    dept_no CHAR(10) NOT NULL 
   
);

--- Department_Manager Table
CREATE TABLE dept_manager (
    dept_no CHAR(10) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--- Titles Table
CREATE TABLE titles (
    title_id VARCHAR(10) NOT NULL PRIMARY KEY,
    title VARCHAR(30) NOT NULL
);

--- Salaries Table
CREATE TABLE salaries (
    emp_no INT  NOT NULL PRIMARY KEY,
    salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
    
);

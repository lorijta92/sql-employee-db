-- Define schema and import data from csv files.

-- Create a table for departments
CREATE TABLE departments (
    dept_no VARCHAR(5) NOT NULL,
    dept_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (dept_no)
);

-- Create a table for employees
CREATE TABLE employees (
    emp_no INT NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    gender VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no)
);

-- Create a table for department and employee information
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(5) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

-- Create a table for managers
CREATE TABLE dept_manager (
    emp_no INT NOT NULL,
    dept_no VARCHAR(5) NOT NULL, 
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

-- Create a table for salaries
CREATE TABLE salaries (
    emp_no INT NOT NULL PRIMARY KEY,
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

-- Create a table for employee titles
CREATE TABLE titles (
    emp_no INT NOT NULL PRIMARY KEY,
    title VARCHAR(30) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);
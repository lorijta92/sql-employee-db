### Goal

Use SQL to analyze data on employees of a company from the 1980s and 1990s using six CSV files.

### Process

The first step before performing any queries was to sketch out an ERD of the tables. I used [QuickDBD](https://www.quickdatabasediagrams.com) to quickly see how the tables corresponding to each CSV file would relate to each other.  

![ ERD_image.png](https://github.com/lorijta92/sql-employee-db/blob/master/Images/ERD_image.png)

Using the ERD, I created the schema for the tables in my database, specifying data types, and setting primary and foreign keys as appropriate. I then imported the data into these tables. 

There were nine main “questions” I wanted to answer, the first eight being done through PostgreSQL. 

For my first query, I wanted to find the employee number, last name, first name, gender, and salary of every employee. The information I needed was contained on two tables, `employees` and `salaries`, so I selected the appropriate columns and then joined those tables with an inner join on `emp_no`, which both tables had.

![emp_gender_salary.png](https://github.com/lorijta92/sql-employee-db/blob/master/Images/Tables/emp_gender_salary.png)

For the second query, I wanted to list all employees who were hired in 1986. I selected the `first_name`, `last_name`, and `hire_date` columns from the `employees` table and then used the `WHERE` clause to set the date of hire condition. 

![emp1986.png](https://github.com/lorijta92/sql-employee-db/blob/master/Images/Tables/emp1986.png)

The third query looked into managers, listing the department number and name, and the managers’ name, employee number, and employment dates. The relevant information was stored in four separate tables this time, which required three inner joins. As before, I selected the relevant columns and then joined the `dept_manager` table with the `employees` table, and the `employees` table with the `dept_emp` table, both on `emp_no`. I joined the `dept_emp` table with the `departments` table on `dept_no`. 

![manager_info.png](https://github.com/lorijta92/sql-employee-db/blob/master/Images/Tables/manager_info.png)

For the fourth query, I wanted to list the departments of every employee along with their full name and employee number. The information I needed was stored on two tables, `employees` and `departments`. However, the tables did not share any primary/foreign keys. I therefore, had to use a third table (`dept_emp`) to join the other to together. I first joined `employees` to `dept_emp` on the shared `emp_no`, and then `dept_emp` to `departments` on the shared `dept_no`. Through these joins, I was able to display the department name of each employee along with their name and employee number. 

![emp_dept_info.png](https://github.com/lorijta92/sql-employee-db/blob/master/Images/Tables/emp_dept_info.png)

For the fifth query, I wanted to list all employees whose first name is "Hercules" and last names begin with "B." To do this, I set two conditions joined by the `AND` clause, and made use of the SQL wildcard character `%` to search for last names beginning with “B”.

![hercules_b.png](https://github.com/lorijta92/sql-employee-db/blob/master/Images/Tables/hercules_b.png)

The sixth query was much like the fourth, except I wanted to list information only for employees in the Sales department. Instead of repeating the fourth query, I created a view of it, named `emp_info`, and queried that, setting the condition of  the department name being “Sales”.

![sales_emp.png](https://github.com/lorijta92/sql-employee-db/blob/master/Images/Tables/sales_emp.png)

The seventh query was like the sixth, but looked into employees in the Development department as well. Here, I used the same query as in the sixth, but for the condition, I used a subquery to search for the department name being “Sales” or “Development”. 

![sales_dev_emp.png](https://github.com/lorijta92/sql-employee-db/blob/master/Images/Tables/sales_dev_emp.png)

For the eighth query, I wanted to count how many employees shared the same last name. To do this, I selected the `last_name` column from the `employees` table and then also used the `COUNT()` function on the same column. I then grouped the data by last names and ordered the data by the count of last names in descending order to see the last names that were most shared among employees. 

![emp_last_name_count]( https://github.com/lorijta92/sql-employee-db/blob/master/Images/Tables/emp_last_name_count.png)

Finally, I wanted to determine the average salary for each position in the company and graph my findings. To accomplish this, I made use of SQL Alchemy to import the database into Pandas. After connecting to the database and creating an engine, I imported `emp_no` and `salary` from the `salaries` table and `emp_no` and `title` from the `titles` table. I then performed an inner join of the two tables on the shared `emp_no` before grouping the data by `title`. I then took the mean of the salaries per title and rounded by two decimal points. I then plot the data in a bar chart to find that there was not much variance in salary amounts between each employee title.

![avgsalarytitle.png](https://github.com/lorijta92/sql-employee-db/blob/master/Images/avgsalarytitle.png)

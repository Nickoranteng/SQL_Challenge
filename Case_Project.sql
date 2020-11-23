---------------------------importing Departments Table from Csv-------------
CREATE TABLE Departments
			(dept_no varchar(20) primary key
			 ,dept_name varchar(30)
			)
copy Departments from 'C:\Users\nicko\gwu-arl-data-pt-09-2020-u-c\02-Homework\09-SQL\Part-2-Case-Assignment\data\departments.csv' with CSV HEADER;
select * from departments

----------------------------importing Employees Table from Csv-------------
create table Employees (emp_no int primary key 
						,emp_title varchar (20)
						,birth_date date
						,first_name varchar (30)
						,last_name varchar(30)
						,sex char(1)
						,hire_date Date not null
					   );
copy employees from 'C:\Users\nicko\gwu-arl-data-pt-09-2020-u-c\02-Homework\09-SQL\Part-2-Case-Assignment\data\employees.csv' with CSV HEADER
select * from Employees;

---------------------------importing Dept_Emp Table from Csv-----------------
create table Dept_Emp(emp_no int, constraint fk_emp foreign key (emp_no) references Employees (emp_no),
					  Dept_no varchar (20), constraint fk_dept foreign key(dept_no) references Departments(Dept_no)
					 );
 
copy Dept_Emp from 'C:\Users\nicko\gwu-arl-data-pt-09-2020-u-c\02-Homework\09-SQL\Part-2-Case-Assignment\data\dept_emp.csv' with CSV HEADER

select * from Dept_Emp;

--------------------------importing salaries Table from Csv--------------------
create table salaries (emp_no int,constraint fk_emp_no foreign key (emp_no)references Employees (emp_no),
					   salary money
					  );
copy salaries from 'C:\Users\nicko\gwu-arl-data-pt-09-2020-u-c\02-Homework\09-SQL\Part-2-Case-Assignment\data\salaries.csv' with CSV HEADER

select * from salaries;


---------------------------importing Titles Table from Csv------------------
create table Titles (title_id varchar(30)primary key,
					title varchar (40)
					);
copy Titles from 'C:\Users\nicko\gwu-arl-data-pt-09-2020-u-c\02-Homework\09-SQL\Part-2-Case-Assignment\data\Titles.csv' with CSV HEADER












/*1. List the following details of each employee: employee number, last name, first name, sex, and salary.*/
select 
	e.emp_no
	,e.last_name
	,e.first_name
	,e.sex, s.salary 
from employees as e
left JOIN salaries as s
on e.emp_no = s.emp_no


/*2. List first name, last name, and hire date for employees who were hired in 1986.*/
select first_name
	,last_name
	,hire_date 
from employees
where hire_date >'1985-12-31'and hire_date <'1987-01-01'
order by hire_date 

/*3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.*/


/*4. List the department of each employee with the following information: employee number, last name, first name, and department name.*/
select e.emp_no
	,e.last_name
	,e.first_name
	,d.dept_name  
from employees as e
left join dept_emp as de
on e.emp_no = de.emp_no
left join departments as d
on de.dept_no = d.dept_no


/*5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."*/

select first_name
	,last_name
	,sex 
from employees
where first_name = 'Hercules' and last_name like  'B%'


/*6. List all employees in the Sales department, including their employee number, last name, first name, and department name.*/
select e.emp_no
	,e.last_name
	,e.first_name
	,d.dept_name  
from employees as e
LEFT join dept_emp as de
on e.emp_no = de.emp_no
LEFT join departments as d
on de.dept_no = d.dept_no
where d.dept_name = 'Sales'


/*7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.*/
select e.emp_no
	,e.last_name
	,e.first_name
	,d.dept_name  
from employees as e
LEFT join dept_emp as de
on e.emp_no = de.emp_no
left join departments as d
on de.dept_no = d.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development'


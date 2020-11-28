---------------------------importing Departments Table from Csv-------------
CREATE TABLE Departments
			(dept_no varchar(20) primary key
			 ,dept_name varchar(30)
			)
copy Departments from 'C:\Users\nicko\gwu-arl-data-pt-09-2020-u-c\02-Homework\09-SQL\Part-2-Case-Assignment\data\departments.csv' with CSV HEADER;
select * from departments

----------------------------importing Employees Table from Csv-------------
create table Employees (emp_no int primary key 
						,emp_title varchar (20),constraint fk_emp_tit foreign key (emp_title) references Titles(title_id)
						,birth_date date
						,first_name varchar (30)
						,last_name varchar(30)
						,sex char(1)
						,hire_date Date not null
					   );
copy employees from 'C:\Users\nicko\gwu-arl-data-pt-09-2020-u-c\02-Homework\09-SQL\Part-2-Case-Assignment\data\employees.csv' with CSV HEADER
select * from Employees;

---------------------------importing Dept_Emp Table from Csv-----------------
create table Dept_Emp(emp_no int, constraint fk_emp foreign key (emp_no) references Employees (emp_no)
					  ,Dept_no varchar (20), constraint fk_dept foreign key(dept_no) references Departments(Dept_no)
					 );
 
copy Dept_Emp from 'C:\Users\nicko\gwu-arl-data-pt-09-2020-u-c\02-Homework\09-SQL\Part-2-Case-Assignment\data\dept_emp.csv' with CSV HEADER

select * from Dept_Emp;
--------------------------
create table dept_manager(dept_no varchar(20), constraint fk_dept_no foreign key(dept_no)references Departments (dept_no)
						 ,emp_no int, constraint fk_emp_no foreign key (emp_no )references Employees(emp_no)
						 );

copy dept_manager from 'C:\Users\nicko\gwu-arl-data-pt-09-2020-u-c\02-Homework\09-SQL\Part-2-Case-Assignment\data\dept_manager.csv' with CSV HEADER
select * from dept_manager

--------------------------importing salaries Table from Csv--------------------
create table salaries (emp_no int,constraint fk_emp_no foreign key (emp_no)references Employees (emp_no)
					   ,salary money
					  );
copy salaries from 'C:\Users\nicko\gwu-arl-data-pt-09-2020-u-c\02-Homework\09-SQL\Part-2-Case-Assignment\data\salaries.csv' with CSV HEADER

select * from salaries;


---------------------------importing Titles Table from Csv------------------
create table Titles (title_id varchar(30)primary key
					,title varchar (40)
					);
copy Titles from 'C:\Users\nicko\gwu-arl-data-pt-09-2020-u-c\02-Homework\09-SQL\Part-2-Case-Assignment\data\Titles.csv' with CSV HEADER

select * from titles;







select * from Departments;
select * from Employees;
select * from Dept_emp;
select * from dept_manager;
select * from Salaries;
select * from Titles;



/*1. List the following details of each employee: employee number, last name, first name, sex, and salary.*/
select 
	e.emp_no
	,e.last_name
	,e.first_name
	,e.sex, s.salary 
from employees as e
left JOIN salaries as s
on e.emp_no = s.emp_no;


/*2. List first name, last name, and hire date for employees who were hired in 1986.*/
select first_name
	,last_name
	,hire_date 
from Employees
where hire_date >'1985-12-31'and hire_date <'1987-01-01'
order by hire_date; 

/*3. List the manager of each department with the following information: department number, department name, the manager's employee number, 
last name, first name.*/

select dm.dept_no
		,d.dept_name
		,dm.emp_no
		,t.title
		,e.last_name
		,e.first_name from employees as e
inner join dept_manager as dm
on e.emp_no = dm.emp_no
inner join departments as d
on d.dept_no = dm.dept_no
inner join titles as t
on t.title_id = e.emp_title_id



/*4. List the department of each employee with the following information: employee number, last name, first name, and department name.*/
select e.emp_no
	,e.last_name
	,e.first_name
	,d.dept_name  
from employees as e
left join dept_emp as de
on e.emp_no = de.emp_no
left join departments as d
on de.dept_no = d.dept_no;


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
where d.dept_name = 'Sales' or d.dept_name = 'Development';



/*8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.*/
select last_name, count(last_name) as frequency_count
from employees
group by last_name
order by frequency_count desc;



select title, ROUND(AVG(CAST(salary AS DEC)),2)as Average_Salary
from salaries as s 
inner join employees as e
on s.emp_no = e.emp_no
inner join titles as t
on t.title_id = e.emp_title_id
group by title;



 
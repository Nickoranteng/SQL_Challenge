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
create table salaries (emp_no int, foreign key (emp_no)references Employees (emp_no),
					   salary money
					  );
copy salaries from 'C:\Users\nicko\gwu-arl-data-pt-09-2020-u-c\02-Homework\09-SQL\Part-2-Case-Assignment\data\salaries.csv' with CSV HEADER

select * from salaries;


---------------------------importing Titles Table from Csv------------------
create table Titles (title_id varchar(30)primary key,
					title varchar (40)
					);
copy Titles from 'C:\Users\nicko\gwu-arl-data-pt-09-2020-u-c\02-Homework\09-SQL\Part-2-Case-Assignment\data\Titles.csv' with CSV HEADER




--EXCERCISE 3-1
select 
	EmployeeID
	,FirstName
	,LastName
from Employees
 order by FirstName
         ,LastName;
		 

--EXCERCISE 3-2
select 
	Account_ID
	,Customer_ID
	,Avail_balance
from account
 where AccountStatus = 'active' 
  and Avail_balance > $2500;


--EXCERCISE 3-3
select distinct 
	 open_emp_id
from account  
  



--EXCERCISE 3-4
select 
	p.product_cd
	,a.cust_id
	,a.avail_balance
from product as p
 inner join account as a
  on p.product_cd = a.product_cd
   where product_type_cd = 'ACCOUNT'
order by product_cd
		,cust_id;	
			

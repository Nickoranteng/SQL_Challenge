-- 1. What is the average cost to rent a film in the stores?
select  round(avg(rental_rate),2)from film
 
-- 2. What is the average rental cost of films by rating? On average, what is the cheapest rating of films to rent? Most expensive?
select rating,round(avg(rental_rate),2) from film
group by rating

-- 3. How much would it cost to replace all the films in the database?
select  sum(replacement_cost) from film

-- 4. How much would it cost to replace all the films in each ratings category?
select rating , sum(replacement_cost) from film
group by rating

-- 5. How long is the longest movie in the database? 

select * from film 
where 
length in (select  max(length) from film)

-- 5. How long is the shortest movie in the database? 
select * from film 
where 
length in (select  min(length) from film)




;with kwame 
 as 
 (select length from film
  order by length desc)
  select Max(length) from kwame
 


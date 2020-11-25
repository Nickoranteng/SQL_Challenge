create view actor_info_vw
as 
select f.title
		,first_name || ' ' ||last_name as fullName
from film_actor as fa
inner join film as f
on f.film_id = fa.film_id
inner join actor as a 
on a.actor_id = fa.actor_id


CREATE VIEW SUBQUERY_VW
AS
select 
 	first_name
	,last_name from actor
where actor_id in
	(select actor_id 
	from film_actor
	where film_id in 
	 	(select film_id 
		 from film
		where title = 'ALTER VICTORY' ) )










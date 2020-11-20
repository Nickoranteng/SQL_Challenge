/*# JOIN Drills

1.  For your first drill, complete the following:
    * Write a query to return the film title along with all of the actors who played in that film.
      * You will need to join three tables to accomplish this.
      * You should figure out the order for which to join the tables, but the tables are `actor`, `film`, and `film_actor`
    * Your query should return the film title (aliased as film_title) along with the concatenated actor name in a column aliased as `actor_name`
    * Sort your result set by `film_title` and `actor_name`.

2.  For your second drill, complete the following:
        * Write a query to return the film category, film title, along with all of the actors who played in that film.
          * You will need to join five tables to accomplish this.
          * You should figure out the order for which to join the tables, but the tables are `actor`, `category` `film`, `film_actor`, and `film_category`
        * Your query should return the film category (aliased as film_category), film title (aliased as film_title) along with the concatenated actor name in a column aliased as `actor_name`
        * Sort your result set by `film_category`,  `film_title` and `actor_name`.
		*/
select * from category as c		
select * from film
select * from actor
select * from film_actor
select * from film_category

---------

select
c.name AS film_category,
f.title AS film_title,
first_name || ' '|| last_name as actor_name
from film as f 
  inner join film_actor as fa 
  on f.film_id = fa.film_id
  inner join actor as ac
  on fa.actor_id= ac.actor_id
inner join film_category as fc
   on fc.film_id = f.film_id
inner join category as c
   on c.category_id = fc.category_id
order by film_category,
          film_title,
          actor_name
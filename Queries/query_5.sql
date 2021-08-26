select actor.first_name, actor.last_name, film.release_year from film 
join film_actor using(film_id)
join actor using(actor_id)
where description like "%Crocodile%" and description like "%Shark%"
ORDER by actor.last_name;
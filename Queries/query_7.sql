select first_name, last_name from actor 
where first_name = (select first_name from actor where actor_id = 8)
and actor_id <> 8;
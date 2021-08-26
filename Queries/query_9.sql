select c.first_name, c.last_name
from rental as r
join customer as c USING(customer_id)
where (SELECT EXTRACT(YEAR FROM r.rental_date)) = 2005
group by r.customer_id
ORDER by COUNT(r.customer_id) desc
limit 3;
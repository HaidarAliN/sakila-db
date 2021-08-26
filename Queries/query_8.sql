select sum(p.amount) as Sum, avg (p.amount) as Avg, extract(month from r.rental_date) as month, extract(year from r.rental_date) as year ,s.store_id as store 
from rental r 
join customer c using(customer_id)
join payment p using(rental_id)
join store s using(store_id)
group by extract(year from r.rental_date), extract(month from r.rental_date), s.store_id;
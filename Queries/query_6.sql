SELECT c.name, count(fc.category_id)  FROM film
join film_category as fc using(film_id)
join category as c using(category_id)
group by fc.category_id
having  count(fc.category_id) BETWEEN 55 and 65
order by count(fc.category_id);
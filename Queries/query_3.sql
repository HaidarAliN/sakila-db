select country.country
from customer as c
join address as a using(address_id)
join city USING(city_id)
join country using(country_id)
group by (city.country_id)
ORDER by COUNT(country.country) DESC
LIMIT 3;
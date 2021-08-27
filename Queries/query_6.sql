SELECT c.name, count(fc.category_id)  FROM film f
join film_category as fc using(film_id)
join category as c using(category_id)
group by fc.category_id
having  IF(
            (select count(b.a) from (SELECT c.name, count(fc.category_id) as a  FROM film f #test if there is counts between 55 and 65
          join film_category as fc using(film_id)
          join category as c using(category_id)
          group by fc.category_id
          having  count(fc.category_id) BETWEEN 55 and 65
          order by count(fc.category_id) desc) b) > 0
    ,
          (COUNT(fc.category_id)>55 AND COUNT(fc.category_id)<65) #if yes return them
    ,
          COUNT(fc.category_id) = (select max(b.a) from (SELECT c.name, count(fc.category_id) as a  FROM film f #if no return max category count
          join film_category as fc using(film_id)
          join category as c using(category_id)
          group by fc.category_id
          having  max(fc.category_id)
          order by count(fc.category_id) desc) b))
order by count(fc.category_id) desc;
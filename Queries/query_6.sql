SELECT c.name as Name, count(fc.category_id) as Count  FROM film_category as fc
join category as c using(category_id)
group by fc.category_id
having  IF(
            (select count(b.a) from (SELECT count(fc.category_id) as a  FROM film_category as fc#test if there is counts between 55 and 65
          group by fc.category_id
          having  count(fc.category_id) BETWEEN 55 and 65) b) > 0
    ,
          (COUNT(fc.category_id)>55 AND COUNT(fc.category_id)<65) #if yes return them
    ,
          COUNT(fc.category_id) = (select max(b.a) from (SELECT count(fc.category_id) as a  FROM film_category as fc#if no return max category count
          group by fc.category_id
          having  max(fc.category_id)) b))
order by count(fc.category_id) desc;
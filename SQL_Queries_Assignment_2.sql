-- 1. Find out the number of documentaries with deleted scenes.
/*SELECT FL.FID, FL.category, F.special_features FROM sakila.film_list FL
INNER JOIN sakila.film F
ON FL.FID=F.film_id
WHERE FL.category="Documentary" AND F.special_features LIKE "%Deleted Scenes%";*/

SELECT COUNT(*) AS total_doc_del FROM sakila.film_list FL
INNER JOIN sakila.film F
ON FL.FID=F.film_id
WHERE FL.category="Documentary" AND F.special_features LIKE "%Deleted Scenes%";

-- 2. Find out the number of sci-fi movies rented by the store managed by Jon Stephens.

SELECT  DISTINCT CONCAT(S.first_name," ",S.last_name) as manager_name, I.film_id, FL.category, I.store_id 
FROM ((sakila.inventory I
INNER JOIN sakila.staff S ON S.store_id=I.store_id)
INNER JOIN sakila.film_list FL ON FL.FID=I.film_id)
WHERE FL.category="Sci-Fi" AND CONCAT(S.first_name," ",S.last_name)="Jon Stephens";


-- 3. Find out the total sales from Animation movies.

SELECT * FROM sakila.sales_by_film_category
WHERE category="Animation";

-- 4. Find out the top 3 rented category of movies by “PATRICIA JOHNSON”.

SELECT CL.name, F.film_id, R.inventory_id, I.film_id
FROM ((( sakila.inventory I
INNER JOIN sakila.rental R ON R.inventory_id=I.inventory_id)
INNER JOIN sakila.film F ON F.film_id=I.film_id)
INNER JOIN sakila.customer_list CL ON CL.ID=R.customer_id)
WHERE CL.name = "PATRICIA JOHNSON"
ORDER BY F.rental_rate DESC limit 3;

-- 5. Find out the number of R rated movies rented by “SUSAN WILSON”.

SELECT CL.name, F.film_id, F.rating, R.inventory_id, I.film_id
FROM ((( sakila.inventory I
INNER JOIN sakila.rental R ON R.inventory_id=I.inventory_id)
INNER JOIN sakila.film F ON F.film_id=I.film_id)
INNER JOIN sakila.customer_list CL ON CL.ID=R.customer_id)
WHERE CL.name = "SUSAN WILSON" and F.rating="R";



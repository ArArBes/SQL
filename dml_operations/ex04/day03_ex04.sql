(SELECT pizzeria.name AS pizzeria_name
FROM person
JOIN person_order ON person_order.person_id = person.id
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE gender = 'female'

EXCEPT 

SELECT pizzeria.name AS pizzeria_name
FROM person
JOIN person_order ON person_order.person_id = person.id
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE gender = 'male')

UNION 

(SELECT pizzeria.name AS pizzeria_name
FROM person
JOIN person_visits ON person_visits.person_id = person.id
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
WHERE gender = 'male'

EXCEPT 

SELECT pizzeria.name AS pizzeria_name
FROM person
JOIN person_visits ON person_visits.person_id = person.id
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
WHERE gender = 'female')

ORDER BY pizzeria_name;



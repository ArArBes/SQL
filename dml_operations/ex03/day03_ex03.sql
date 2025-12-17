(SELECT pizzeria.name AS pizzeria_name
FROM person
JOIN person_visits ON person_visits.person_id = person.id
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
WHERE gender = 'female'

EXCEPT ALL 

SELECT pizzeria.name AS pizzeria_name
FROM person
JOIN person_visits ON person_visits.person_id = person.id
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
WHERE gender = 'male')

UNION ALL

(SELECT pizzeria.name AS pizzeria_name
FROM person
JOIN person_visits ON person_visits.person_id = person.id
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
WHERE gender = 'male'

EXCEPT ALL 

SELECT pizzeria.name AS pizzeria_name
FROM person
JOIN person_visits ON person_visits.person_id = person.id
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
WHERE gender = 'female')

ORDER BY pizzeria_name;





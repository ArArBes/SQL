SELECT pizza_name, price, pizzeria.name AS pizzeria_name, visit_date
FROM person_visits
JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
JOIN menu ON menu.pizzeria_id = pizzeria.id
JOIN (SELECT id, name FROM person WHERE name = 'Kate') person ON person.id = person_visits.person_id
WHERE price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizzeria.name;

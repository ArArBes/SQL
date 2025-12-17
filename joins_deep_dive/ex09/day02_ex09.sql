SELECT DISTINCT person.name
FROM person
JOIN person_order ON person.id = person_order.person_id
JOIN menu ON person_order.menu_id = menu.id
WHERE gender = 'female' AND menu.pizza_name IN ('pepperoni pizza','cheese pizza')
ORDER BY person.name;
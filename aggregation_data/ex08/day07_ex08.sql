SELECT 
    person.address AS address,
    pizzeria.name AS name,
    COUNT(*) AS count_of_orders
FROM person
JOIN person_order ON person_order.person_id = person.id
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY (address, pizzeria.name)
ORDER BY address, name;
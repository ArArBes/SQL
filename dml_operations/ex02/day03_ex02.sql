SELECT pizza_name, price, pizzeria.name As pizzeria_name
FROM menu
JOIN (
    SELECT id AS menu_id
    FROM menu
    EXCEPT 
    SELECT menu_id 
    FROM person_order
) m ON menu.id = m.menu_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY pizza_name, price;


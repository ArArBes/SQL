SELECT 
    person.name AS name, 
    menu.pizza_name AS pizza_name, 
    menu.price AS price, 
    menu.price * (1 - person_discounts.discount  * 0.01)  AS discount_price, 
    pizzeria.name AS pizzeria_name
FROM person
JOIN person_order ON person_order.person_id = person.id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id 
JOIN person_discounts ON person_discounts.person_id = person.id AND person_discounts.pizzeria_id = pizzeria.id
ORDER BY name, pizza_name;


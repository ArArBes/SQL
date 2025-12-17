WITH match AS (
    SELECT pizza_name, pizzeria.name, price
    FROM pizzeria
    JOIN menu ON pizzeria.id = menu.pizzeria_id
)
SELECT m1.pizza_name, m1.name AS pizzeria_name_1, m2.name AS pizzeria_name_2, m2.price
FROM match m1
JOIN match m2 ON m1.pizza_name = m2.pizza_name AND m1.price = m2.price AND m1.name != m2.name
WHERE m1.name < m2.name
ORDER BY m1.pizza_name;



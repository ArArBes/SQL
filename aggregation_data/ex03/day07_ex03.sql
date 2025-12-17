WITH orders AS (
    SELECT pizzeria.name, COUNT(*) AS count, 'order' AS action_type 
    FROM person_order
    JOIN menu ON menu.id = person_order.menu_id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
    ORDER BY count DESC
),
visits AS (
    SELECT pizzeria.name, COUNT(*) AS count, 'visit' AS action_type 
    FROM person_visits
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
    ORDER BY count DESC
)
SELECT 
    COALESCE(orders.name, visits.name) AS name,
    COALESCE(orders.count, 0) + COALESCE(visits.count, 0) AS total_count 
FROM visits 
FULL JOIN orders ON orders.name = visits.name;

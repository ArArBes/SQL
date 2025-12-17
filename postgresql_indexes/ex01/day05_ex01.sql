SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT m.pizza_name, pizzeria.name AS pizzeria_name
FROM menu m
JOIN pizzeria ON m.pizzeria_id = pizzeria.id;
WITH m AS (
    SELECT pizzeria_id, pizza_name
    FROM menu
    WHERE price < 800
),
piz AS (
    SELECT id, name
    FROM pizzeria
),
vp AS (
    SELECT *
    FROM person_visits
    JOIN person ON person.id = person_visits.person_id
    WHERE person.name ='Dmitriy' AND person_visits.visit_date = '2022-01-08'
)
SELECT piz.name
FROM vp
JOIN m ON m.pizzeria_id = vp.pizzeria_id
JOIN piz ON piz.id = m.pizzeria_id 
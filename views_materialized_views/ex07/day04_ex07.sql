-- SELECT * FROM person_visits;
INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES
    ((SELECT MAX(id) + 1 FROM person_visits),
    (SELECT id FROM person WHERE person.name ='Dmitriy'),
    (SELECT pizzeria_id FROM menu WHERE price < 800 
    EXCEPT
    SELECT pizzeria.id 
    FROM mv_dmitriy_visits_and_eats
    JOIN pizzeria ON pizzeria.name = mv_dmitriy_visits_and_eats.name
    LIMIT 1),
    '2022-01-08');


REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

-- SELECT * FROM mv_dmitriy_visits_and_eats;
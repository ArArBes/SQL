SELECT person.name AS name, COUNT(*) AS count_of_visits
FROM person_visits
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
JOIN person ON person_visits.person_id = person.id
GROUP BY (person.name)
ORDER BY count_of_visits DESC
LIMIT 1;
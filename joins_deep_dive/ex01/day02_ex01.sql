SELECT missing_date::date
FROM generate_series('2022-01-01'::timestamp, '2022-01-10'::timestamp, '1 day') AS missing_date
LEFT JOIN (
    SELECT visit_date 
    FROM person_visits 
    WHERE person_id = 1 OR person_id = 2
) person_visits
ON missing_date = person_visits.visit_date
WHERE person_visits IS NULL
ORDER BY missing_date;
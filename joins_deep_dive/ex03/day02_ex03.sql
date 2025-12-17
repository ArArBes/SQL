WITH d AS (
    SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, interval '1 day')::date
    AS missing_date
),
vd AS (
    SELECT visit_date 
    FROM person_visits 
    WHERE person_id = 1 OR person_id = 2
)
SELECT d.missing_date
FROM d
LEFT JOIN vd ON d.missing_date = vd.visit_date
WHERE vd.visit_date IS NULL
ORDER BY missing_date;
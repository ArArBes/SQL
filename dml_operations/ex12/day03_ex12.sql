WITH maxid AS (
    SELECT (MAX(id) + 1) AS m FROM person_order
)
,
cpersons AS (
    SELECT COUNT(name) AS c FROM person
),
piz_id AS (
    SELECT id AS pid FROM menu WHERE pizza_name = 'greek pizza'
)
INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT 
    generate_series(m , m + c - 1) AS id,
    generate_series(1, (SELECT MAX(id) FROM person)) AS person_id,
    piz_id.pid AS menu_id,
    '2022-02-25' AS order_date
FROM maxid, cpersons, piz_id;

-- SELECT * FROM person_order;
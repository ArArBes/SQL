CREATE INDEX idx_person_name ON person(UPPER(name));

SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT person.name
FROM person
JOIN (SELECT UPPER(name) AS name FROM person) p ON UPPER(person.name) = p.name;


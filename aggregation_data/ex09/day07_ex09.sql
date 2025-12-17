WITH ages AS (SELECT 
    person.address,
    ROUND(MAX(age) - (MIN(age)::numeric / MAX(age)::numeric), 2) AS formula,
    ROUND(AVG(age), 2) AS average
FROM person
GROUP BY address
ORDER BY address)
SELECT address, formula, average, (formula > average) AS comparison 
FROM ages;


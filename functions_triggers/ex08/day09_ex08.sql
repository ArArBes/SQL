CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INT DEFAULT 10)
RETURNS TABLE(numbers INT) AS $$
WITH RECURSIVE fib(a, b) AS (
    SELECT 0, 1
    UNION ALL
    SELECT b, a + b
    FROM fib
    WHERE b < pstop
)
SELECT a AS numbers FROM fib WHERE pstop > 0;
$$ LANGUAGE sql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();

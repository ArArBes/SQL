CREATE INDEX idx_1 ON pizzeria (rating);

SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;

-- "Sort  (cost=25.95..26.00 rows=19 width=96) (actual time=0.083..0.084 rows=19 loops=1)"
-- "  Sort Key: m.pizza_name, (max(pz.rating) OVER (?))"
-- "  Sort Method: quicksort  Memory: 25kB"
-- "  ->  WindowAgg  (cost=25.21..25.55 rows=19 width=96) (actual time=0.059..0.065 rows=19 loops=1)"
-- "        ->  Sort  (cost=25.17..25.22 rows=19 width=64) (actual time=0.053..0.054 rows=19 loops=1)"
-- "              Sort Key: pz.rating"
-- "              Sort Method: quicksort  Memory: 25kB"
-- "              ->  Merge Join  (cost=0.27..24.77 rows=19 width=64) (actual time=0.041..0.046 rows=19 loops=1)"
-- "                    Merge Cond: (m.pizzeria_id = pz.id)"
-- "                    ->  Index Only Scan using idx_menu_unique on menu m  (cost=0.14..12.42 rows=19 width=40) (actual time=0.035..0.038 rows=19 loops=1)"
-- "                          Heap Fetches: 19"
-- "                    ->  Index Scan using pizzeria_pkey on pizzeria pz  (cost=0.13..12.22 rows=6 width=40) (actual time=0.003..0.004 rows=6 loops=1)"
-- "Planning Time: 0.868 ms"
-- "Execution Time: 0.106 ms"

-- "Sort  (cost=25.95..26.00 rows=19 width=96) (actual time=0.049..0.050 rows=19 loops=1)"
-- "  Sort Key: m.pizza_name, (max(pz.rating) OVER (?))"
-- "  Sort Method: quicksort  Memory: 25kB"
-- "  ->  WindowAgg  (cost=2.93..25.54 rows=19 width=96) (actual time=0.017..0.030 rows=19 loops=1)"
-- "        ->  Nested Loop  (cost=0.27..25.21 rows=19 width=64) (actual time=0.009..0.018 rows=19 loops=1)"
-- "              ->  Index Scan using idx_1 on pizzeria pz  (cost=0.13..12.22 rows=6 width=40) (actual time=0.003..0.003 rows=6 loops=1)"
-- "              ->  Index Only Scan using idx_menu_unique on menu m  (cost=0.14..2.15 rows=1 width=40) (actual time=0.001..0.002 rows=3 loops=6)"
-- "                    Index Cond: (pizzeria_id = pz.id)"
-- "                    Heap Fetches: 19"
-- "Planning Time: 0.880 ms"
-- "Execution Time: 0.069 ms"
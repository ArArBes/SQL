CREATE OR REPLACE FUNCTION func_minimum(arr anyarray)
RETURNS numeric AS $$
BEGIN
    RETURN (SELECT MIN(elem) FROM unnest(arr));
END;
$$ LANGUAGE plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);

COMMENT ON TABLE person_discounts  IS 'Таблица скидок пользователей относительно реализованных заказов';
COMMENT ON COLUMN person_discounts.id IS 'Уникальный идентификатор для каждой записи';
COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор человека, совершившего заказ';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор пиццерии, в которой был совершен заказ';
COMMENT ON COLUMN person_discounts.discount IS 'Размер скидки в процентах относительно количества заказов в каждой пиццерии';

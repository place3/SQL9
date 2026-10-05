SELECT
    pizzeria.name,
    COALESCE(visits.count_of_visits, 0) + COALESCE(orders.count_of_orders, 0) AS total_count
FROM pizzeria
LEFT JOIN (
    SELECT pizzeria_id, COUNT(*) AS count_of_visits
    FROM person_visits
    GROUP BY pizzeria_id
) AS visits ON pizzeria.id = visits.pizzeria_id
LEFT JOIN (
    SELECT menu.pizzeria_id, COUNT(*) AS count_of_orders
    FROM person_order
    JOIN menu ON person_order.menu_id = menu.id
    GROUP BY menu.pizzeria_id
) AS orders ON pizzeria.id = orders.pizzeria_id
ORDER BY total_count DESC, pizzeria.name ASC;

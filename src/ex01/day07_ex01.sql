SELECT name, count_of_visits
FROM (
    SELECT
        person.name,
        COUNT(*) AS count_of_visits
    FROM person_visits
    JOIN person ON person_visits.person_id = person.id
    GROUP BY person.name
    ORDER BY count_of_visits DESC
    LIMIT 4
) AS top_visitors
ORDER BY count_of_visits DESC, name ASC;

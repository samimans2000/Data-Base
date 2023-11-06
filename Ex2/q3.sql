SELECT DISTINCT name, number
FROM members NATURAL JOIN memberInKnesset NATURAL JOIN knessets
WHERE party IN ('Likud', 'Meretz') AND startYear-birthYear>70
ORDER BY name, number;

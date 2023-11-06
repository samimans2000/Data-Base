SELECT number, AVG(startYear-birthYear) AS avgAge
FROM members
NATURAL JOIN (SELECT DISTINCT number, uid
              FROM memberInKnesset) T
NATURAL JOIN knessets
GROUP BY number
ORDER BY number;

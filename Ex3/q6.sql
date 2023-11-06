WITH RECURSIVE T(uid, name, distance) AS(
SELECT DISTINCT uid, name, 0
FROM members
WHERE name='Menachem Begin'

UNION

SELECT M1.uid, M1.name, distance+1
FROM (members M1 NATURAL JOIN memberInKnesset I1),
    (members M2 NATURAL JOIN memberInKnesset I2 NATURAL JOIN T)
WHERE I1.number=I2.number AND I1.party=I2.party AND T.distance<3
)

SELECT DISTINCT name
FROM(
SELECT uid, name FROM members
EXCEPT
SELECT uid, name FROM T) R
ORDER BY name;

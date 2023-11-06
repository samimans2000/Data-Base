-- Solution 1:
SELECT DISTINCT number, name
FROM (
SELECT *
FROM members NATURAL JOIN memberInKnesset

EXCEPT

SELECT T1.*
FROM (members NATURAL JOIN memberInKnesset) T1, (members NATURAL JOIN memberInKnesset) T2
WHERE T1.number=T2.number AND T1.birthYear>T2.birthYear) R
ORDER BY number, name;

-- Solution 2:
SELECT DISTINCT number, name
FROM members M1 NATURAL JOIN memberInKnesset MK1
WHERE M1.birthYear <= ALL (SELECT M2.birthYear
						   FROM members M2 NATURAL JOIN memberInKnesset MK2
						   WHERE MK1.number=MK2.number)
ORDER BY number, name;

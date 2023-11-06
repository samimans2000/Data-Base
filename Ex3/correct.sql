SELECT T.n1, T.n2
FROM (
SELECT d1.name AS n1 ,d2.name AS n2, COUNT(DISTINCT d1.cause)
FROM donors d1, donors d2
WHERE d1.name < d2.name AND d1.cause = d2.cause
GROUP BY n1, n2

INTERSECT

SELECT d1.name AS n1 ,d2.name AS n2, COUNT(DISTINCT d1.cause)
FROM donors d1, donors d2
WHERE d1.name < d2.name
GROUP BY n1, n2
HAVING COUNT(DISTINCT d1.cause) = COUNT(DISTINCT d2.cause)) T
ORDER BY T.n1, T.n2;

SELECT DISTINCT name

FROM (
SELECT DISTINCT uid, name
FROM members NATURAL JOIN memberInKnesset
WHERE gender='female' AND occupation!='politician' AND number=23

INTERSECT

SELECT uid, name
FROM members NATURAL JOIN memberInKnesset
WHERE gender='female' AND occupation!='politician' AND number=24) T

ORDER BY name;

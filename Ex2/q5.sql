SELECT DISTINCT name

FROM (
SELECT uid, name
FROM members
WHERE birthPlace='Jerusalem'

EXCEPT

SELECT uid, name
FROM members NATURAL JOIN (SELECT I1.uid
                           FROM memberInknesset I1, memberInknesset I2
                           WHERE I1.number!=I2.number AND I1.uid=I2.uid) M
) R

ORDER BY name;

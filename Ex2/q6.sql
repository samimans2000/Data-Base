SELECT DISTINCT name
FROM members M
WHERE NOT EXISTS (SELECT DISTINCT number
                  FROM members NATURAL JOIN memberInknesset
                  WHERE name='David Ben-Gurion' AND party='Mapai'

                  EXCEPT

                  SELECT number
                  FROM memberInknesset
                  WHERE uid=M.uid AND party='Mapai')
ORDER BY name;

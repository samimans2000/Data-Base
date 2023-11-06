SELECT year, eng_name
FROM enrollment
WHERE (year, students5_estimated) IN (SELECT year, MAX(students5_estimated)
                                      FROM enrollment
                                      GROUP BY year)
ORDER BY year, eng_name;

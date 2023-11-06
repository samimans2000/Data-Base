SELECT DISTINCT B1.Name, B1.Author, B1.Year
FROM bestsellers B1, bestsellers B2
WHERE B1.Name=B2.Name AND (B1.Author!=B2.Author OR
                           B1.Genre!=B2.Genre OR
                           B1.User_Rating!=B2.User_Rating OR
                           B1.Reviews!=B2.Reviews OR
                           B1.Price!=B2.Price)
ORDER BY B1.Name, B1.Year;

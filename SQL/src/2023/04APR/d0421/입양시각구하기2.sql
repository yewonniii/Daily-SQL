WITH RECURSIVE H AS(
    SELECT 0 AS HOUR
    UNION ALL
SELECT HOUR +1 FROM H
WHERE HOUR < 23)

SELECT H.HOUR AS HOUR
        ,CASE WHEN RH.COUNT IS NULL THEN 0
        ELSE RH.COUNT END AS COUNT FROM H
LEFT JOIN (SELECT HOUR(DATETIME) AS HOUR
    ,COUNT (ANIMAL_ID) AS COUNT
FROM ANIMAL_OUTS
GROUP BY HOUR(DATETIME)
ORDER BY HOUR(DATETIME)) RH
ON H.HOUR = RH.HOUR
ORDER BY H.HOUR 
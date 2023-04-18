SELECT I.REST_ID, I.REST_NAME, I.FOOD_TYPE, I.FAVORITES, I.ADDRESS, ROUND(AVG(R.REVIEW_SCORE),2) AS SCORE
FROM REST_INFO I JOIN REST_REVIEW R
WHERE I.REST_ID = R.REST_ID
AND I.ADDRESS like '서울%'
GROUP BY I.REST_ID
ORDER BY ROUND(AVG(R.REVIEW_SCORE),2) DESC, I.FAVORITES DESC

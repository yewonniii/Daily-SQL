SELECT A.AUTHOR_ID, A.AUTHOR_NAME, B.CATEGORY, SUM(S.SALES*B.PRICE) AS TOTAL_SALES
FROM BOOK B JOIN AUTHOR A JOIN BOOK_SALES S
ON B.AUTHOR_ID = A.AUTHOR_ID AND B.BOOK_ID = S.BOOK_ID
WHERE YEAR(S.SALES_DATE)='2022' AND MONTH(S.SALES_DATE)='01'
GROUP BY A.AUTHOR_ID, B.CATEGORY
ORDER BY A.AUTHOR_ID, B.CATEGORY DESC
--- 626. Exchange seats
SELECT 
(CASE WHEN MOD(id,2)!=0 AND counts !=id then id+1
      WHEN MOD(id,2)!=0 AND counts  = id THEN id
      ELSE id-1 end) as id, student
FROM seat,
(SELECT COUNT(*) AS COUNTS
FROM SEAT) AS SEAT_COUNTS
ORDER BY id ASC;

------------------------------------ 196. Delete Duplicate Emails ------------------------
DELETE p1 
FROM Person p1
JOIN Person p2
ON p1.email=p2.email
AND p1.Id >p2.Id;


------------------------------------ 197 Rising Temperature -------------------------------
SELECT w1.Id
FROM Weather w1, Weather w2
WHERE DATEDIFF(w1.RecordDate,w2.Recorddate)=1 AND w1.Temperature>w2.Temperature; 
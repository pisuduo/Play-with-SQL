SELECT DISTINCT(l1.Num) as ConsecutiveNums
FROM Logs l1
JOIN Logs l2
ON l1.Num=l2.Num AND l1.id=l2.id-1
JOIN Logs l3
ON l3.Num=l2.Num AND l2.id=l3.id-1;
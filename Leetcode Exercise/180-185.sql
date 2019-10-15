-------------------------  180 Consecutive Numbers ----------------------------
SELECT DISTINCT(l1.Num) as ConsecutiveNums
FROM Logs l1
JOIN Logs l2
ON l1.Num=l2.Num AND l1.id=l2.id-1
JOIN Logs l3
ON l3.Num=l2.Num AND l2.id=l3.id-1;

-------------------------- 181 Employees Earning More Than Their Managers ------
SELECT E.name as Employee
FROM Employee E
JOIN Employee M
ON E.ManagerId=M.Id AND E.Salary>M.Salary;

-------------------------- 182 Duplicate Emails -------------------------------
--Sol1: USING Self Join
SELECT DISTINCT(P1.Email)
FROM person p1
JOIN person p2
ON p1.Email=p2.Email AND p1.Id!=p2.Id;
--Sol2: Using Group By
SELECT Email
FROM person
GROUP BY Email
HAVING Count(*)>1;

------------------------- 183 Customers Who Never Order ------------------------
--Sol1: Using NOT IN
SELECT Name AS Customers
FROM Customers C
WHERE C.Id NOT IN (SELECT CustomerId 
                   FROM Orders)

--Sol2: Using LEFT JOIN
SELECT C.Name as Customers
FROM Customers C
LEFT JOIN Orders O
ON C.Id=O.CustomerId 
WHERE O.CustomerId IS NULL;

------------------------ 184 Department Highest Salary -------------------------
SELECT D.Name as Department, E.Name as Employee, E.Salary
FROM Employee E
JOIN Department D
ON E.DepartmentId=D.Id
WHERE E.Salary >= ALL(SELECT Salary   -- use euqal sign because there may be people having the same salary
                   FROM Employee E2
                   WHERE E.DepartmentId=E2.DepartmentId
                    AND E.name <> E2.name);

----------------------- 185 Department Top Three Salaries ----------------------
SELECT d.Name as Department, e1.Name as Employee, e1.Salary
FROM Employee e1
JOIN Department d
ON e1.DepartmentId=d.Id
WHERE 3> (SELECT COUNT(DISTINCT( e2.Salary)) --there is no more than 3 salary bigger than itself in the company
         FROM Employee e2
         WHERE e2.Salary>e1.Salary
         AND e2.DepartmentId=e1.DepartmentId);


--- 10 ---

SELECT name, continent
FROM world as w
WHERE population/3 >  ALL (SELECT population
                           FROM world as x
                           WHERE x.continent=w.continent
                           AND x.name <>w.name);
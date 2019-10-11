---8.The example query shows all goals scored in the Germany-Greece quarterfinal.
---Instead show the name of all players who scored a goal against Germany.
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' OR team2='GER') AND (teamid!='GER');


---12
SELECT matchid,mdate,Count(*)
FROM game x JOIN goal y ON x.id=y.matchid
WHERE teamid='GER'
GROUP BY matchid,mdate;

---13
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM (CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game LEFT JOIN goal ON matchid = id
  GROUP BY mdate,matchid,team1, team2;

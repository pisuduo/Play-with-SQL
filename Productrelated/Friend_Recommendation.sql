---Write an SQL query that makes recommendations using the  pages that your friends liked. 
---Assume you have two tables: a two-column table of users and their friends, 
---and a two-column table of users and the pages they liked. It should not recommend pages you already like
CREATE table likes
(
    userid int not null,
    pageid int not null
);

CREATE table friends
(
    userid int not null,
    friendid int not null
);

insert into likes VALUES
(1, 101), (1, 201),(1,301),
(2, 201), (2, 301),
(3,101),(3,401);

insert into friends VALUES 
(1, 2),(2,3),(2,1),(3,2);

select * from likes;

select * from friends;
------------------ solution ---------------------------------------
select distinct x.userid as users,y.pageid as recom
from friends x
join likes y            -- join with likes, to see friend's likes.
on x.friendid=y.userid
left join likes z       -- join with likes, to see userid and corresponding likes.
on x.userid=z.userid and y.pageid=z.pageid
where z.pageid IS NULL; -- that selects the pages which are not in your likes, but in your friends' likes.

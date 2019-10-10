---SQL practice: 
------------------- SELECT -----------------------#

--- EX1
Select customerid,
item,
price
From items_ordered
where customerid=10449;

--- EX2
Select *
From items_ordered
where item='Tent';

--- EX3
Select customerid,
order_date,
item
From items_ordered
where item like 'S%';

--- EX4
Select Distinct item
From items_ordered;

------------- Aggregate functions-----------------#
SELECT MAX(price)
FROM items_ordered;

SELECT AVG(price)
FROM items_ordered
WHERE order_date LIKE '%Dec%';

SELECT COUNT(*)
FROM items_ordered;

SELECT MIN(price)
FROM items_ordered
WHERE item='Tent';

--------------------- GROUP BY--------------------#

SELECT count(*), state
FROM customers
GROUP BY state;

SELECT item, max(price),min(price)
FROM items_ordered
GROUP BY item;

SELECT count(*), customerid,sum(price)
FROM items_ordered
GROUP BY customerid;


--------------------- HAVING----------------------#
SELECT count(*), state
FROM customers
GROUP BY state
HAVING count(*)>1;

SELECT item, max(price),min(price)
FROM items_ordered
GROUP BY item
HAVING max(price)>190.00;

SELECT count(*), customerid,sum(price)
FROM items_ordered
GROUP BY customerid
HAVING count(*)>1;

-------------------- ORDER BY----------------------#
SELECT lastname,firstname,city
FROM customers
ORDER BY lastname;

SELECT item,price
FROM items_ordered
WHERE price>10.00
ORDER BY price;

------------------ Boolean Operators---------------#
SELECT customerid, order_date, item
FROM items_ordered
WHERE (item <>'Snow Shoes') AND (item <>'Ear Muffs');

SELECT item, price
FROM items_ordered
WHERE (item LIKE 'S%') OR (item LIKE 'P%') OR (item LIKE 'F%');

------------------ IN & BETWEEN ------------------#

SELECT order_date, item, price
FROM items_ordered
WHERE price BETWEEN 10.00 AND 80.00;

SELECT firstname, city, state 
FROM customers
WHERE state IN ('Arizona','Washington','Oklahoma','Colorado','Hawaii');

------------------Math Functions -----------------#
SELECT item, sum(price)/sum(quantity)
FROM items_ordered
GROUP BY item;


----------------- JOIN ----------------------------#
SELECT A.customerid,B.firstname,B.lastname,A.order_date, A.item, A.price
FROM items_ordered AS A JOIN customers AS B
ON A.customerid=B.customerid;

SELECT B.state,A.customerid,B.firstname,B.lastname,A.order_date, A.item, A.price
FROM items_ordered AS A JOIN customers AS B
ON A.customerid=B.customerid
ORDER BY B.state DESC;





---Print every department where the average salary per employee is greater than $500!
CREATE table employees
(
    department varchar(15) not null,
    employeeid int not null,
    employeename varchar(15) not null
);

CREATE table salaries
(
    salary int not null,
    employeeid int not null,
    employeename varchar(15) not null
);

insert into employees VALUES
('sales', 123, 'John Doe'), 
('sales', 211, 'Jane Smith'),
('hr', 556, 'Billy'),
('sales', 711, 'Robert'),
('market', 133, 'Ann'),
('market', 113, 'Ely');

insert into salaries VALUES 
(500, 123, 'John Doe'),
(600, 211, 'Jane Smith'),
(1000, 556, 'Billy'),
(400, 711, 'Robert'),
(1200, 133, 'Ann'),
(200, 113, 'Ely');

select * from employees;

select * from salaries;

------------------------------------- solution ------------------------------------
select e.department,AVG(s.salary) as avarage_slary
from employees e
JOIN salaries s
on e.employeeid=s.employeeid
group by e.department
having avg(s.salary)>500;
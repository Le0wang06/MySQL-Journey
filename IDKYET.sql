-- where cause 

select *
from employee_salary
where salary >= 50000
;

select *
from employee_demographics
where birth_date > '1985-01-01'
or  not gender = 'male'
;

select *
from employee_demographics
where (first_name = 'Leslie' AND age = 44) OR age > 55
;

-- LIke Statement
-- % for name it is whatever is behind like Jerry you can do J% or anything that finishes it off
-- with __ it is specifying how many character is has after the letter like Andy you would do A___ with 3 _

select *
from employee_demographics
where first_name like 'A___%'
;

-- Group by 
-- grouping something will also allow you to calculate the avg of ages b shown below 

select gender , avg(age) , max(age) , min(age) , count(age) 
from employee_demographics
group by gender
;


select occupation , salary
from employee_salary
group by occupation , salary
;

-- order by 
select *
from employee_demographics
order by  gender, age desc , first_name desc; -- A to Z with characters defeault is ascending order 


select first_name,
substring(first_name,1,3)
from employee_demographics;

select first_name, replace(first_name, 'a','z')
from employee_demographics;

select first_name, locate('An', first_name)
from employee_demographics;

select first_name, last_name,
concat(first_name,' ' ,last_name)
from employee_demographics;

select first_name, last_name, age,
case
	when age <= 30 then 'Young'
    when age between 30 and 100 then 'old'
end as age_Bracket
from employee_demographics
;

-- Pay increase and bonus 
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10 % bonus

select first_name, last_name, salary,
case
	when salary < 50000 then salary + (salary * 0.05) 
    when salary > 50000 then salary + (salary * 0.07)
end as Raise,

case 
    when dept_id = 6 then salary * 0.1
end as Bonus

from employee_salary 
;


select * 
from parks_departments;


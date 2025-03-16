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



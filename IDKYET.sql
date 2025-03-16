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


-- having vs where

select gender, avg(age)
from employee_demographics
group by gender 
having avg(age) > 40
;

select *
from employee_salary;


select occupation , salary
from employee_salary
where occupation like '%manager%'
group by occupation, salary
having avg(salary) > 20000
;


-- limit & Aliasing

select * 
from employee_demographics
order by age desc -- take the youngest  or using desc will take the oldest 
limit 2, 1 -- only take the top 3  1 means take the one after 
;


-- Aliasing 

select gender , avg(age) as avg_age -- giving this a name
from employee_demographics
group by gender
having avg(age) > 40; -- having the name greater than 40 will return if the age is more than 40

-- joins 

select *
from employee_demographics;

select *
from employee_salary;

select dem.employee_id , age , occupation
from employee_demographics as dem
inner join  employee_salary as sal
	on dem.employee_id = sal.employee_id
;


-- outer joins 


select  *
from employee_demographics as dem
right outer join  employee_salary as sal
	on dem.employee_id = sal.employee_id
;

-- self join

select emp1.employee_id as emp_santa,
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
emp2.employee_id as emp,
emp2.first_name as first_name_emp,
emp2.last_name as last_name_emp
from employee_salary emp1
join employee_salary emp2
	on emp1.employee_id + 1= emp2.employee_id
;



-- joining mutiple tables together


select *
from employee_demographics as dem
inner join  employee_salary as sal
	on dem.employee_id = sal.employee_id
inner join parks_departments pd
	on sal.dept_id = pd.department_id
;

select * 
from parks_departments;


-- unions 

select first_name, last_name
from employee_demographics
union distinct
select first_name, last_name
from employee_salary
;


select first_name, last_name, 'Old Man' as label -- making a new row label naming it label and giving it the Old as the value
from employee_demographics
where age > 40 and gender = 'male'
union
select first_name, last_name,'Olde Lady' as label -- making a new row label naming it label and giving it the Old as the value
from employee_demographics
where age > 40 and gender = 'Female'
union
select first_name , last_name,'Highly Paid Employe' as label
from employee_salary
where salary > 70000
order by first_name, last_name
;


-- string functions
select length('sky\fall');


select * 
from employee_demographics;

select first_name , length(first_name)
from employee_demographics
order by 2;


select upper('sky');
select lower('SKY');


select first_name, upper(first_name)
from employee_demographics
;

select trim('                     sky                        ') as triming;  -- Rtrim gets rid of the right spaces Ltrim gets rid of the left spaces




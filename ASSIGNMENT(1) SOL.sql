-- Q1 Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name"
select first_name  as 'First Name' ,last_name  as 'Last Name' from  hr.employees;

-- Q2 Write a query to get unique department ID from employee table
Select DISTINCT department_id from hr.employees;

-- Q3 Write a query to get all employee details from the employee table order by first name, descending
select * from hr.employees order by first_name DESC;

-- Q4 Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary)
select first_name, last_name ,salary, (0.15*salary) as PF from hr.employees;

-- Q5. Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary
SELECT employee_id ,first_name ,last_name, salary from hr.employees order by salary ;

-- Q6 Write a query to get the total salaries payable to employees
select sum(salary) as 'Total Salary' from hr.employees; 

-- Q7 Write a query to get the maximum and minimum salary from employees table
Select max(salary) as "max_salary", min(salary) as 'min_salary' from hr.employees;

-- Q8 Write a query to get the average salary and number of employees in the employees table
SELECT avg(salary) as average_salary , count(employee_id) as 'Total employee' from hr.employees;  

-- Q9 Write a query to get the number of employees working with the company
select count(employee_id) as "employee Working " from hr.employees;

-- Q10 . Write a query to get the number of jobs available in the employees table
select count(job_id) as "Total jobs " from hr.jobs;

-- Q11 Write a query get all first name from employees table in upper case
select upper(first_name) from hr.employees;

-- Q12 Write a query to get the first 3 characters of first name from employees table
select left(first_name,3) as"FIRST_THREE" from hr.employees;

-- Q13 Write a query to get first name from employees table after removing white spaces from both side

select Trim(first_name) as "rm_whitespace" from hr.employees;

-- Q14 Write a query to get the length of the employee names (first_name, last_name) from employees table
select  first_name, last_name,(char_length(first_name) + char_length(last_name)) as length_of_string  from hr.employees;

-- Q15  Write a query to check if the first_name fields of the employees table contains numbers
select first_name from hr.employees where first_name regexp '[0-9]';

-- Q16 . Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000
select first_name, last_name, salary from hr.employees where salary>10000 and salary<15000 ;


-- Q17 Write a query to display the name (first_name, last_name) and department ID of all employees in 
-- departments 30 or 100 in ascending order
select first_name,last_name ,department_id  from hr.employees where department_id=30 or department_id=100 order by department_id ;

-- Q18 Write a query to display the name (first_name, last_name) and salary for all employees whose salary is 
-- not in the range $10,000 through $15,000 and are in department 30 or 100

select first_name ,last_name,salary,department_id  from hr.employees where (salary>15000 or salary<10000 )and ( department_id=30 or department_id=100);

-- Q19 19. Write a query to display the name (first_name, last_name) and hire date for all employees who were 
-- hired in 1987 
select employees.first_name, employees.last_name,year(job_history.start_date) as job_year from hr.employees inner join hr.job_history on employees.employee_id =job_history.employee_id where year(job_history.start_date)>1987;

-- Q20 Write a query to display the first_name of all employees who have both "b" and "c" in their first name
select first_name from hr.employees where  first_name like '%b%' and  first_name like  '%c%' ;

-- Q21 Write a query to display the last name, job, and salary for all employees whose job is that of a 
-- Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000
select employees.last_name  , jobs.job_title as job , employees.salary  from  hr.employees inner join hr.jobs on employees.job_id=jobs.job_id where
 (jobs.job_title='Programmer' or jobs.job_title='Shipping Clerk' ) and not ( salary= 4500 or salary= 10000 or salary =15000 ) ;  


-- Q22 Write a query to display the last name of employees whose names have exactly 6 characters
Use hr;
select last_name from employees where length(concat(first_name,last_name))=6;

-- Q 23 Write a query to display the last name of employees having 'e' as the third character
select last_name from employees where substring(last_name , 3)='e';
  set SQL_SAFE_UPDATES=0;
-- Q24  Write a query to get the job_id and related employee's id
select Distinct job_id, group_concat(  employee_id ) as employee_id from hr.employees group by job_id ;




-- Q25. Write a query to update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'
update hr.employees set phone_number=replace(phone_number,"124",'999') ;

select phone_number from hr.employees;


-- Q26. Write a query to get the details of the employees where the length of the first name greater than or equal to 8
select * from hr.employees where length(first_name)>8;

-- Q27 Write a query to append '@example.com' to email field
select concat(email,'@example.com') from hr.employees;

-- Q28. Write a query to extract the last 4 character of phone numbers
select  substring(phone_number,-4) from hr.employees;

-- Q29 29. Write a query to get the last word of the street address
use hr ;
select substring_index(street_address,' ',-1)  as last from locations;

-- Q30 30. Write a query to get the locations that have minimum street length
select * from hr.locations where length(street_address)=(select min(length(street_address)) from hr.locations);


-- Q31 Write a query to display the first word from those job titles which contains more than one words
select substring_index(job_title,' ',1) as first_word from hr.jobs where length(substring_index(job_title,' ',1))>1;

-- Q32 . Write a query to display the length of first name for employees where last name contain character 'c' after 2nd position
select first_name,length(first_name) as len,last_name  from hr.employees where  substring(last_name,3) like '%c%';

-- Q33 . Write a query that displays the first name and the length of the first name for all employees whose 
-- name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the 
-- employees' first names
select first_name from hr.employees where first_name like 'A%' or  first_name like 'J%' or first_name like 'M%' order by first_name;

-- Q34 Write a query to display the first name and salary for all employees. Format the salary to be 10 
-- characters long, left-padded with the $ symbol. Label the column SALARY 
use hr;
alter table employees modify salary varchar(10);
select first_name ,concat('$',salary) as SALARY from employees; 

-- Q35 Write a query to display the first eight characters of the employees' first names and indicates the 
-- amounts of their salaries with '$' sign. Each '$' sign signifies a thousand dollars. Sort the data in 
-- descending order of salary

select concat(substring_index(first_name,1,8),' ',concat(salary/1000,'$')) as first_name  from hr.employees order by salary DESC;

-- Q36 Write a query to display the employees with their code, first name, last name and hire date who hired 
-- either on seventh day of any month or seventh month in any year
select employee_id , first_name, last_name ,hire_date from hr.employees where month(hire_date)=7 or day(hire_date)=7;
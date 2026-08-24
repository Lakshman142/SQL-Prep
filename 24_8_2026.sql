/* 
https://platform.stratascratch.com/coding/10299-finding-updated-records?code_type=3

We have a table with employees and their salaries; however, some of the records are old and contain outdated salary information. Since there is no timestamp, assume salary is non-decreasing over time. You can consider the current salary for an employee is the largest salary value among their records. If multiple records share the same maximum salary, return any one of them. Output their id, first name, last name, department ID, and current salary. Order your list by employee ID in ascending order.
*/

select id, first_name, last_name, department_id, salary from ms_employee_salary m where salary = (select max(salary) from ms_employee_salary where id = m.id) order by id;

/*
- AGG function can not be used in where clause.
- We could not use group by id as we also need department_id and for one employee there might be multiple department_ids attached. It drops that employee_id as there is ambiguity on which department_id to take.
*/

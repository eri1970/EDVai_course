SELECT column_name
FROM information_schema.columns
WHERE table_name = 'employees'

select *
	from employees e 
	
	
select first_name
	from employees e 
	where title <> 'Manager'
	union all 
	select first_name 
	from employees e2 
	where title = 'Manager';
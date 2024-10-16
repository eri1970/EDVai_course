SELECT column_name
FROM information_schema.columns
WHERE table_name = 'region';

select  *
	from region r 
	
insert into region (region_id, region_description)
values ('5', 'ARG-CABA')
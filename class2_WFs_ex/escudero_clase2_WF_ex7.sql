--Ex-7 Asignar numeros de fila para cada cliente, ordenados por customer_id

select 
	c.customer_id,
	c.company_name,
	c.contact_name,
	c.contact_title,
	c.address,
	row_number() over (order by c.customer_id) as rownumber
	from customers c 
	


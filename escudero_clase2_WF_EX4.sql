-- Ex 4 Selecciona el ID del cliente, la fecha de la orden y la fecha más antigua de la orden para cada cliente de la tabla 'Orders'.

select 
	c.customer_id,
	o.order_date,
	min(o.order_date) over (partition by c.customer_id) AS earliestorderdate
from
orders o 
inner join
customers c 
on o.customer_id = c.customer_id
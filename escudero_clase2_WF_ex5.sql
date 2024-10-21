-- EX_5 Seleccione el id de producto, el nombre de producto, el precio unitario, el id de categoría y el precio unitario máximo para cada categoría de la tabla Products.

select 
	p.product_id,
	p.product_name,
	p.unit_price,
	c.category_id, 
	max(p.unit_price) over (partition by p.category_id) AS maxunitprice
from
products p 
inner join
categories c 
on p.category_id = c.category_id 
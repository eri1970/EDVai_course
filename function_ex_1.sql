select o.customer_id, od.unit_price,
avg(od.unit_price) over (partition by o.customer_id) -- se pueden usar distintas funciones SUM, MAx; MIN etc  
from orders o  inner join order_details od 
on o.order_id = od.order_id 

-- WF RANK() rankea por ejemplo por el unit_price, genero una nueva columna con este resultado

select o.customer_id, od.unit_price,
rank() over (partition by o.customer_id order by od.unit_price)
from orders o inner join order_details od 
on o.order_id = od.order_id 

-- row_number numera cada uno de los resiltado sd e la consulta, hace como un itemizado

select o.customer_id, od.unit_price,
row_number () over (partition by o.customer_id order by od.unit_price desc)
from orders o inner join order_details od 
on o.order_id = od.order_id 

-- filtrado de resultados de la WF
SELECT customer_id, unit_price
FROM (
  SELECT o.customer_id, od.unit_price,
    ROW_NUMBER() OVER (PARTITION BY o.customer_id ORDER BY od.unit_price DESC) AS rn
  FROM orders o 
  INNER JOIN order_details od ON o.order_id = od.order_id
) subquery
WHERE rn = 1;  -- Filtra para obtener solo el artículo más caro de cada cliente

-- WF LEAD() NOS VA MOSTRANDO EL VALOR SIGUINETE y lag el  ANTERIOR, POR EJEMPLO PARA VER EL MONTO D EFACTURAS

select o.customer_id, od.unit_price,
lead (od.unit_price) over (partition by o.customer_id order by od.unit_price)
from orders o inner join order_details od 
on o.order_id = od.order_id 

select o.customer_id, od.unit_price,
lag (od.unit_price) over (partition by o.customer_id order by od.unit_price)
from orders o inner join order_details od 
on o.order_id = od.order_id 

-- filtrado lo siguiente NO FUNCIONA debemos hacer como hice más arriba
SELECT  i.CustomerId ,
SUM(il.unitprice) OVER (PARTITION BY i.customerid 
                        ORDER BY il.UnitPrice
                        FILTER (WHERE il.UnitPrice > 50))
from Invoice i INNER JOIN InvoiceLine il 
ON i.InvoiceId = il.InvoiceId

SELECT 
    i.CustomerId,
    SUM(il.UnitPrice) OVER (PARTITION BY i.CustomerId) AS TotalUnitPrice
FROM 
    Invoice i 
INNER JOIN 
    InvoiceLine il ON i.InvoiceId = il.InvoiceId
WHERE 
    il.UnitPrice > 50;


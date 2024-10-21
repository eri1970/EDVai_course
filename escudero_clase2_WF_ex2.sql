-- Ex_2 obtener el promedio de ventas de cada cliente
	
SELECT 
    c.customer_id,
    --c.company_name,
    s.order_id,
    s.employee_id,
    s.order_date,
    s.required_date,
    s.shipped_date,
    AVG(s.total_sale) OVER (PARTITION BY c.customer_id) AS avgorderamount
FROM 
    (
        SELECT 
            o.order_id,
            o.customer_id,
            o.employee_id,
            o.order_date,
            o.required_date,
            o.shipped_date,
            SUM(od.unit_price * od.quantity) AS total_sale
        FROM 
            orders o 
        INNER JOIN 
            order_details od ON o.order_id = od.order_id
        GROUP BY 
            o.customer_id, o.order_id, o.employee_id, o.order_date, o.required_date, o.shipped_date
    ) AS s
INNER JOIN 
    customers c ON s.customer_id = c.customer_id;

   
   


	

	
	
	
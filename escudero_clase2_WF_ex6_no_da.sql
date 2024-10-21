-- Ex_6 Obtener el ranking de los productos más vendidos

SELECT 
    p.product_name,
    p.quantity_per_unit,
    p.unit_price,
    SUM(od.quantity) AS quantity, -- Sumamos las cantidades vendidas
    RANK() OVER (PARTITION BY p.product_name ORDER BY SUM(od.quantity) ASC) AS rank_quantity -- Rankeamos basado en las cantidades vendidas
FROM 
    products p 
INNER JOIN 
    order_details od ON p.product_id = od.product_id -- Unimos las tablas products y order_details
INNER JOIN 
    categories c ON p.category_id = c.category_id -- Unimos con la tabla categories
GROUP BY 
    p.product_id, p.product_name, p.quantity_per_unit, p.unit_price
ORDER BY 
    p.product_name; --rank_quantity;


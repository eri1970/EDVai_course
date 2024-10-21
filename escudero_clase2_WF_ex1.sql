SELECT 
    c.category_name,
    p.product_name, 
    p.unit_price, 
    AVG(p.unit_price) OVER (PARTITION BY p.category_id) AS avg_price
FROM 
    products p 
INNER JOIN 
    categories c 
ON 
    p.category_id = c.category_id;


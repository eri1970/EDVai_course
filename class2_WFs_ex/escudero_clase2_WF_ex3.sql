-- Ex_3 obtener el el promedio de cantidad de productos vendidos por categoría

-- seleccionamos las columnas
SELECT 
    p.product_name,
    c.category_name,
    p.quantity_per_unit,
    p.unit_price,
    SUM(od.quantity) AS quantity, --sumamos las cantidades vendidas
    AVG(SUM(od.quantity)) OVER (PARTITION BY c.category_name) AS avgquantity --sacamos el promedio de las cantidades vendidas
FROM 
    products p 
INNER JOIN 
    order_details od ON p.product_id = od.product_id  -- hacemos el inner join de las tres tablas order_detail/products/categories
INNER JOIN 
    categories c ON p.category_id = c.category_id
GROUP BY 
    c.category_name, p.product_name, p.quantity_per_unit, p.unit_price
ORDER BY 
    c.category_name, p.product_name; -- ordenamos por category_name y product_name



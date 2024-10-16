SELECT order_details.order_id, products.product_name, order_details.discount
	FROM order_details  
	INNER JOIN products 
	ON order_details.product_id = products.product_id;
	

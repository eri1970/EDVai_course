SELECT customers.company_name, customers.contact_name, orders.order_date
	FROM customers
	INNER JOIN orders
	ON customers.customer_id = orders.customer_id;

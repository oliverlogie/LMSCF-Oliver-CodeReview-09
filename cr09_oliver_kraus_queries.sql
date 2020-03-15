1)

select all rows in Database Post Office

SELECT SUM(TABLE_ROWS) 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_SCHEMA = 'post_office';
    SELECT table_name, table_rows
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'post_office';

2)

search for specific person

SELECT COUNT(employees.employees_id)
	FROM employees
    WHERE employees.employees_name = 'Nina Reis';

3)

shows all packages that arrived after declared date

SELECT COUNT(processing_system.receive_date)
	FROM processing_system
	WHERE processing_system.receive_date >= "2020-03-01";

4)

shows packages with more than 200g

SELECT package.pkg_weight, package.pkg_size
FROM package
WHERE package.pkg_weight > 200;

5)

SELECT processing_system.process_id
	FROM processing_system
	INNER JOIN package
	ON processing_system.process_id = package.fk_process_id
	WHERE package.pkg_weight > 100;


6)

shows name and street of customer

SELECT customer_adress.customer_street, customer.customer_name
	FROM customer_adress
	INNER JOIN customer
	ON customer_adress.customer_adress_id = customer.fk_customer_adress_id
	WHERE customer_adress.customer_street = 'Tokiostraße';








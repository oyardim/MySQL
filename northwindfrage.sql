-- 1)Suchen Sie alle Mitarbeiter welche Mitarbeiter hat privilegien. Geben Sie alle informationen 
SELECT
     e.*,
     prv.*
FROM
    northwind.privileges prv
    INNER JOIN northwind.employee_privileges ep  ON prv.id = ep.privilege_id
    INNER JOIN northwind.employees e  ON e.id = ep.employee_id
;


-- 2) Wie viele Produkte habe ich von welchem ​​Lieferanten verkauft? (Verkaufsinformationen werden der Bestelldetailstabelle entnommen) (Basierend auf Umsatz und Menge)
SELECT
    sup.company,
    prd.product_name,
    SUM(od.quantity)  AS 'Menge',
    SUM(od.quantity*od.unit_price) AS 'Umsatz'
FROM
   suppliers sup
   INNER JOIN products prd ON sup.id = prd.supplier_ids
   INNER JOIN order_details od ON prd.id = od.product_id
GROUP BY sup.company, prd.product_name
ORDER BY 3 DESC
 ;  
 
 
-- 3)Welcher ist mein wertvollster Kunde? (der Kunde, mit dem ich die meisten Verkäufe mache) (basierend auf Umsatz und Menge)
SELECT
	c.company,
	SUM(od.quantity) AS 'Menge',
	SUM(od.quantity*od.unit_price) AS 'Umsatz' 
FROM 
    customers c
    INNER JOIN orders o ON c.id = o.customer_id
    INNER JOIN order_details od ON o.id = od.order_id
GROUP BY c.company
ORDER BY 3 DESC 
; 


-- 4)Geben Sie die Liste der Kunden an,die im Januar bestellet haben(customers name, employess name, order date,ship address) 
SELECT
     CONCAT(c.last_name,' ',c.first_name) AS 'Customers name',
     CONCAT(e.last_name, ' ',e.first_name) AS 'Employees name',
     o.order_date,
     o.ship_address
FROM
	orders o
    INNER JOIN employees e ON e.id = o.employee_id
    INNER JOIN customers c ON c.id  = o.customer_id
WHERE
    MONTH(o.order_date) = 1    
 ;   
    
-- 5)1. Zeig alle Northwind Traders Dried Produkte, die über 15.0000 sind, nicht discontinued sind und mit Check bezahlt wurden.
SELECT
    prd.product_name,
    od.quantity,
    prd.discontinued,
    o.payment_type
    
FROM
    products prd
    INNER JOIN order_details od ON prd.id = od.product_id
    INNER JOIN orders o ON o.id = od.order_id  
WHERE
    prd.product_name like 'Northwind Traders Dried%' AND
    prd.discontinued != 1 AND
    od.quantity > 15.000
    AND o.payment_type = 'Check'
;  


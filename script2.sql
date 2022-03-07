-- ------------------------------------------------------
-- Consulta por tipo y documento de productos vendidos
-- ------------------------------------------------------

SELECT pro_id, pro_name,supplier
FROM product
INNER JOIN sale ON product.pro_id = sale.product_pro_id
WHERE cus_type_id = 'CC' AND cus_id ='1036980789';

-- ----------------------------------
-- Consulta de productos por Nombre
-- ----------------------------------

SELECT pro_name,supplier
FROM product
WHERE pro_name = 'Aceite de canola'
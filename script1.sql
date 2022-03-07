CREATE SCHEMA IF NOT EXISTS store DEFAULT CHARACTER SET utf8 ;
USE store;
-- -----------------------------------------------
--        Se crea tabla de productos
-- -----------------------------------------------
CREATE TABLE IF NOT EXISTS product (
  pro_id INT NOT NULL AUTO_INCREMENT,
  pro_name VARCHAR(60) NOT NULL,
  supplier VARCHAR(45) NOT NULL,
  pro_sale_quantity INT NULL,
  update_at DATETIME NOT NULL,
  delete_at DATETIME NULL,
  PRIMARY KEY (pro_id))
ENGINE = InnoDB;

-- -----------------------------------------------
--        Se crea tabla de ventas
-- -----------------------------------------------

CREATE TABLE IF NOT EXISTS sale (
  sale_id INT NOT NULL AUTO_INCREMENT,
  product_pro_id INT NOT NULL,
  pro_quantity INT NOT NULL,
  cus_type_id VARCHAR(5) NOT NULL,
  cus_id VARCHAR(12) NOT NULL,
  update_at DATETIME NOT NULL,
  delete_at DATETIME NULL,
  PRIMARY KEY (sale_id),
  INDEX fk_sale_product1_idx (product_pro_id ASC) VISIBLE,
  CONSTRAINT fk_sale_product1
    FOREIGN KEY (product_pro_id)
    REFERENCES product (pro_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------
--        Se llena la tabla de productos
-- -----------------------------------------------
INSERT INTO product(pro_name,supplier,update_at)
VALUES ('Arroz','FEDEARROZ', NOW());

INSERT INTO product(pro_name,supplier,update_at)
VALUES ('Frijol','Fundacion Frijoles Magicos Colombia', NOW());

INSERT INTO product(pro_name,supplier,update_at)
VALUES ('Leche','Colanta', NOW());

INSERT INTO product(pro_name,supplier,update_at)
VALUES ('Panal de Huevos AA','Avinal', NOW());

INSERT INTO product(pro_name,supplier,update_at)
VALUES ('Lentejas','Distrinal Colombia', NOW());

INSERT INTO product(pro_name,supplier,update_at)
VALUES ('Panela','Fedepanela', NOW());

INSERT INTO product(pro_name,supplier,update_at)
VALUES ('Aceite de oliva','Aceites Ybarra', NOW());

INSERT INTO product(pro_name,supplier,update_at)
VALUES ('Salchicha ranchera','Zenu', NOW());

INSERT INTO product(pro_name,supplier,update_at)
VALUES ('Aguardiente Antioqueño','FLA', NOW());

INSERT INTO product(pro_name,supplier,update_at)
VALUES ('Cerveza ClubColombia','Babaria', NOW());

-- ----------------------------------
-- Llenado de tablas de ventas
-- ----------------------------------

INSERT INTO sale(product_pro_id, pro_quantity, cus_type_id, cus_id, update_at)
VALUES (3,2,'CC','1036980321',NOW());

INSERT INTO sale(product_pro_id, pro_quantity, cus_type_id, cus_id, update_at)
VALUES (1,2,'CC','1036230321',NOW());

INSERT INTO sale(product_pro_id, pro_quantity, cus_type_id, cus_id, update_at)
VALUES (9,4,'CC','1036980789',NOW());

INSERT INTO sale(product_pro_id, pro_quantity, cus_type_id, cus_id, update_at)
VALUES (8,1,'CC','1040980321',NOW());

INSERT INTO sale(product_pro_id, pro_quantity, cus_type_id, cus_id, update_at)
VALUES (6,5,'CC','1040980325',NOW());

INSERT INTO sale(product_pro_id, pro_quantity, cus_type_id, cus_id, update_at)
VALUES (7,4,'CC','1036980321',NOW());

SELECT pro_id, pro_name,supplier
FROM product
WHERE pro_id = 8 OR pro_id =1 OR pro_id = 7;

-- ----------------------------
-- Actualización de productos
-- ----------------------------

UPDATE product
SET pro_name = 'Salchicha Rica', supplier = 'Rica'
WHERE pro_id = 8;

UPDATE product
SET pro_name = 'Arroz Premium', supplier = 'Castellano'
WHERE pro_id = 1;

UPDATE product
SET pro_name = 'Aceite de canola', supplier = 'SUPRACEITES S.A'
WHERE pro_id = 7;

-- -----------------------------
-- Borrado Lógico
-- -----------------------------

UPDATE sale
SET delete_at = NOW()
WHERE sale_id= 5;

UPDATE sale
SET delete_at = NOW()
WHERE sale_id= 3;

-- -----------------------
-- Borrado físico
-- -----------------------

DELETE FROM sale
WHERE sale_id = 2 OR sale_id = 5;

DELETE FROM sale
WHERE sale_id = 7;
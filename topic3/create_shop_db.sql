drop database if exists shop;
create database shop;
use shop;

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '�������� �������',
  UNIQUE unique_name(name(10))
) COMMENT = '������� ��������-��������';

INSERT INTO catalogs VALUES
  (NULL, '����������'),
  (NULL, '����������� �����'),
  (NULL, '����������'),
  (NULL, '������� �����'),
  (NULL, '����������� ������');

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '��� ����������',
  birthday_at DATE COMMENT '���� ��������',
  created_at varchar(64) ,
  updated_at varchar(64)
  /*,created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP*/
  
) COMMENT = '����������';

INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES
  ('��������', '1990-10-05','20.10.2017 8:10','02.11.2017 13:10'),
  ('�������', '1984-11-12','21.10.2017 8:10','03.11.2017 13:10'),
  ('���������', '1985-05-20','22.10.2017 8:10','04.11.2017 13:10'),
  ('������', '1988-02-14','23.10.2017 8:10','05.11.2017 13:10'),
  ('����', '1998-01-12','24.10.2017 8:10','06.11.2017 13:10'),
  ('�����', '1992-08-29','25.10.2017 8:10','07.11.2017 13:10');

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '��������',
  description TEXT COMMENT '��������',
  price DECIMAL (11,2) COMMENT '����',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id (catalog_id)
) COMMENT = '�������� �������';

INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  ('Intel Core i3-8100', '��������� ��� ���������� ������������ �����������, ���������� �� ��������� Intel.', 7890.00, 1),
  ('Intel Core i5-7400', '��������� ��� ���������� ������������ �����������, ���������� �� ��������� Intel.', 12700.00, 1),
  ('AMD FX-8320E', '��������� ��� ���������� ������������ �����������, ���������� �� ��������� AMD.', 4780.00, 1),
  ('AMD FX-8320', '��������� ��� ���������� ������������ �����������, ���������� �� ��������� AMD.', 7120.00, 1),
  ('ASUS ROG MAXIMUS X HERO', '����������� ����� ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
  ('Gigabyte H310M S2H', '����������� ����� Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2),
  ('MSI B250M GAMING PRO', '����������� ����� MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id BIGINT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id),
  FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT = '������';
INSERT INTO shop.orders (user_id,created_at,updated_at) VALUES 
(2,'2000-03-05 19:48:11.000','1993-06-26 15:50:11.000')
,(1,'2017-09-15 04:43:59.000','2000-04-09 06:19:23.000')
,(4,'2006-04-14 04:04:24.000','1981-03-18 10:26:59.000')
,(1,'1992-06-24 18:45:57.000','2018-01-01 18:53:21.000')
,(4,'2012-09-25 17:10:15.000','2017-07-08 15:03:05.000')
,(1,'1998-08-19 22:30:09.000','1984-11-20 19:54:39.000')
,(3,'1991-08-01 13:21:02.000','1990-03-13 10:32:20.000')
,(4,'1996-01-23 21:38:31.000','1990-04-20 16:44:36.000')
,(1,'1989-07-29 12:12:49.000','1983-04-04 16:20:37.000')
,(3,'1990-06-18 06:55:03.000','2017-01-27 09:25:01.000')
;

DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
  id SERIAL PRIMARY KEY,
  order_id INT UNSIGNED,
  product_id INT UNSIGNED,
  total INT UNSIGNED DEFAULT 1 COMMENT '���������� ���������� �������� �������',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = '������ ������';

DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
  id SERIAL PRIMARY KEY,
  user_id INT UNSIGNED,
  product_id INT UNSIGNED,
  discount FLOAT UNSIGNED COMMENT '�������� ������ �� 0.0 �� 1.0',
  started_at DATETIME,
  finished_at DATETIME,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id),
  KEY index_of_product_id(product_id)
) COMMENT = '������';

DROP TABLE IF EXISTS storehouses;
CREATE TABLE storehouses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '��������',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = '������';

INSERT INTO shop.storehouses (name) VALUES 
('�����1');

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT '����� �������� ������� �� ������',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = '������ �� ������';

INSERT INTO shop.storehouses_products (storehouse_id, product_id, value) VALUES 
(1,1,100),
(1,2,200),
(1,3,300),
(1,6,0),
(1,7,0);
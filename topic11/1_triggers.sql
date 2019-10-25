-- Создайте таблицу logs типа Archive. 
-- Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs помещается 
-- время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.
 
use shop;
drop table if exists logs;
create table logs (
	id bigint not null auto_increment primary key, 
	date_inserted datetime, 
	table_name varchar(16),
	id_inserted bigint, 
	name_inserted varchar(255)) ENGINE=ARCHIVE;

drop trigger if exists tr_catalogs_add;
CREATE TRIGGER tr_catalogs_add
AFTER INSERT
ON catalogs FOR EACH ROW
	insert into logs(date_inserted,table_name,id_inserted,name_inserted)
		select now(),'catalogs', id, name from catalogs order by id desc limit 1;

drop trigger if exists tr_users_add;
CREATE TRIGGER tr_users_add
AFTER INSERT
ON users FOR EACH ROW
	insert into logs(date_inserted,table_name,id_inserted,name_inserted)
		select now(),'users', id, name from users order by id desc limit 1;
		
drop trigger if exists tr_products_add;
CREATE TRIGGER tr_products_add
AFTER INSERT
ON products FOR EACH ROW
	insert into logs(date_inserted,table_name,id_inserted,name_inserted)
		select now(),'products', id, name from products order by id desc limit 1;

/*����� -- ������ ����� ������������ �� shop �� ������������ ������� create_shop_db.sql */


/*������������ ������� �� ���� ����������, ����������, ���������� � �����������*/

 /* ������� 1
 * ����� � ������� users ���� created_at � updated_at ��������� ��������������. 
 * ��������� �� �������� ����� � ��������.*/

use shop;
update users
set created_at = current_timestamp(), updated_at = current_timestamp();



/*����� -- ������ ����� ������������ �� shop �� ������������ ������� create_shop_db.sql, ����� �������� ��������� � ������� 1
 * 
 * ������� 2
 * ������� users ���� �������� ��������������. 
 * ������ created_at � updated_at ���� ������ ����� VARCHAR � � ��� ������ ����� ���������� �������� � ������� "20.10.2017 8:10". 
 * ���������� ������������� ���� � ���� DATETIME, �������� �������� ����� ��������. */

/* ������� -- ����� -- ������ ����� ������������ �� shop �� ������������ ������� create_shop_db.sql
 * �����, ������ �������� �������� ������������ ������ � �����, ������������� ��������� �������, � �������� ������� �������: */
alter table users 
add column created_at_old varchar(32);
alter table users 
add column updated_at_old varchar(32);

update users 
set created_at_old = created_at, updated_at_old = updated_at;
update users 
set created_at = null, updated_at = null;

/* ������ ��� ������ � �������� �������� */
ALTER TABLE shop.users MODIFY COLUMN created_at DATETIME NULL;
ALTER TABLE shop.users MODIFY COLUMN updated_at DATETIME NULL;

/*��������� � �������� ���� ����������������� �� ������ � ������ DATETIME ��������*/
update users
set created_at = STR_TO_DATE(created_at_old,'%d.%m.%Y %H:%i'), updated_at = STR_TO_DATE(updated_at_old,'%d.%m.%Y %H:%i');

/*������� 3
� ������� ��������� ������� storehouses_products � ���� value ����� ����������� ����� ������ �����: 
0, ���� ����� ���������� � ���� ����, ���� �� ������ ������� ������. 
���������� ������������� ������ ����� �������, ����� ��� ���������� � ������� ���������� �������� value. 
������, ������� ������ ������ ���������� � �����, ����� ���� �������.*/

drop temporary table if exists storehouses_products_new;
create temporary table storehouses_products_new as (
	select * from storehouses_products where value > 0 order by value asc);
insert into storehouses_products_new
	select * from storehouses_products where value = 0;

select * from storehouses_products_new;

/*������� 4 (�� �������) 
�� ������� users ���������� ������� �������������, ���������� � ������� � ���. 
������ ������ � ���� ������ ���������� �������� ('may', 'august')*/

select name, birthday_at
from users 
where monthname(birthday_at) in ('may', 'august');

/*������� 5 (�� �������) 
�� ������� catalogs ����������� ������ ��� ������ �������. 
SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
������������ ������ � �������, �������� � ������ IN*/

SELECT * FROM catalogs WHERE id IN (5, 1, 2)
order by field(id, 5, 1, 2);
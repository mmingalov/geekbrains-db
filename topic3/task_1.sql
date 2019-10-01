
/*ВАЖНО -- первым делом пересоберите БД shop из приложенного скрипта create_shop_db.sql */


/*Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение*/

 /* ЗАДАНИЕ 1
 * Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
 * Заполните их текущими датой и временем.*/

use shop;
update users
set created_at = current_timestamp(), updated_at = current_timestamp();



/*ВАЖНО -- первым делом пересоберите БД shop из приложенного скрипта create_shop_db.sql, чтобы откатить изменения в ЗАДАНИЕ 1
 * 
 * ЗАДАНИЕ 2
 * Таблица users была неудачно спроектирована. 
 * Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". 
 * Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения. */

/* РЕШЕНИЕ -- ВАЖНО -- первым делом пересоберите БД shop из приложенного скрипта create_shop_db.sql
 * Далее, сперва сохраним исходные неправильные данные в новые, дополнительно созданные столбцы, а исходные столбцы очистим: */
alter table users 
add column created_at_old varchar(32);
alter table users 
add column updated_at_old varchar(32);

update users 
set created_at_old = created_at, updated_at_old = updated_at;
update users 
set created_at = null, updated_at = null;

/* меняем тип данных у исходных столбцов */
ALTER TABLE shop.users MODIFY COLUMN created_at DATETIME NULL;
ALTER TABLE shop.users MODIFY COLUMN updated_at DATETIME NULL;

/*вписываем в исходные поля сконвертированные из строки в формат DATETIME значения*/
update users
set created_at = STR_TO_DATE(created_at_old,'%d.%m.%Y %H:%i'), updated_at = STR_TO_DATE(updated_at_old,'%d.%m.%Y %H:%i');

/*ЗАДАНИЕ 3
В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
0, если товар закончился и выше нуля, если на складе имеются запасы. 
Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
Однако, нулевые запасы должны выводиться в конце, после всех записей.*/

drop temporary table if exists storehouses_products_new;
create temporary table storehouses_products_new as (
	select * from storehouses_products where value > 0 order by value asc);
insert into storehouses_products_new
	select * from storehouses_products where value = 0;

select * from storehouses_products_new;

/*ЗАДАНИЕ 4 (по желанию) 
Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
Месяцы заданы в виде списка английских названий ('may', 'august')*/

select name, birthday_at
from users 
where monthname(birthday_at) in ('may', 'august');

/*ЗАДАНИЕ 5 (по желанию) 
Из таблицы catalogs извлекаются записи при помощи запроса. 
SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
Отсортируйте записи в порядке, заданном в списке IN*/

SELECT * FROM catalogs WHERE id IN (5, 1, 2)
order by field(id, 5, 1, 2);
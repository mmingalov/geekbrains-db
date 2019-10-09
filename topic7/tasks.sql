/* 1
* Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
*/
use shop;
select distinct user_id from orders; 

/* 2
 * Выведите список товаров products и разделов catalogs, который соответствует товару.
 */
select p.name, c.name
from products p inner join catalogs c on p.catalog_id = c.id;

/* 3
 * (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
 * Поля from, to и label содержат английские названия городов, поле name — русское. 
 * Выведите список рейсов flights с русскими названиями городов.
 */
select
	f.[id]
	,(select name fromm cities where label = F.[from]) as [from]
	,(select name fromm cities where label = F.[to]) as [from]
from flights F

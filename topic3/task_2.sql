/*Практическое задание теме Агрегация данных*/

/* ЗАДАНИЕ 1
 * 
 * Подсчитайте средний возраст пользователей в таблице users*/
select avg(year(current_date)-year(birthday_at))
from users;


/* ЗАДАНИЕ 2
 * 
 * Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
  Следует учесть, что необходимы дни недели текущего года, а не года рождения.*/
with T as (
select dayname(birthday_at) as DAYNAME_DOB,
	birthday_at as DOB,
	year(current_date) - year(birthday_at) as YEARS_DIFF, 
	date_add(birthday_at, interval (year(current_date) - year(birthday_at)) YEAR) as DOB_THISYEAR,
	dayname(date_add(birthday_at, interval (year(current_date) - year(birthday_at)) YEAR)) as DAYNAME_DOB_THISYEAR
from users)

select DAYNAME_DOB_THISYEAR, count(DAYNAME_DOB_THISYEAR)
from T
group by DAYNAME_DOB_THISYEAR;

/* ЗАДАНИЕ 3 (по желанию) 
 * Подсчитайте произведение чисел в столбце таблицы*/

SELECT EXP(SUM(LOG(id))) FROM users;


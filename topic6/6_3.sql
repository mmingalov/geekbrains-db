use vk;

/*
3. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
*/

-- найдем множество самых молодых пользователей
with U as (
	select user_id, birthday
	from profiles
	order by birthday desc
	limit 10
)


select count(L.id)
from media M inner join likes L on M.id = L.media_id
where M.user_id in (select user_id from U); -- из таблицы media нас интересуют только тот контент, автор которого из множества U 
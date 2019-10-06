use vk;

/*
5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
*/

-- РЕШЕНИЕ: представим активность как сумму исходящих лайков, исходящих запросов в друзья и исходящих сообщений

with ACTIVITY as (
-- запросы на добавление в друзья
select initiator_user_id as USER_ID
from friend_requests
union all

-- исходящие сообщения
select from_user_id
from messages
union all

-- исходящие лайки
select user_id
from likes
)

select USER_ID, count(USER_ID)
from ACTIVITY
group by USER_ID
order by count(USER_ID) desc
limit 10;
/*
2. Пусть задан некоторый пользователь. 
Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.*/

use vk;
-- declare @user as BIGINT;
set @user = 1;

select U as USER_ID, count(id) as TOTAL_MSG
-- количество общения с нашим пользователем посчитаем как сумму всех прочитанных сообщений, в которых наш пользователь был и автором и получателем сообщений
from (
		select to_user_id as U, id from messages where from_user_id = @user and is_read = 1
		 union
		select from_user_id , id  from messages where to_user_id = @user and is_read = 1
 ) as T
 group by U
 order by count(id) desc
 limit 1;
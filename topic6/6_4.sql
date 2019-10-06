use vk;
/*
 * 4. Определить кто больше поставил лайков (всего) - мужчины или женщины?
 */
select 
	-- P.gender,
	CASE (P.gender)
         WHEN 'm' THEN 'male'
         WHEN 'f' THEN 'female'
    END AS gender2,
	count(L.id)
from profiles P inner join likes L on P.user_id = L.user_id
group by P.gender
order by count(L.id) desc
limit 1
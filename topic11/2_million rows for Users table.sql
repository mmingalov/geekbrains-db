/*
 * Создайте SQL-запрос, который помещает в таблицу users миллион записей
 */

use shop;

drop procedure if exists MILL;
DELIMITER $$
$$
CREATE PROCEDURE MILL(in N bigint)
begin
	set @i = N;
	while @i>0 DO 
		insert into users(name)
			select concat('user_',@i);
		set @i = @i-1;
	end while;
END$$
DELIMITER ;

-- для тестирования лучше указать число поменьше
-- call MILL(1000000);
call MILL(10);


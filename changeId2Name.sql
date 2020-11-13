alter table poetries modify column poet_id varchar(255);
DELIMITER //
DROP PROCEDURE IF EXISTS changeId2Name;
CREATE PROCEDURE changeId2Name() 
begin 
    declare thisid int;
    declare thisname varchar(255) character set utf8;
    declare done int default 0;
    declare cur cursor for select distinct id from poets;
    declare continue handler for not found set done = 1;
    open cur;
    while done != 1 do
        fetch cur into thisid;
        if done != 1 then
            begin
            select name into thisname from poets where id = thisid;
            update poetries set poet_id = thisname where poet_id = convert(thisid using utf8) collate utf8_unicode_ci;
            end;
        end if;    
    end while;
    close cur;
end//  
delimiter ; 
call changeId2Name();
DROP PROCEDURE IF EXISTS changeId2Name;

-------------------------------------------
-- Первая транзакция, начисляет проценты --
-------------------------------------------

begin isolation level repeatable read;

update 
	accounts
set 
	balance = balance + (select sum(balance) from accounts where client = 'bob') * 0.1
where 
	id = 1;

select * from accounts where client = 'bob';

--------------------------------------------------------
-- Здесь останавливаемся, запускаем вторую транзакцию --
--------------------------------------------------------

commit;
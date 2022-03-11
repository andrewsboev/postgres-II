CREATE EXTENSION pageinspect;

begin isolation level repeatable read;

SELECT txid_current ();

commit;

select version();
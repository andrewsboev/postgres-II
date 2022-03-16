show data_directory;

SELECT oid from pg_database WHERE datname = 'evrika_staff';
SELECT relname, relfilenode FROM pg_class WHERE relname = 'accounts';

SELECT pg_relation_filepath('accounts');
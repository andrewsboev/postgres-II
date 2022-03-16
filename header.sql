create extension if not exists pageinspect;

select 
	lower, 
	upper, 
	special, 
	pagesize
from 
	page_header(get_raw_page('accounts',0));
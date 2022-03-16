drop function if exists heap_page;

create function heap_page(relname text, pageno integer)
	returns table
	(
		ctid tid, 
		xmin text, 
		xmax text, 
		xmin_committed bool, 
		xmin_aborted bool, 
		xmax_committed bool, 
		xmax_aborted bool
	)
	as $$
		select 
			(pageno,lp)::text::tid as ctid,
			
			t_xmin || case
							when(t_infomask & 256) > 0 then ' c'
							when(t_infomask & 512) > 0 then ' a'
							else ''
					  end as xmin,
					  
			t_xmax || case
							when (t_infomask & 1024) > 0 then ' c'
							when (t_infomask & 2048) > 0 then ' a'
					  else ''
					  end as xmax,
					  
			(t_infomask & 256) > 0 as xmin_committed,
			(t_infomask & 512) > 0 as xmin_aborted,
			(t_infomask & 1024) > 0 as xmax_committed,
			(t_infomask & 2048) > 0 as xmax_aborted
			
		from heap_page_items(get_raw_page(relname,pageno))
		order by lp;
		$$ language sql;
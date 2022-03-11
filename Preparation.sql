drop table if exists accounts;

create table if not exists accounts 
(
	id int not null,
	client text not null,
	balance decimal not null,
	constraint pk_id primary key (id)
);

insert into accounts values (1, 'bob', 100), 
							(2, 'bob', 900), 
							(3, 'alice', 500);
							
select * from accounts;			
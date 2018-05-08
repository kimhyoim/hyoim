drop table gust;

create table gust(
	num		number(7)		not null,
	id		varchar(10)		not null,
	content	varchar(500)	not null,
	wdate	date			not null,
	primary key(num)
);

select * from gust;


--create
insert into gust(num, id, content, wdate)
values((select (nvl(max(num),0)+1) as num from gust)
,'','',sysdate);

--update
update gust
set content=''
where num=1;

--read
select num, id, content, wdate
from gust
where num=1;

--list
select id, content, wdate, r
from(
	select id, content, wdate, rownum as r
	from(
		select id, content, wdate
		from gust
		where id like '%제%'
		order by num;
	)
)
where r>=1 and r<=5;

--delete
delete gust
where num=1;

--total
select count(*) from gust
where id like '%홍%';








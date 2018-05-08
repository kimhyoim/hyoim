drop table itin;

create table itin(
	num		number(7)		not null,
	id		varchar(20)		not null,
	site	varchar(50)		not null,
	lat		varchar(10)		default '37.565',
	lng		varchar(10)		default '126.975',
	period	varchar(100)	default '',
	content	varchar(4000)	not null,
	wdate	date			not null,
	viewcnt	varchar(50)		default 0,
	primary key(num)
);

select * from itin

--list
select num, site, period, id, r
from(
	select num, site, period, id, rownum as r
	from (
		select num, site, period, id
		from itin
		order by num desc;
	)
)
where r>=1 and r<=5;
--create
select (nvl(max(num),0)+1) as num from itin;

insert into itin(num, id, site, period, content, wdate)
values((select (nvl(max(num),0)+1) as num from itin)
,'','','','',sysdate);

--update
update itin
set site='', period='', content='', lat='', lng=''
where num='';

--read
select site, period, content, lat, lng
from itin
where num='';

--delete
delete itin
where num=''

--idCheck
select count(*) as cnt
from itin
where id='';

--upviewcnt
update imgbbs
set viewcnt = viewcnt +1
where num=1;


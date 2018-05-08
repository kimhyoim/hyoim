drop table imgbbs;

create table imgbbs (
	num			number(7)		not null,
	id			varchar(10)		not null,
	mname		varchar(20)		not null,
	title		varchar(150)	not null,
	content		varchar(2000)	not null,
	pw			varchar(50)		not null,
	wdate		date			not null,
	fname		varchar(150)	default 'default.jpg',
	viewcnt		number(7)		default 0,
	filesize	number			default 0,
	primary key(num)
);

--create
insert into imgbbs(num, id, mname, title, content,
					pw, wdate, fname, filesize)
values((select (nvl(max(num),0)+1) as num from imgbbs)
		,'아이디1','작성자1','제목1','내용1','1234',sysdate,'default.jpg','0');

insert into imgbbs(num, id, mname, title, content, pw, wdate, fname, viewcnt, filesize)
values((select (nvl(max(num),0)+1) as num from imgbbs)
		,'아이디2','작성자2','제목2','내용2','1234',sysdate,'default.jpg','0','0');
insert into imgbbs(num, id, mname, title, content, pw, wdate, fname, viewcnt, filesize)
values((select (nvl(max(num),0)+1) as num from imgbbs)
		,'아이디3','작성자3','제목3','내용3','1234',sysdate,'default.jpg','0','0');
insert into imgbbs(num, id, mname, title, content, pw, wdate, fname, viewcnt, filesize)
values((select (nvl(max(num),0)+1) as num from imgbbs)
		,'아이디4','작성자4','제목4','내용4','1234',sysdate,'default.jpg','0','0');
insert into imgbbs(num, id, mname, title, content, pw, wdate, fname, viewcnt, filesize)
values((select (nvl(max(num),0)+1) as num from imgbbs)
		,'아이디5','작성자5','제목5','내용5','1234',sysdate,'default.jpg','0','0');
insert into imgbbs(num, id, mname, title, content, pw, wdate, fname, viewcnt, filesize)
values((select (nvl(max(num),0)+1) as num from imgbbs)
		,'아이디6','작성자6','제목6','내용6','1234',sysdate,'default.jpg','0','0');
insert into imgbbs(num, id, mname, title, content, pw, wdate, fname, viewcnt, filesize)
values((select (nvl(max(num),0)+1) as num from imgbbs)
		,'아이디7','작성자7','제목7','내용7','1234',sysdate,'default.jpg','0','0');

--list
select num, title, mname, fname, r
from(
	select num, title, mname, fname, rownum as r
	from(
		select num, title, mname, fname
		from imgbbs
		where title like '%제%'
		order by num desc
	)
)
where r>=1 and r<=5;

--update
update imgbbs
set content='', title='', fname=''
where imgno=1;

--delete
delete imgbbs
where imgno=1;

--read
select fname, title, content
from imgbbs
where imgno;

select * from imgbbs

--viewcnt
update imgbbs
set viewcnt = viewcnt +1
where num=1;

select * from imgbbs








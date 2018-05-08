drop table homemember;

create table homemember(
	id			varchar(20)	not null,
	passwd		varchar(20)	not null,
	email		varchar(40)	not null,
	tel			varchar(20)	not null,
	grade		char(1)		default 'H',
	primary key(id)
);

--create
insert into HomeMember(id, passwd, email, tel, grade)
values('user1','1234','user1@mail.com','010-1111-1111','H');

--admim
insert into HomeMember(id, passwd, email, tel, grade)
values('admin','admin1234','user1@mail.com','010-1111-1111','A');


--update
update homemember
set passwd='12345', tel='010-1111-1112',email='user1@mail.net'
where id='user1';


--delete
delete homemember
where id='user1';

--read
select id, email, tel
from homemember
where id='user1';

select passwd
from homemember
where id='user1';

--list
select id, email, tel, grade, r
from(
	select id, email, tel, grade, rownum as r
	from(
		select id, email.tel,grade
		from homemember
		order by id desc
	)
)
where r>=1 and r<=5;

--duplicate
select count(id)
from homemember
where id='user1';

select * from homemember;


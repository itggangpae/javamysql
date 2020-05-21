show databases;

use mysql;

show tables;

create database sample;

show databases;

use sample;

create table contact (
num integer auto_increment primary key,
name char(20),
address varchar(100),
tel char(20),
email char(100),
birthday date  
)ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

alter table contact add age int;

desc contact;

alter table contact drop age;

desc contact;

alter table contact change tel phone int;

drop table contact;

--회원테이블
create table usertbl(
userid char(15) not null primary key,
name varchar(20) not null,
birthyear int not null, 
addr char(100),
mobile char(11),
mdate date)ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--구매테이블
create table buytbl(
num int auto_increment primary key,
userid char(8) not null,
productname char(10),
groupname char(10),
price int not null,
amount int not null,
foreign key (userid) references usertbl(userid) on delete cascade)ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--데이터 삽입
insert into usertbl values('kty', '김태연',1989,'전주','01011111111', '1989-3-9');
insert into usertbl values('bsj', '배수지',1994,'광주','01022222222', '1994-10-10');
insert into usertbl values('ksh', '김설현',1995,'부천','01033333333', '1995-1-3');
insert into usertbl values('bjh', '배주현',1991,'대구','01044444444', '1991-3-29');
insert into usertbl values('ghr', '구하라',1991,'광주','01055555555', '1991-1-13');
insert into usertbl values('san', '산다라박',1984,'부산','01066666666', '1984-11-12');
insert into usertbl values('jsm', '전소미',2001,'캐나다','01077777777', '2001-3-9');
insert into usertbl values('lhl', '이효리',1979,'서울','01088888888', '1979-5-10');
insert into usertbl values('iyou', '아이유',1993,'서울','01099999999', '1993-5-19');
insert into usertbl values('ailee', '에일리',1989,'미국','01000000000', '1989-5-30');

commit;

insert into buytbl values(null, 'kty', '운동화', '잡화', 30, 2);
insert into buytbl values(null, 'kty', '노트북', '전자', 1000, 1);
insert into buytbl values(null, 'jsm', '운동화', '잡화', 30, 1);
insert into buytbl values(null, 'lhl', '모니터', '전자', 200, 1);
insert into buytbl values(null, 'bsj', '모니터', '전자', 200, 1);
insert into buytbl values(null, 'kty', '청바지', '잡화', 100, 1);
insert into buytbl values(null, 'lhl', '책', '서적', 15, 2);
insert into buytbl values(null, 'iyou', '책', '서적', 15, 7);
insert into buytbl values(null, 'iyou', '컴퓨터', '전자', 500, 1);
insert into buytbl values(null, 'bsj', '노트북', '전자', 1000, 1);
insert into buytbl values(null, 'bjh', '메모리', '전자', 50, 4);
insert into buytbl values(null, 'ailee', '운동화', '잡화', 30, 2);
insert into buytbl values(null, 'ghr', '운동화', '잡화', 30, 1);

commit;

show tables;


select *
from usertbl;

select *
from buytbl;

select *
from usertbl 
where name='김태연';

select *
from usertbl 
where birthyear >= 1990 and addr = '서울';

select *
from usertbl 
where birthyear >= 1990 or addr = '서울';

select *
from usertbl 
where birthyear >= 1990 and birthyear <= 1993;

select *
from usertbl 
where name like '%라%';

select *
from usertbl 
where name like '배%';

SELECT * FROM userTbl 
WHERE birthyear >= 
	(SELECT birthyear FROM userTbl WHERE name = '김태연');

select userid
from buytbl
where productname in (select productname from buytbl where userid = 'kty');

SELECT * 
FROM USERTBL 
WHERE birthyear < 1990
LIMIT 2;

select *
from buytbl;

select count(*)
from buytbl;

select avg(amount)
from buytbl;

select avg(amount)
from buytbl
group by userid;

select userid
from buytbl
group by userid
having count(userid) >= 3;


select *
from usertbl
order by birthyear ;

select *
from usertbl
order by birthyear, name desc ;

select userid, round(avg(amount),0)
from buytbl
group by userid;

select concat(name, birthyear)
from usertbl;

select CURRENT_DATE(); 
select CURRENT_TIME(); 
select CURRENT_TIMESTAMP(); 

select STR_TO_DATE('1986-05-05 11:00:00', '%Y-%m-%d %H:%i:%S') ;

select datediff(CURRENT_DATE(), STR_TO_DATE('1986-05-05', '%Y-%m-%d')) ;

desc usertbl;

select * 
from usertbl;

insert into usertbl(userid, name, birthyear, addr, mobile, mdate)
values('kjn', '제니', 1996, '서울', '01012341234', str_to_date('1996-01-16', '%Y-%m-%d'));

update usertbl 
set name='김제니'
where userid = 'kjn';

delete from usertbl 
where userid = 'kjn';

select *
from usertbl, buytbl;

select *
from usertbl cross join buytbl;

select *
from usertbl, buytbl
where usertbl.userid  = buytbl.userid;

select *
from usertbl inner join buytbl on usertbl.userid = buytbl .userid;

select *
from usertbl natural join buytbl;

select *
from usertbl left outer join buytbl on usertbl.userid = buytbl .userid;

explain select *
from usertbl
where userid = 'kty';

explain select *
from usertbl
where addr = '서울';

create index idx_addr
on usertbl(addr);

explain select *
from usertbl
where addr = '서울';

drop index idx_addr on usertbl; 


create or REPLACE view GroupView 
AS
select groupname, sum(amount)
from buytbl
group by groupname;

select *
from GroupView;


DELIMITER // 
CREATE PROCEDURE myproc(vuserid char(15), vname varchar(20)CHARACTER set utf8, vbirthyear int(11),	
vaddr char(100)CHARACTER set utf8, vmobile char(11), vmdate date) 
begin
	INSERT INTO USERTBL 
	VALUES(vuserid, vname, vbirthyear, vaddr, vmobile, vmdate);
end //
DELIMITER ;

call myproc('BoA', '권보아', 1986, '남양주', '01012341234', '1986-11-5');

SELECT * FROM USERTBL;



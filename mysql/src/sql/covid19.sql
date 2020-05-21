use sample;

create table covid19(
	num int primary key,
	region varchar(30) not null,
	nation varchar(30) not null,
	pop int not null,
	confirmcount int not null,
	deathcount int not null)engine=innodb default charset=utf8;


insert into covid19(num, region, nation, pop, confirmcount, deathcount)
	values(1, '아메리카', '미국', 331002647, 1486376, 89550);

insert into covid19(num, region, nation, pop, confirmcount, deathcount)
	values(2, '유럽', '러시아', 145934460, 281752, 9709);

commit;

select * from covid19;




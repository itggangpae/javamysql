create database sample;

use sample;

create table Goods (
    code    char(5) not null, 
    name    varchar(50) not null, 
    manufacture   varchar(20), 
    price    int not null, 
    primary key(code)
)ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- 샘플 데이터 입력
insert into Goods values('001', 'apple', 'korea', 1500);
insert into Goods values('002', 'watermelon', 'korea', 15000);
insert into Goods values('003', 'oriental melon', 'korea', 1000);
insert into Goods values('004', 'banana', 'philippines', 500);
insert into Goods values('005', 'lemon', 'korea', 1500);
insert into Goods values('006', 'mango', 'taiwan', 700);

commit;

select * from Goods;

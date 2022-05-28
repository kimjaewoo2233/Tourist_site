

select * from user;

create table myfile(

		id int auto_increment primary key,
		name varchar(20) not null,
		title varchar(50) not null,
		content TEXT not null,
		ofile varchar(100) default '없음' ,
		sfile varchar(100) default '없음',
	  DateCreated DATETIME DEFAULT NOW()
);
drop table myfile;

create table user(
		id bigint auto_increment primary key,
		username varchar(20) not null,
		password varchar(20) not null,
		email varchar(20) not null,
	    DateCreated DATETIME DEFAULT NOW()
);
insert into user(username,password,email) VALUES ("test","1234","ta3844@naver.com");
desc myfile;
select * from myfile;
drop table myfile;

create table Member(
	id VARCHAR(20) NOT NULL,
	passwd VARCHAR(20),
	name VARCHAR(30),
	PRIMARY KEY(id)
);
select * from user;
drop table Member;

drop database if exists  ponavljanjepp23;

create database ponavljanjepp23;

use ponavljanjepp23;

create table apartman(
	sifra int not null primary key auto_increment,
	naziv varchar(30),
	kapacitet int
);

create table gost(
	sifra int not null primary key auto_increment,
	ime varchar(30) not null,
	prezime varchar(30) not null,
	datum datetime
);

create table boravak(
	gost int not null,
	apartman int not null
);

alter table boravak add foreign key (gost) references gost(sifra);
alter table boravak add foreign key (apartman) references apartman(sifra);

insert into apartman (naziv) values ('Marija');

select * from apartman;

update apartman set naziv='marijA'
where sifra =1;

select * from apartman;

insert into gost (ime,prezime) values ('Kornelija','Z');

select * from gost;

#unesi da je Kornelija da je boravila u apartmanu marijA

insert into boravak (gost,apartman) values (1,1);

select * from boravak;



#unesi ime drugog gosta Denis Z

insert into gost (ime,prezime) values ('Denis','Z');

select * from gost;


# Denis je boravio u apartmanu marijA

insert into boravak (gost,apartman) values (2,1);

select * from boravak;

#odabrati imena i prezimena gostiju u apartmanu marija

select a.ime, a.prezime 
from gost a
inner join boravak b on b.gost =a.sifra 
inner join apartman c on b.apartman =c.sifra 
where c.naziv ='marijA';

drop database if exists ponavljanjepp23;

create database ponavljanjepp23;

use ponavljanjepp23;

create table korisnik(
	sifra int not null primary key auto_increment,
	ime varchar(30) not null,
	prezime varchar(30) not null,
	datumrodjenja datetime
);

drop table proizvod;
create table proizvod(
	sifra int not null primary key auto_increment,
	cijena decimal(18.2) not null,
	naziv varchar(30),
	korisnik int,
	dostupan boolean
);

alter table proizvod add foreign key (korisnik) references korisnik(sifra);

#unijeti marija zimska posjeduje bicik i role
#unijet ana gal posjeduje mobitel

insert into korisnik (ime,prezime) values ('ana','gal'), ('marija','zimska');

select * from korisnik;

insert into proizvod (cijena,naziv,korisnik) values ('2.2','bicikl',2), ('2.1','role',2), ('3.2','mobitel',1);

select * from proizvod;

#promjeni mob u sat

update proizvod set naziv='sat' where sifra=3;

delete from proizvod where sifra=3;

select k.ime, k.prezime, p.naziv
from korisnik k
inner join proizvod p on k.sifra= p.korisnik;


#primjer


create table apartman(
	sifra int not null primary key auto_increment,
	naziv varchar(30),
	kapaciteti int
	
);

create table gost(
	sifra int not null primary key auto_increment,
	ime varchar(30) not null,
	prezime varchar(30) not null,
	datum datetime
);

create table boravak(
	apartman int not null,
	gost int not null
);

alter table boravak add foreign key (apartman) references apartman(sifra);
alter table boravak add foreign key (gost) references gost(sifra);

insert into apartman (naziv) values ('marija');

select * from apartman;

update apartman set naziv='Marija' where sifra=1;

insert into gost (ime,prezime) values ('Zrinka','Stolac');

insert into boravak (gost,apartman) values (1,1);

insert into gost (ime,prezime) values ('Marija','Stolac');

select * from gost;
insert into boravak (gost,apartman) values (2,1);

select distinct a.prezime 
from gost a
inner join boravak b on a.sifra = b.gost 
inner join apartman c on c.sifra = b.apartman 
where c.naziv = 'Marija';
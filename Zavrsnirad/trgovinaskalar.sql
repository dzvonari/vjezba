drop database if exists trgovinaskalar;

create database  trgovinaskalar;

use  trgovinaskalar;

create table trgovina(
	sifra int not null primary key auto_increment,
	djelatnik int not null,
	kupac int not null,
	proizvod int not null,
	datum_kupnje datetime
);

create table proizvod(
	sifra int not null primary key auto_increment,
	naziv varchar(50),
	cijena decimal(18.2),
	opis varchar(70)
);

create table kupac(
	sifra int not null primary key auto_increment,
	ime varchar(20) not null,
	prezime varchar(30) not null,
	email varchar(30),
	mobitel char(10)
);

create table djelatnik(
	sifra int not null primary key auto_increment,
	ime varchar(20) not null,
	prezime varchar(30) not null,
	iban char(13)
);

alter table trgovina add foreign key (djelatnik) references djelatnik(sifra);
alter table trgovina add foreign key (kupac) references kupac(sifra);
alter table trgovina add foreign key (proizvod) references proizvod(sifra);

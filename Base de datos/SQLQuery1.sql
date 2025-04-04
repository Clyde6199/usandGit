create database Prueba
go
use Prueba
go
create table University
(
id int primary key identity (1,1),
name varchar (100),
)
create table Career
(
id int primary key identity (1,1),
name varchar (200),
tiny_name varchar (10),
)
create table Person
(
id int primary key identity (1,1),
name varchar (100),
surname varchar (100),
age int,
gender char(1),
)
create table [Group]
(
id int primary key identity (1,1),
name char (1),
grade int,
turn char (1),
)
create table Subject
(
id int primary key identity (1,1),
name varchar (150),
description varchar (300),
)
create table Student
(
id int primary key identity (1,1),
serial_number char(10)
)

insert into university values ('Universidad Jose Vasconcelos');
insert into university values ('Universidad Tecnologica de Tijuana');

insert into career values ('Ingenieria en Desarrollo de software y multimedia', 'IDSM');
insert into career values ('Ingenieria eb Tecnologias de la informacion y comunicacaion', 'TIC');

insert into Person values ('Balganon Duran Jairo Amed', 19, 'M');

SELECT * FROM Career;
select name, surname, age from Person
select * from Person WHERE age = 27

update Person set age = 26 where age = 27

delete from Person where age = 26

alter table Career add university_id int references University(id)
alter table [Group]add career_id int references Career(id)
alter table Subject add career_id int references Career(id)
alter table Student add person_id int references Person(id)
alter table Student add group_id int references [Group](id)
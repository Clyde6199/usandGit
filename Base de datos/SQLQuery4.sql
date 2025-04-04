use Prueba
go
create table Grade
(
id int primary key identity (1,1),
score float,
student_id int references Student(id),
group_id int references [Group](id)
)
Create table Materias
(
id int primary key identity (1,1),
name varchar (100),from
)
insert into Materias values ('Matematicas');
insert into Materias values ('Ingles');
alter table Materias delete group_id references [Group](id)
SELECT * FROM Materias;
select name, surname, age from Person
select * from Person WHERE age = 19
Select * from Materias 
Select * from Stu

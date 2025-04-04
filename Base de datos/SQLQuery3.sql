use Prueba
go
insert into Person values ('Ali', 19 'F')
insert into Person values ('Jorge', 'Losoya', 19 'M')
insert into Person values ('Ashley', 'Ashton', 19 'F'  )
insert into Person values ('Vanesa', 'Alvares' 19, 'F')
insert into Person values ('Jairo Amed', 'Balgañon Duran', 19 'M')

insert into Student(serial_number,group_id,person_id)
values ('1234674391', 1,4
insert into Student(serial_number,group_id,person_id)
values ('1234674392', 1,5
insert into Student(serial_number,group_id,person_id)
values ('1234674393', 1,6
insert into Student(serial_number,group_id,person_id)
values ('1234674394', 1,7
insert into Student(serial_number,group_id,person_id)
values ('1234674395', 1,8

select s.id, p.name,p.surname,s.serial_number,g.name,g.grade,
c.name as carrera, u.name as university from
Person as  p inner join Student as s
on p.id = s.person_id inner join [Group] as g on g.id = s.group_id
inner join Career as c on g.career_id = c.id
inner join University as u on u.id = c.university_id



Select * from Person
Select * from Career
Select * from University

creat procedure update_valance_process
(
@quanity int,
@id int,
@action varchar
)
as
if @action = 'retiro'
update Person set age =
(select age from 
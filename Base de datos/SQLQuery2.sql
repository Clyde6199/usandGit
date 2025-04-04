select * from University
update University set name 'Universidad Jose Vasconcelos' where id = 1

insert into career values ('Ingenieria en Desarrollo de software y multimedia', 'IDSM',1);
insert into career values ('Ingenieria eb Tecnologias de la informacion y comunicacaion', 'TIC',2);

select name, university_id from Career;

insert into Person values ('Jose Leonardo', 'Galindo Miranda', 28, 'M');
insert into Person Values ('Moises', 'Lozano', 27, 'M');

insert into [Group] VALUES ('A', 2, 'M',1)
insert into [Group] VALUES ('B',5, 'M' ,1)

insert into Student (serial_number,group_id,person_id) values ('0315108652' ,1,1)
insert into Student (serial_number,group_id,person_id) values ('0315108656' ,1,2)

insert into Subject values('Programacion web', 'desarrollo con javascript', 1)
insert into Subject values('Taller de animacion', 'Modelado con blender', 1)

select p.name, p.surname,s.serial_number,g.name, c.name from Person as p inner join Student as s
on p.id = s.person_id
inner join [Group] AS G on G.id = s group_id
inner join [Group| AS C on C.id = G.career_id

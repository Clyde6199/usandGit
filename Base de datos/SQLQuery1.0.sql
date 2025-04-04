create procedure show_subject_id
as
select s.id,s.name as materia,
c.name as carrera,u.name as universidad
from Subject as s inner join Career as c
on c.id = s.career id inner join University as u
on u.id = c.university_id

execute show_subject_id
create procedure show_group_and_student_id
as
   select s.id as student_id,
p.name,p.surname
from person as p inner join student as s
on s.person_id = p.id
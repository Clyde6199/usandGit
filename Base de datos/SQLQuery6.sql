select p.name, p.surname, s.serial_number,
(g. name ,+ ''+str(g.grade)) as grupo,
c.name as carrera
from Person as p inner join
Student as s on s.person_id = p.id
inner join [Group] as g on g.id = s.group_id
inner join Career as c on c.id = g.career_id
inner join University as u on u.id = c.university_id
inner join Grade AS gr on gr.student_id = s.id
inner join subject as su on su.id = gr.subject_id
where gr.score  < 7
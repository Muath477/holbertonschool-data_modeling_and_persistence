SELECT DISTINCT instructors.name AS instructor_name
FROM instructors
INNER JOIN courses ON courses.instructor_id = instructors.id
WHERE courses.id IN (SELECT course_id FROM registrations)
ORDER BY instructor_name ASC;

SELECT instructors.name AS instructor_name, courses.title AS course_title
FROM instructors
LEFT JOIN courses ON courses.instructor_id = instructors.id
ORDER BY instructor_name ASC, course_title ASC;

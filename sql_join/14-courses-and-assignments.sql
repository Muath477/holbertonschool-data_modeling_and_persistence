SELECT courses.title AS course_title, assignments.title AS assignment_title
FROM courses
LEFT JOIN assignments ON assignments.course_id = courses.id
ORDER BY course_title ASC, assignment_title ASC;

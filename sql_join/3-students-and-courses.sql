SELECT students.name AS student_name, courses.title AS course_title
FROM students
INNER JOIN enrollments ON enrollments.student_id = students.id
INNER JOIN courses ON courses.id = enrollments.course_id
ORDER BY student_name ASC, course_title ASC;

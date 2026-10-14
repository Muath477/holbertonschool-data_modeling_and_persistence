SELECT DISTINCT name AS student_name
FROM students
WHERE id IN (SELECT student_id FROM registrations)
ORDER BY student_name ASC;

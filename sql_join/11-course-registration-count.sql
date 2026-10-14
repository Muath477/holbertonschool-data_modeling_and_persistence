SELECT courses.title AS course_title, COUNT(registrations.student_id) AS registration_count
FROM courses
LEFT JOIN registrations ON registrations.course_id = courses.id
GROUP BY courses.id, courses.title
ORDER BY registration_count DESC, course_title ASC;

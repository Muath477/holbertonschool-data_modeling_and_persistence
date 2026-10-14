SELECT courses.title AS course_title, COUNT(enrollments.student_id) AS enrollment_count
FROM courses
LEFT JOIN enrollments ON enrollments.course_id = courses.id
GROUP BY courses.id, courses.title
ORDER BY enrollment_count DESC, course_title ASC;

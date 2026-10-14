SELECT courses.title AS course_title
FROM courses
INNER JOIN assignments ON assignments.course_id = courses.id
GROUP BY courses.id, courses.title
HAVING COUNT(assignments.id) > (
    SELECT AVG(assignment_count)
    FROM (
        SELECT COUNT(*) AS assignment_count
        FROM assignments
        GROUP BY course_id
    )
)
ORDER BY course_title ASC;

# SQL - Joins & Relationships

Practice with table relationships (1-N, N-N through a junction table), INNER
and LEFT joins, GROUP BY with COUNT, and subqueries, using SQLite.

Tasks 1 to 7 run on `library.db` (authors, books, students, courses,
enrollments). Tasks 8 to 15 run on `academy.db` (instructors, courses,
assignments, students, registrations).

## Files

| File | Description |
| --- | --- |
| `1-books-with-authors.sql` | INNER JOIN: `title`, `author_name`, ordered by title. |
| `2-authors-with-books.sql` | LEFT JOIN from authors, so authors without books appear with a NULL title. |
| `3-students-and-courses.sql` | INNER JOIN across students, enrollments and courses. |
| `4-courses-and-students.sql` | LEFT JOIN from courses, so courses without students appear. |
| `5-students-with-enrollments.sql` | Students enrolled in at least one course, using `IN` with a subquery. |
| `6-courses-above-average.sql` | Courses whose enrollment count is above the average per enrolled course. |
| `7-course-enrollment-count.sql` | Enrollment count per course (0 for empty courses), most enrolled first. |
| `8-courses-and-instructors.sql` | INNER JOIN: each course with its instructor. |
| `9-instructors-and-courses.sql` | LEFT JOIN from instructors, so instructors without courses appear. |
| `10-students-and-registered-courses.sql` | INNER JOIN across students, registrations and courses. |
| `11-course-registration-count.sql` | Registration count per course (0 for empty courses), most registered first. |
| `12-students-with-registrations.sql` | Students with at least one registration, each listed once. |
| `13-courses-above-average-assignments.sql` | Courses with more assignments than the average per course. |
| `14-courses-and-assignments.sql` | LEFT JOIN from courses, so courses without assignments appear. |
| `15-instructors-with-active-courses.sql` | Instructors with at least one course that has a registered student, each listed once. |

## Usage

```
sqlite3 library.db < 1-books-with-authors.sql
sqlite3 academy.db < 8-courses-and-instructors.sql
```

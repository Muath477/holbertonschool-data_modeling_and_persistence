DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS instructors;
DROP TABLE IF EXISTS students;

CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    student_name TEXT NOT NULL,
    student_email TEXT NOT NULL UNIQUE
);

CREATE TABLE instructors (
    instructor_id INTEGER PRIMARY KEY,
    instructor_name TEXT NOT NULL,
    instructor_email TEXT NOT NULL UNIQUE
);

CREATE TABLE courses (
    course_id TEXT PRIMARY KEY,
    course_name TEXT NOT NULL,
    instructor_id INTEGER NOT NULL,
    FOREIGN KEY (instructor_id) REFERENCES instructors (instructor_id)
);

CREATE TABLE enrollments (
    student_id INTEGER NOT NULL,
    course_id TEXT NOT NULL,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students (student_id),
    FOREIGN KEY (course_id) REFERENCES courses (course_id)
);

INSERT INTO students (student_id, student_name, student_email)
SELECT DISTINCT student_id, student_name, student_email
FROM student_courses;

INSERT INTO instructors (instructor_name, instructor_email)
SELECT DISTINCT instructor_name, instructor_email
FROM student_courses
ORDER BY instructor_email;

INSERT INTO courses (course_id, course_name, instructor_id)
SELECT DISTINCT student_courses.course_id, student_courses.course_name,
    instructors.instructor_id
FROM student_courses
INNER JOIN instructors
    ON instructors.instructor_email = student_courses.instructor_email;

INSERT INTO enrollments (student_id, course_id)
SELECT student_id, course_id
FROM student_courses;

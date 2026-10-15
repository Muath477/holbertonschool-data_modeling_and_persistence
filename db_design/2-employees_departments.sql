DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    department_id INTEGER PRIMARY KEY,
    department_name TEXT NOT NULL UNIQUE,
    department_location TEXT NOT NULL,
    department_manager_email TEXT NOT NULL
);

CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    employee_name TEXT NOT NULL,
    employee_email TEXT NOT NULL UNIQUE,
    department_id INTEGER NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments (department_id)
);

INSERT INTO departments (department_id, department_name, department_location,
    department_manager_email)
SELECT DISTINCT department_id, department_name, department_location,
    department_manager_email
FROM employees_departments;

INSERT INTO employees (employee_id, employee_name, employee_email,
    department_id)
SELECT employee_id, employee_name, employee_email, department_id
FROM employees_departments;

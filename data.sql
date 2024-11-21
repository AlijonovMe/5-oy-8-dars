-- DELETE TABLES IF EXISTS
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS projects;

-- 1. 
CREATE TABLE IF NOT EXISTS departments (
    id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- 2.
CREATE TABLE IF NOT EXISTS employees (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    position VARCHAR(50),
    salary NUMERIC(10, 2),
    hire_date DATE DEFAULT CURRENT_DATE,
    department_id INTEGER REFERENCES departments(id)
);

-- 3. 

CREATE TABLE IF NOT EXISTS projects (
    id SERIAL PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE DEFAULT CURRENT_DATE,
    end_date DATE DEFAULT CURRENT_DATE,
    budget NUMERIC(10, 2)
);


-- departments
INSERT INTO departments (department_name) VALUES
('Administration'),
('IT'),
('Design');

-- employees
INSERT INTO employees (first_name, last_name, position, salary, hire_date, department_id) VALUES
('Ali', 'Karimov', 'Manager', 3000, '2020-03-15', 1),
('Nodira', 'Toirova', 'Developer', 2500, '2021-05-10', 2),
('Shoxruh', 'Abdullayev', 'Designer', 2200, '2022-01-22', 3),
('Zarina', 'Abdullayeva', 'HR Specialist', 1800, '2019-11-11', 1),
('Jasur', 'Aliyev', 'Developer', 2400, '2023-02-01', 2);

-- projects
INSERT INTO projects (project_name, start_date, end_date, budget) VALUES
('New Website', '2023-01-10', '2023-06-30', 50000),
('Mobile App', '2022-08-15', '2023-03-20', 30000),
('CRM System', '2024-02-01', NULL, 60000);

-- 1

SELECT first_name ||' '|| last_name AS "Full Name", position, salary, hire_date, department_id FROM employees;

-- 2

SELECT * FROM employees ORDER BY salary DESC;

-- 3

SELECT * FROM employees WHERE salary > 2500.00;

-- 4 

SELECT * FROM employees ORDER BY salary DESC LIMIT 3;

-- 5

SELECT * FROM employees WHERE salary IN (2400.00, 3000.00);

-- 6

SELECT * FROM employees WHERE salary BETWEEN 2000 and 3000;

-- 7

SELECT * FROM employees WHERE first_name LIKE '%a%';

-- 8

SELECT * FROM projects WHERE end_date IS NULL;

-- 9

SELECT department_id, AVG(salary) AS salary FROM employees GROUP BY department_id;
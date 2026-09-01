-- ============================================================
-- 01: Table Creation, Data Types, and Relational Constraints
-- ============================================================

DROP DATABASE IF EXISTS hr_schema_demo;
CREATE DATABASE hr_schema_demo;
USE hr_schema_demo;

-- Parent Table: Departments
CREATE TABLE departments (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL UNIQUE,
    location VARCHAR(100) DEFAULT 'Remote',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Child Table: Employees with explicit constraints
CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    salary DECIMAL(10, 2) NOT NULL CHECK (salary >= 15000.00),
    hire_date DATE NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    dept_id INT,
    CONSTRAINT fk_emp_dept 
        FOREIGN KEY (dept_id) 
        REFERENCES departments(dept_id) 
        ON DELETE SET NULL 
        ON UPDATE CASCADE
);

-- Verification
DESCRIBE departments;
DESCRIBE employees;

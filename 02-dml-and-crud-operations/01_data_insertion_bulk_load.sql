USE company_db;

-- 1. Single Insert
INSERT INTO departments (dept_name) VALUES ('IT');

-- 2. Bulk Insert (Multiple rows)
INSERT INTO departments (dept_name) VALUES 
('HR'),
('Finance'),
('Marketing');

-- 3. Insert Employees Data
INSERT INTO employees (emp_name, email, salary, dept_id) VALUES 
('Suryaa', 'suryaa@example.com', 75000.00, 1),
('Anitha', 'anitha@example.com', 70000.00, 1),
('Karthik', 'karthik@example.com', 50000.00, 2),
('Priya', 'priya@example.com', 60000.00, 3);
